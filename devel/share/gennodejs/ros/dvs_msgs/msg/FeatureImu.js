// Auto-generated. Do not edit!

// (in-package dvs_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class FeatureImu {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.feature = null;
      this.imus = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('feature')) {
        this.feature = initObj.feature
      }
      else {
        this.feature = new sensor_msgs.msg.PointCloud();
      }
      if (initObj.hasOwnProperty('imus')) {
        this.imus = initObj.imus
      }
      else {
        this.imus = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FeatureImu
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [feature]
    bufferOffset = sensor_msgs.msg.PointCloud.serialize(obj.feature, buffer, bufferOffset);
    // Serialize message field [imus]
    // Serialize the length for message field [imus]
    bufferOffset = _serializer.uint32(obj.imus.length, buffer, bufferOffset);
    obj.imus.forEach((val) => {
      bufferOffset = sensor_msgs.msg.Imu.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FeatureImu
    let len;
    let data = new FeatureImu(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [feature]
    data.feature = sensor_msgs.msg.PointCloud.deserialize(buffer, bufferOffset);
    // Deserialize message field [imus]
    // Deserialize array length for message field [imus]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.imus = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.imus[i] = sensor_msgs.msg.Imu.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += sensor_msgs.msg.PointCloud.getMessageSize(object.feature);
    object.imus.forEach((val) => {
      length += sensor_msgs.msg.Imu.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dvs_msgs/FeatureImu';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '955ab36e507926f41ce802b0490d517f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    #   "u", "v" - row and column (respectively) in the left stereo image.
    #              This is opposite to usual conventions but remains for
    #              historical reasons. The newer PointCloud2 message has no
    #              such problem.
    #   "rgb" - For point clouds produced by color stereo cameras. uint8
    #           (R,G,B) values packed into the least significant 24 bits,
    #           in order.
    #   "intensity" - laser or pixel intensity.
    #   "distance"
    
    # The channel name should give semantics of the channel (e.g.
    # "intensity" instead of "value").
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
    # A covariance matrix of all zeros will be interpreted as "covariance unknown", and to use the
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FeatureImu(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.feature !== undefined) {
      resolved.feature = sensor_msgs.msg.PointCloud.Resolve(msg.feature)
    }
    else {
      resolved.feature = new sensor_msgs.msg.PointCloud()
    }

    if (msg.imus !== undefined) {
      resolved.imus = new Array(msg.imus.length);
      for (let i = 0; i < resolved.imus.length; ++i) {
        resolved.imus[i] = sensor_msgs.msg.Imu.Resolve(msg.imus[i]);
      }
    }
    else {
      resolved.imus = []
    }

    return resolved;
    }
};

module.exports = FeatureImu;
