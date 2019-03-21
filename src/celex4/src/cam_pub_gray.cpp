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

    emSensorMode sensorMode = FullPictureMode;
    string camera_mode;
    image_transport::ImageTransport it(private_nh);

    image_transport::CameraPublisher pub_image = it.advertiseCamera("/dvs/image_raw", 1);
    
    sensor_msgs::CameraInfoConstPtr camera_info(new sensor_msgs::CameraInfo());

    ros::Publisher pub_imu = nh.advertise<sensor_msgs::Imu>("/dvs/imu", 1);
    ros::Publisher pub_evt = nh.advertise<dvs_msgs::EventArray>("/dvs/events", 1);
    int event_time_stamp =30;
    private_nh.getParam("event_time", event_time_stamp);
    int clock_rate = 25;
    private_nh.getParam("clock_rate", clock_rate);
    int threshold = 100;
    private_nh.getParam("threshold", threshold);
    int brightness = 260;
    private_nh.getParam("brightness", brightness);
    int contrast = 340;
    private_nh.getParam("contrast", contrast);

    int *a = new int[10];
    CeleX4 *pCelex = new CeleX4;

    if (NULL == pCelex)
        return 0;

    pCelex->openSensor("");
    pCelex->setFpnFile("FPN2.txt");

    pCelex->setSensorMode(sensorMode);
    pCelex->setClockRate(clock_rate);
    pCelex->setThreshold(threshold);
    pCelex->setBrightness(brightness);
    pCelex->setContrast(contrast);
    pCelex->setFullPicFrameTime(event_time_stamp);


    double t_s = getTickCount(), t_e = 0.0;
    int *fpn_file = new int[640 * 768];
    if (!setFpnFile("FPN1.txt", fpn_file))
        return 0;
    double mtime = 0.0;
    unsigned long event_count = 0;
    long time_stamp = event_time_stamp * clock_rate * 1000 / 2;

    unsigned char *img_event = new unsigned char[640 * 768];

    memset(img_event, 0, PIXELS_NUMBER);
    
    ros::Time img_time;
    ros::Time imu_time;
    ros::Time time_start = ros::Time::now();
    dvs_msgs::EventArray event_msgs;
    event_msgs.height = 640;
    event_msgs.width = 768;
    double evtime=0.0;
    int frame_cnt=1,imu_cnt=1;
    while (ros::ok())
    {
        
        long size = pCelex->getFPGADataSize();
        
        unsigned char *data = new unsigned char[size];
        long length = pCelex->readDataFromFPGA(size, data);

        for (long i = 0; i + 4 <= length; i = i + 4)
        {
            if (FPGADataReader::isIMUData(&data[i]) == FPGADataReader::GYROS_B_DATA)
            {

                IMUData data = FPGADataReader::getIMUData();
                sensor_msgs::Imu imu_msg;
                // double t = mtime + data.t_GYROS * TIME_PER_EVENT;
                imu_msg.header.stamp = ros::Time::now();//time_start + ros::Duration().fromSec(imu_cnt*0.008192);
		imu_time = ros::Time::now();
                imu_cnt++;
                imu_msg.header.frame_id = "base_link";
                imu_msg.angular_velocity.x = data.y_GYROS;
                imu_msg.angular_velocity.y = data.x_GYROS;
                imu_msg.angular_velocity.z = -data.z_GYROS;
                imu_msg.linear_acceleration.x = -data.y_ACC;
                imu_msg.linear_acceleration.y = -data.x_ACC;
                imu_msg.linear_acceleration.z = data.z_ACC;
                imu_msg.orientation.w = sqrt(data.x_ACC * data.x_ACC + data.y_ACC * data.y_ACC + data.z_ACC * data.z_ACC);
                imu_msg.orientation.x = mtime;
                imu_msg.orientation.y = double(data.t_GYROS);
                pub_imu.publish(imu_msg);
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
                if (((640-row) * 768 + col)>PIXELS_NUMBER)
                    continue;
                evtime = mtime + tf * TIME_PER_EVENT;
                if (row == 0 && col == 0)
                    {
                        memset(img_event, 0, PIXELS_NUMBER);
                        img_time = time_start + ros::Duration().fromSec(frame_cnt*0.03);
                        frame_cnt++;
                    }
                    else if (row == 639 && col == 384)
                    {
                        Mat img(640, 768, CV_8UC1, img_event);
                        // medianBlur(img,img,3);
                        cv_bridge::CvImage img_msg;
                        img_msg.header.stamp = ros::Time::now();//img_time;
			cout<<"img_time = "<<ros::Time::now()<<"  imu_time = "<<imu_time<<endl;
                        img_msg.header.frame_id = "image";
                        img_msg.image = img;
                        img_msg.encoding = sensor_msgs::image_encodings::MONO8;
                        pub_image.publish(img_msg.toImageMsg(), camera_info);
                        //imshow("e", img);
                        static int id = 0;

                        char c = waitKey(1);
                        //if (c == 'z')
                        //{
                            //id++;
                            //char str[1000];
                            //sprintf(str, "/home/ubuntu/Documents/DVS/dvs_slam/data_extract/%d.png", id);
                            //imwrite(str,img);
                        //}
                        memset(img_event, 0, PIXELS_NUMBER);
                    }
                    else
                    {

                        *(img_event + (640-row) * 768 + col ) = value;
                    }
            }
        }

        delete[] data;
        //usleep(500);
    }

    if (img_event)
        delete[] img_event;


    return 1;
}
