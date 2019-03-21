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
bagin = rosbag.Bag('/home/ubuntu/Documents/VINS/data/shapes_6dof.bag','r')
bagout = rosbag.Bag('/home/ubuntu/Documents/VINS/data/mshapes_6dof.bag','w')

bridge=CvBridge()
for topic,msg,t in bagin.read_messages():
    
    if topic == "/dvs/events":
        img=np.zeros([msg.height,msg.width],np.uint8)
        
        for event_data in msg.events:
            img[event_data.y][event_data.x]=255
        
        cv2.imshow("hh",img)
        cv2.waitKey(1)
        msgout = bridge.cv2_to_imgmsg(img, encoding="mono8")
        bagout.write("/dvs/image_dvs",msgout,msg.events[len(msg.events)-1].ts)
        print msg.events[len(msg.events)-1].ts
    else:
        bagout.write(topic,msg,msg.header.stamp)




