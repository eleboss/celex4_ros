# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/Documents/celex4_ros/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/Documents/celex4_ros/build

# Include any dependencies generated for this target.
include celex4/CMakeFiles/cam_pub.dir/depend.make

# Include the progress variables for this target.
include celex4/CMakeFiles/cam_pub.dir/progress.make

# Include the compile flags for this target's objects.
include celex4/CMakeFiles/cam_pub.dir/flags.make

celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o: celex4/CMakeFiles/cam_pub.dir/flags.make
celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o: /home/ubuntu/Documents/celex4_ros/src/celex4/src/cam_pub.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Documents/celex4_ros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o"
	cd /home/ubuntu/Documents/celex4_ros/build/celex4 && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o -c /home/ubuntu/Documents/celex4_ros/src/celex4/src/cam_pub.cpp

celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cam_pub.dir/src/cam_pub.cpp.i"
	cd /home/ubuntu/Documents/celex4_ros/build/celex4 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Documents/celex4_ros/src/celex4/src/cam_pub.cpp > CMakeFiles/cam_pub.dir/src/cam_pub.cpp.i

celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cam_pub.dir/src/cam_pub.cpp.s"
	cd /home/ubuntu/Documents/celex4_ros/build/celex4 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Documents/celex4_ros/src/celex4/src/cam_pub.cpp -o CMakeFiles/cam_pub.dir/src/cam_pub.cpp.s

celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o.requires:

.PHONY : celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o.requires

celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o.provides: celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o.requires
	$(MAKE) -f celex4/CMakeFiles/cam_pub.dir/build.make celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o.provides.build
.PHONY : celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o.provides

celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o.provides.build: celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o


# Object files for target cam_pub
cam_pub_OBJECTS = \
"CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o"

# External object files for target cam_pub
cam_pub_EXTERNAL_OBJECTS =

/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: celex4/CMakeFiles/cam_pub.dir/build.make
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/libcv_bridge.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_core3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgproc3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgcodecs3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /home/ubuntu/Documents/tunnelplane/devel/lib/libimage_transport.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/libmessage_filters.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/libclass_loader.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/libPocoFoundation.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libdl.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/libroscpp.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/librosconsole.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/libroslib.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/librospack.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libpython2.7.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/librostime.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/libcpp_common.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_stitching3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_superres3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_videostab3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_aruco3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_bgsegm3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_bioinspired3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_ccalib3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_cvv3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_dpm3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_face3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_fuzzy3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_hdf3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_img_hash3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_line_descriptor3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_optflow3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_reg3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_rgbd3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_saliency3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_stereo3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_structured_light3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_surface_matching3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_tracking3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_xfeatures2d3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_ximgproc3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_xobjdetect3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_xphoto3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /home/ubuntu/Documents/celex4_ros/devel/lib/libCelex.a
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /home/ubuntu/Documents/celex4_ros/src/celex4/lib/libokFrontPanel.so
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /home/ubuntu/Documents/celex4_ros/src/celex4/lib/libudev.so.0
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_shape3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_photo3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_datasets3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_plot3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_text3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_dnn3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_ml3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_video3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_calib3d3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_features2d3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_highgui3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_videoio3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_viz3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_phase_unwrapping3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_flann3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgcodecs3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_objdetect3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgproc3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_core3.so.3.3.1
/home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub: celex4/CMakeFiles/cam_pub.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/Documents/celex4_ros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub"
	cd /home/ubuntu/Documents/celex4_ros/build/celex4 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cam_pub.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
celex4/CMakeFiles/cam_pub.dir/build: /home/ubuntu/Documents/celex4_ros/devel/lib/celex4/cam_pub

.PHONY : celex4/CMakeFiles/cam_pub.dir/build

celex4/CMakeFiles/cam_pub.dir/requires: celex4/CMakeFiles/cam_pub.dir/src/cam_pub.cpp.o.requires

.PHONY : celex4/CMakeFiles/cam_pub.dir/requires

celex4/CMakeFiles/cam_pub.dir/clean:
	cd /home/ubuntu/Documents/celex4_ros/build/celex4 && $(CMAKE_COMMAND) -P CMakeFiles/cam_pub.dir/cmake_clean.cmake
.PHONY : celex4/CMakeFiles/cam_pub.dir/clean

celex4/CMakeFiles/cam_pub.dir/depend:
	cd /home/ubuntu/Documents/celex4_ros/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/Documents/celex4_ros/src /home/ubuntu/Documents/celex4_ros/src/celex4 /home/ubuntu/Documents/celex4_ros/build /home/ubuntu/Documents/celex4_ros/build/celex4 /home/ubuntu/Documents/celex4_ros/build/celex4/CMakeFiles/cam_pub.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : celex4/CMakeFiles/cam_pub.dir/depend

