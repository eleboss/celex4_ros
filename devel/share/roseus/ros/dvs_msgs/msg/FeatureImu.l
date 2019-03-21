;; Auto-generated. Do not edit!


(when (boundp 'dvs_msgs::FeatureImu)
  (if (not (find-package "DVS_MSGS"))
    (make-package "DVS_MSGS"))
  (shadow 'FeatureImu (find-package "DVS_MSGS")))
(unless (find-package "DVS_MSGS::FEATUREIMU")
  (make-package "DVS_MSGS::FEATUREIMU"))

(in-package "ROS")
;;//! \htmlinclude FeatureImu.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass dvs_msgs::FeatureImu
  :super ros::object
  :slots (_header _feature _imus ))

(defmethod dvs_msgs::FeatureImu
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:feature __feature) (instance sensor_msgs::PointCloud :init))
    ((:imus __imus) (let (r) (dotimes (i 0) (push (instance sensor_msgs::Imu :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _feature __feature)
   (setq _imus __imus)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:feature
   (&rest __feature)
   (if (keywordp (car __feature))
       (send* _feature __feature)
     (progn
       (if __feature (setq _feature (car __feature)))
       _feature)))
  (:imus
   (&rest __imus)
   (if (keywordp (car __imus))
       (send* _imus __imus)
     (progn
       (if __imus (setq _imus (car __imus)))
       _imus)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; sensor_msgs/PointCloud _feature
    (send _feature :serialization-length)
    ;; sensor_msgs/Imu[] _imus
    (apply #'+ (send-all _imus :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; sensor_msgs/PointCloud _feature
       (send _feature :serialize s)
     ;; sensor_msgs/Imu[] _imus
     (write-long (length _imus) s)
     (dolist (elem _imus)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; sensor_msgs/PointCloud _feature
     (send _feature :deserialize buf ptr-) (incf ptr- (send _feature :serialization-length))
   ;; sensor_msgs/Imu[] _imus
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _imus (let (r) (dotimes (i n) (push (instance sensor_msgs::Imu :init) r)) r))
     (dolist (elem- _imus)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get dvs_msgs::FeatureImu :md5sum-) "955ab36e507926f41ce802b0490d517f")
(setf (get dvs_msgs::FeatureImu :datatype-) "dvs_msgs/FeatureImu")
(setf (get dvs_msgs::FeatureImu :definition-)
      "Header header
sensor_msgs/PointCloud feature
sensor_msgs/Imu[] imus
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: sensor_msgs/PointCloud
# This message holds a collection of 3d points, plus optional additional
# information about each point.

# Time of sensor data acquisition, coordinate frame ID.
Header header

# Array of 3d points. Each Point32 should be interpreted as a 3d point
# in the frame given in the header.
geometry_msgs/Point32[] points

# Each channel should have the same number of elements as points array,
# and the data in each channel should correspond 1:1 with each point.
# Channel names in common practice are listed in ChannelFloat32.msg.
ChannelFloat32[] channels

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
float32 z
================================================================================
MSG: sensor_msgs/ChannelFloat32
# This message is used by the PointCloud message to hold optional data
# associated with each point in the cloud. The length of the values
# array should be the same as the length of the points array in the
# PointCloud, and each value should be associated with the corresponding
# point.

# Channel names in existing practice include:
#   \"u\", \"v\" - row and column (respectively) in the left stereo image.
#              This is opposite to usual conventions but remains for
#              historical reasons. The newer PointCloud2 message has no
#              such problem.
#   \"rgb\" - For point clouds produced by color stereo cameras. uint8
#           (R,G,B) values packed into the least significant 24 bits,
#           in order.
#   \"intensity\" - laser or pixel intensity.
#   \"distance\"

# The channel name should give semantics of the channel (e.g.
# \"intensity\" instead of \"value\").
string name

# The values array should be 1-1 with the elements of the associated
# PointCloud.
float32[] values

================================================================================
MSG: sensor_msgs/Imu
# This is a message to hold data from an IMU (Inertial Measurement Unit)
#
# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec
#
# If the covariance of the measurement is known, it should be filled in (if all you know is the 
# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)
# A covariance matrix of all zeros will be interpreted as \"covariance unknown\", and to use the
# data a covariance will have to be assumed or gotten from some other source
#
# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation 
# estimate), please set element 0 of the associated covariance matrix to -1
# If you are interpreting this message, please check for a value of -1 in the first element of each 
# covariance matrix, and disregard the associated estimate.

Header header

geometry_msgs/Quaternion orientation
float64[9] orientation_covariance # Row major about x, y, z axes

geometry_msgs/Vector3 angular_velocity
float64[9] angular_velocity_covariance # Row major about x, y, z axes

geometry_msgs/Vector3 linear_acceleration
float64[9] linear_acceleration_covariance # Row major x, y z 

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :dvs_msgs/FeatureImu "955ab36e507926f41ce802b0490d517f")


