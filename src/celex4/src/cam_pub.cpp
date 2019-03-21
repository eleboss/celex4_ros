#include <opencv2/opencv.hpp>
#include <celex4/celex4.h>
#include <eventproc/fpgadatareader.h>
#include <base/xbase.h>
#include <iostream>
#include <unistd.h>
#include <sys/time.h>
#include <fstream>
#include <list>
#include <thread>
#include <stdio.h>
#include<iomanip>
#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/Imu.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <pthread.h>
#include <cmath>
#include <dvs_msgs/EventArray.h>
#include <dvs_msgs/Event.h>

using namespace std;
using namespace cv;
#define FPGATimeCycle 131072
#define TIME_PER_EVENT (2.0 / 25 / 1000 / 1000)

unsigned int normalizeADC(unsigned int adc)
{
    int brightness = adc;
    int m_uiLowerADC = 0, m_uiUpperADC = 511;
    if (adc < m_uiLowerADC)
        brightness = 0;
    else if (adc > m_uiUpperADC)
        brightness = 255;
    else
        brightness = 255 * (adc - m_uiLowerADC) / (m_uiUpperADC - m_uiLowerADC);
    return brightness;
}

bool setFpnFile(const std::string &fpnFile, int *m_pFpnBuffer)
{
    int index = 0;
    std::ifstream in;
    XBase base;
    string filePath = base.getApplicationDirPath();
    filePath += fpnFile;
    printf("%s",filePath);
    in.open(filePath.c_str());
    if (!in.is_open())
    {
        cout << "Cannot open FPN file : " << filePath << endl;
        return false;
    }
    std::string line;
    while (!in.eof() && index < PIXELS_NUMBER)
    {
        in >> line;
        m_pFpnBuffer[index] = atoi(line.c_str());
        index++;
    }
    if (index != PIXELS_NUMBER)
        return false;

    return true;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "dvs_camera");
    ros::NodeHandle nh;
    ros::NodeHandle private_nh("~");

    emSensorMode sensorMode = EventMode;
    string camera_mode;
    image_transport::ImageTransport it(private_nh);

    image_transport::CameraPublisher pub_image = it.advertiseCamera("/dvs/image_raw", 1);
    
    sensor_msgs::CameraInfoConstPtr camera_info(new sensor_msgs::CameraInfo());

    ros::Publisher pub_imu = nh.advertise<sensor_msgs::Imu>("/dvs/imu", 1);
    ros::Publisher pub_evt = nh.advertise<dvs_msgs::EventArray>("/dvs/events", 1);
    int event_time_stamp = 30;
    private_nh.getParam("event_time", event_time_stamp);
    int clock_rate = 25;
    private_nh.getParam("clock_rate", clock_rate);
    int threshold = 100;
    private_nh.getParam("threshold", threshold);
    int brightness = 300;
    private_nh.getParam("brightness", brightness);
    int contrast = 300;
    private_nh.getParam("contrast", contrast);

    int *a = new int[10];
    CeleX4 *pCelex = new CeleX4;

    if (NULL == pCelex)
        return 0;

    pCelex->openSensor("");
    pCelex->setFpnFile("FPN.txt");

    pCelex->setSensorMode(sensorMode);
    pCelex->setClockRate(clock_rate);
    pCelex->setThreshold(threshold);
    pCelex->setBrightness(brightness);
    pCelex->setContrast(contrast);


    double t_s = getTickCount(), t_e = 0.0;
    int *fpn_file = new int[640 * 768];
    if (!setFpnFile("FPN.txt", fpn_file))
        return 0;
    double mtime = 0.0;
    unsigned long event_count = 0;
    long time_stamp = event_time_stamp * clock_rate * 1000 / 2;

    unsigned char *img_event = new unsigned char[640 * 768];
    memset(img_event, 0, PIXELS_NUMBER);

    FILE *fid1;
	fid1 = fopen("events1.bin", "wb");
    FILE *fid2;
	fid2 = fopen("imu1.bin", "wb");

    uint16_t* m_pLastADC;
    m_pLastADC = new uint16_t[PIXELS_NUMBER];
	for (int i = 0; i < PIXELS_NUMBER; ++i) {
		m_pLastADC[i] = 0;
	}
    int p = 0;
    
    ros::Time img_time;
    ros::Time time_start = ros::Time::now();
    dvs_msgs::EventArray event_msgs;
    event_msgs.height = 640;
    event_msgs.width = 768;
    double evtime=0.0;
    while (ros::ok())
    {
        
        long size = pCelex->getFPGADataSize();
        
        unsigned char *data = new unsigned char[size];
        long length = pCelex->readDataFromFPGA(size, data);

        for (long i = 0; i + 4 <= length; i = i + 4)
        {
            if (FPGADataReader::isIMUData(&data[i]) == FPGADataReader::ACC_OFST_B_DATA)
            {

                IMUData data = FPGADataReader::getIMUData();
                sensor_msgs::Imu imu_msg;
                // double t = mtime + data.t_GYROS * TIME_PER_EVENT;
                imu_msg.header.stamp = time_start + ros::Duration().fromSec(evtime);
                double imuts = imu_msg.header.stamp.toSec();
                //cout<<"t1 = "<<time_start + ros::Duration().fromSec(evtime)<<" t2 = "<<setiosflags(ios::fixed)<<setprecision(4)<<sec<<endl;
                imu_msg.header.frame_id = "dvs_link";
                imu_msg.angular_velocity.x = data.x_GYROS;
                imu_msg.angular_velocity.y = data.y_GYROS;
                imu_msg.angular_velocity.z = data.z_GYROS;
                imu_msg.linear_acceleration.x = data.x_ACC;
                imu_msg.linear_acceleration.y = data.y_ACC;
                imu_msg.linear_acceleration.z = data.z_ACC;
                pub_imu.publish(imu_msg);

                // double imu[7];
				// imu[0] = imuts; imu[1] = data.x_GYROS; imu[2] = data.y_GYROS; imu[3] = data.z_GYROS;
                // imu[4] = data.x_ACC; imu[5] = data.y_ACC; imu[6] = data.z_ACC;
				// fwrite(imu, sizeof(double), 7, fid2);
            }
            if (FPGADataReader::isSpecialEvent(&data[i]))
            {
                mtime += 1.0 * 131072 * TIME_PER_EVENT;
            }
            if (FPGADataReader::isRowEvent(&data[i]))
            {
                FPGADataReader::MapTime(&data[i]);
                unsigned int t = FPGADataReader::getTFromFPGA();
                unsigned int tLast = FPGADataReader::getLastTFromFPGA();
                int diffT = t - tLast;
                if (diffT < 0)
                {
                    diffT = diffT + FPGATimeCycle;
                }
                event_count += diffT;
                FPGADataReader::setEventCounter(t);
            }
            if (FPGADataReader::isColumnEvent(&data[i]))
            {
                unsigned int row = FPGADataReader::getCurrentRow();
                unsigned int col = FPGADataReader::getColumn(&data[i]);
                unsigned int adc = FPGADataReader::getBrightness(&data[i]);
                unsigned int tf = FPGADataReader::getTFromFPGA();

                int index = row * 768 + col;

                int value = normalizeADC(adc) - fpn_file[index];
                if (value < 0)
                    value = 0;
                if (value > 255)
                    value = 255;
                evtime = mtime + tf * TIME_PER_EVENT;
                dvs_msgs::Event evt;
                evt.polarity=value;
                evt.ts=time_start + ros::Duration().fromSec(evtime);
                evt.x=col;
                evt.y=640-row;

                if (adc > m_pLastADC[index])
					p = 1;
				else if (adc < m_pLastADC[index])
					p = -1;
				else
					p = 0;
				m_pLastADC[index] = adc;
                double evts = evt.ts.toSec();
                // double events[5];
				// events[0] = evts; events[1] = col; events[2] = 640-row; events[3] = p;events[4] = value;
				// fwrite(events, sizeof(double), 5, fid1);

                if ((evt.y * 768 + evt.x)>PIXELS_NUMBER)
                    continue;
                if (value >0)
                    event_msgs.events.push_back(evt);
                // *(img_event + evt.y * 768 + evt.x ) = 255;
                if (event_count > time_stamp)
                {
                    event_count = 0;
                    
                    pub_evt.publish(event_msgs);
                    event_msgs.events.clear();
                    // Mat img(640, 768, CV_8UC1, img_event);
                    //cout<<"t1 = "<<evt.ts<<" t2 = "<<setiosflags(ios::fixed)<<setprecision(4)<<evts<<endl;
                    // cv::Mat ele = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(2, 2));
                    // cv::erode(img, img, ele);
                    // cv_bridge::CvImage img_msg;
                    // img_msg.header.stamp = time_start + ros::Duration().fromSec(evtime);
                    // img_msg.header.frame_id = "image";
                    // img_msg.image = img;
                    // img_msg.encoding = sensor_msgs::image_encodings::MONO8;

                    // pub_image.publish(img_msg.toImageMsg(), camera_info);
		            // cv::imshow("img",img);
		            // cv::waitKey(1);
                    memset(img_event, 0, PIXELS_NUMBER);
                }
            }
        }
        delete[] data;
        usleep(500);
    }
    fclose(fid1);
    fclose(fid2);
    if (img_event)
        delete[] img_event;
    return 1;
}
