import cv2
import numpy as np
import os
import random
imagepath='/home/ubuntu/Documents/VINS/data/s6d/'
txtpath='/home/ubuntu/Documents/VINS/data/shape_6dof_dvs/'
image=img=np.zeros([180,240],np.uint8)
image2=img=np.zeros([180,240],np.uint8)


for i in range(100,1000):
    dict1={}
    dict2={}
    file=open(txtpath+'/%d.txt'%i)
    lines=file.read().split('\n')
    for line in lines:
        f=line.split(' ')
        if f[0]=='Header':
            time=float(f[2])
            filelists=os.listdir(imagepath)
            filelists.sort()
            for fileid in range(len(filelists)-1):
                imgtime=float(filelists[fileid][0:16])
                imgtimenext=float(filelists[fileid+1][0:16])
                if (time>=imgtime and  time<imgtimenext):
                    image=cv2.imread(imagepath+filelists[fileid])
                    image2=cv2.imread(imagepath+filelists[fileid+1])
                    break
        if f[0]=='Feature':
            dict1['%s'%f[1]]=(int(float(f[4])),int(float(f[5])))
            # cv2.circle(image,(int(float(f[4])),int(float(f[5]))),1,(255,0,0))
    file.close()
    file=open(txtpath+'/%d.txt'%(i+1))
    lines=file.read().split('\n')
    for line in lines:
        f=line.split(' ')
        if f[0]=='Feature':
            dict2['%s'%f[1]]=(int(float(f[4])+240),int(float(f[5])))

    imagefus=img=np.zeros([180,480,3],np.uint8)
    imagefus[:,0:240,:]=image
    imagefus[:,240:480,:]=image2
    for item in dict1:
        if dict2.has_key(item):
            cv2.circle(imagefus,dict1[item],1,(255,0,0))
            cv2.circle(imagefus,dict2[item],1,(255,0,0))
            cv2.line(imagefus,dict1[item],dict2[item],(random.randint(100, 255),random.randint(100, 255),random.randint(100, 255)),1)
        else:
            cv2.circle(imagefus,dict1[item],1,(0,255,0))
    cv2.line(imagefus,(240,0),(240,180),(random.randint(100, 255),random.randint(100, 255),random.randint(100, 255)),1)
    imagefus2=cv2.pyrUp(imagefus)
    
    cv2.imshow('i',imagefus2)
    cv2.waitKey(0)
