#!/usr/bin/env python
import rospy
import roslib
from dvs_msgs.msg import Event
from dvs_msgs.msg import EventArray
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import rosbag

rospy.init_node('dvsmsg')
bagin = rosbag.Bag('/home/ubuntu/Documents/VINS/data/shapes_6dof.bag', 'r')

bridge = CvBridge()
init_t = 0
path = '/home/ubuntu/Downloads/image0.4'
for topic, msg, t in bagin.read_messages():

    if topic == "/dvs/events":
        img = np.zeros([msg.height, msg.width], np.uint8)
        for event_data in msg.events:
            if init_t==0:
                init_t=event_data.ts.to_nsec() % 10000000000000
                init_t=init_t/1000000000.0
            img[event_data.y][event_data.x] = 255

        cv2.imshow("hh", img)
        cv2.waitKey(20)
        msgout = bridge.cv2_to_imgmsg(img, encoding="mono8")

        print msg.events[len(msg.events)-1].ts.to_sec()
        tt = msg.events[len(msg.events)-1].ts.to_nsec() % 10000000000000
        tt = tt/1000000000.0
        k= int((tt-init_t)/0.03)
        imgp=path+'/%d.bmp'% k
        ii=cv2.imread(imgp)
        img90 = cv2.transpose( ii )
        # img90=cv2.flip( ii, 0 )
        cv2.imshow("ii", img90)
        cv2.waitKey(100)
        print k
