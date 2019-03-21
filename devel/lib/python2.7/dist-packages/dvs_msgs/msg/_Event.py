# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from dvs_msgs/Event.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import genpy

class Event(genpy.Message):
  _md5sum = "40d339b261445b8ce9a6fef01267cd5d"
  _type = "dvs_msgs/Event"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """# A DVS event
uint16 x
uint16 y
time ts
bool polarity
"""
  __slots__ = ['x','y','ts','polarity']
  _slot_types = ['uint16','uint16','time','bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       x,y,ts,polarity

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Event, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.x is None:
        self.x = 0
      if self.y is None:
        self.y = 0
      if self.ts is None:
        self.ts = genpy.Time()
      if self.polarity is None:
        self.polarity = False
    else:
      self.x = 0
      self.y = 0
      self.ts = genpy.Time()
      self.polarity = False

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_2H2IB().pack(_x.x, _x.y, _x.ts.secs, _x.ts.nsecs, _x.polarity))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.ts is None:
        self.ts = genpy.Time()
      end = 0
      _x = self
      start = end
      end += 13
      (_x.x, _x.y, _x.ts.secs, _x.ts.nsecs, _x.polarity,) = _get_struct_2H2IB().unpack(str[start:end])
      self.polarity = bool(self.polarity)
      self.ts.canon()
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_2H2IB().pack(_x.x, _x.y, _x.ts.secs, _x.ts.nsecs, _x.polarity))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.ts is None:
        self.ts = genpy.Time()
      end = 0
      _x = self
      start = end
      end += 13
      (_x.x, _x.y, _x.ts.secs, _x.ts.nsecs, _x.polarity,) = _get_struct_2H2IB().unpack(str[start:end])
      self.polarity = bool(self.polarity)
      self.ts.canon()
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2H2IB = None
def _get_struct_2H2IB():
    global _struct_2H2IB
    if _struct_2H2IB is None:
        _struct_2H2IB = struct.Struct("<2H2IB")
    return _struct_2H2IB
