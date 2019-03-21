cmake_minimum_required(VERSION 2.8.3)
project(celex4)

## Compile as C++11, supported in ROS Kinetic and newer
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}  -pipe -O3 -std=c++11 -Wall -W -D_REENTRANT -fPIC")
add_definitions("-DTIXML_USE_STL")
SET(CMAKE_BUILD_TYPE Release)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  cv_bridge
  dvs_msgs
  image_transport
  roscpp
  roslib
  sensor_msgs
)

find_package(OpenCV REQUIRED)
find_package(Boost REQUIRED thread)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES celex4
   CATKIN_DEPENDS cv_bridge dvs_msgs image_transport roscpp roslib sensor_msgs
#  DEPENDS system_lib
)

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
    include
    ${catkin_INCLUDE_DIRS}
    ${Boost_INCLUDE_DIRS}
    ${OpenCV_INCLUDE_DIRS})

FILE(GLOB_RECURSE SDK_SRC "${PROJECT_SOURCE_DIR}/include/*.cpp" )


add_library(Celex STATIC ${PROJECT_SOURCE_DIR}/include/eventproc/celex4.cpp ${SDK_SRC})

add_executable(cam_pub src/cam_pub.cpp)

target_link_libraries(cam_pub
${catkin_LIBRARIES}
${OpenCV_LIBS}
${Boost_LIBRARY_DIRS}
Celex
${PROJECT_SOURCE_DIR}/lib/libokFrontPanel.so
${PROJECT_SOURCE_DIR}/lib/libudev.so.0
pthread
)

add_executable(cam_pub_gray src/cam_pub_gray.cpp)

target_link_libraries(cam_pub_gray
${catkin_LIBRARIES}
${OpenCV_LIBS}
${Boost_LIBRARY_DIRS}
Celex
${PROJECT_SOURCE_DIR}/lib/libokFrontPanel.so
${PROJECT_SOURCE_DIR}/lib/libudev.so.0
pthread
)

