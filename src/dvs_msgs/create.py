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
import os
import time

rospy.init_node('dvsmsg')
t=rospy.Time.from_sec(1468939993.11)
bag = rosbag.Bag('/home/ubuntu/Documents/VINS/data/shapes_6dof_new2.bag','w')

num=1
bridge=CvBridge()
for i in range(900):
    path = '/home/ubuntu/Downloads/image900/%d.bmp' % (i+1)
    frame=cv2.imread(path,cv2.IMREAD_GRAYSCALE)
    img90 = cv2.transpose( frame )
    # cv2.imshow('s',frame)
    # cv2.waitKey(100)
    msg = bridge.cv2_to_imgmsg(img90, encoding="mono8")
    
    msgtime=t+rospy.Duration.from_sec(0.03*(i+1))
    msg.header.stamp=msgtime
    msg.header.seq=i
    msg.header.frame_id='world'
    print msgtime.to_sec()
    bag.write("/dvs/image_new",msg,msg.header.stamp)
