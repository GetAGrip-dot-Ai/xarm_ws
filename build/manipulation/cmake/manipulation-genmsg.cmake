# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "manipulation: 2 messages, 3 services")

set(MSG_I_FLAGS "-Imanipulation:/home/sridevi/xarm_ws/src/manipulation/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Ishape_msgs:/opt/ros/noetic/share/shape_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(manipulation_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/msg/Obstacle.msg" NAME_WE)
add_custom_target(_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulation" "/home/sridevi/xarm_ws/src/manipulation/msg/Obstacle.msg" "geometry_msgs/Pose:geometry_msgs/Point:shape_msgs/SolidPrimitive:geometry_msgs/Quaternion:std_msgs/Header"
)

get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/msg/dpoi.msg" NAME_WE)
add_custom_target(_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulation" "/home/sridevi/xarm_ws/src/manipulation/msg/dpoi.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/harvest.srv" NAME_WE)
add_custom_target(_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulation" "/home/sridevi/xarm_ws/src/manipulation/srv/harvest.srv" ""
)

get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/multi_frame.srv" NAME_WE)
add_custom_target(_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulation" "/home/sridevi/xarm_ws/src/manipulation/srv/multi_frame.srv" ""
)

get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/visual_servo.srv" NAME_WE)
add_custom_target(_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulation" "/home/sridevi/xarm_ws/src/manipulation/srv/visual_servo.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/shape_msgs/cmake/../msg/SolidPrimitive.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulation
)
_generate_msg_cpp(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/msg/dpoi.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulation
)

### Generating Services
_generate_srv_cpp(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/harvest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulation
)
_generate_srv_cpp(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/multi_frame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulation
)
_generate_srv_cpp(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/visual_servo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulation
)

### Generating Module File
_generate_module_cpp(manipulation
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulation
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(manipulation_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(manipulation_generate_messages manipulation_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/msg/Obstacle.msg" NAME_WE)
add_dependencies(manipulation_generate_messages_cpp _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/msg/dpoi.msg" NAME_WE)
add_dependencies(manipulation_generate_messages_cpp _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/harvest.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_cpp _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/multi_frame.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_cpp _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/visual_servo.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_cpp _manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulation_gencpp)
add_dependencies(manipulation_gencpp manipulation_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulation_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/shape_msgs/cmake/../msg/SolidPrimitive.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulation
)
_generate_msg_eus(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/msg/dpoi.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulation
)

### Generating Services
_generate_srv_eus(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/harvest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulation
)
_generate_srv_eus(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/multi_frame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulation
)
_generate_srv_eus(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/visual_servo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulation
)

### Generating Module File
_generate_module_eus(manipulation
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulation
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(manipulation_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(manipulation_generate_messages manipulation_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/msg/Obstacle.msg" NAME_WE)
add_dependencies(manipulation_generate_messages_eus _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/msg/dpoi.msg" NAME_WE)
add_dependencies(manipulation_generate_messages_eus _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/harvest.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_eus _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/multi_frame.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_eus _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/visual_servo.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_eus _manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulation_geneus)
add_dependencies(manipulation_geneus manipulation_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulation_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/shape_msgs/cmake/../msg/SolidPrimitive.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulation
)
_generate_msg_lisp(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/msg/dpoi.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulation
)

### Generating Services
_generate_srv_lisp(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/harvest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulation
)
_generate_srv_lisp(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/multi_frame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulation
)
_generate_srv_lisp(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/visual_servo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulation
)

### Generating Module File
_generate_module_lisp(manipulation
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulation
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(manipulation_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(manipulation_generate_messages manipulation_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/msg/Obstacle.msg" NAME_WE)
add_dependencies(manipulation_generate_messages_lisp _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/msg/dpoi.msg" NAME_WE)
add_dependencies(manipulation_generate_messages_lisp _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/harvest.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_lisp _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/multi_frame.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_lisp _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/visual_servo.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_lisp _manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulation_genlisp)
add_dependencies(manipulation_genlisp manipulation_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulation_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/shape_msgs/cmake/../msg/SolidPrimitive.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulation
)
_generate_msg_nodejs(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/msg/dpoi.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulation
)

### Generating Services
_generate_srv_nodejs(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/harvest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulation
)
_generate_srv_nodejs(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/multi_frame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulation
)
_generate_srv_nodejs(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/visual_servo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulation
)

### Generating Module File
_generate_module_nodejs(manipulation
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulation
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(manipulation_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(manipulation_generate_messages manipulation_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/msg/Obstacle.msg" NAME_WE)
add_dependencies(manipulation_generate_messages_nodejs _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/msg/dpoi.msg" NAME_WE)
add_dependencies(manipulation_generate_messages_nodejs _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/harvest.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_nodejs _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/multi_frame.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_nodejs _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/visual_servo.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_nodejs _manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulation_gennodejs)
add_dependencies(manipulation_gennodejs manipulation_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulation_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/shape_msgs/cmake/../msg/SolidPrimitive.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulation
)
_generate_msg_py(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/msg/dpoi.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulation
)

### Generating Services
_generate_srv_py(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/harvest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulation
)
_generate_srv_py(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/multi_frame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulation
)
_generate_srv_py(manipulation
  "/home/sridevi/xarm_ws/src/manipulation/srv/visual_servo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulation
)

### Generating Module File
_generate_module_py(manipulation
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulation
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(manipulation_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(manipulation_generate_messages manipulation_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/msg/Obstacle.msg" NAME_WE)
add_dependencies(manipulation_generate_messages_py _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/msg/dpoi.msg" NAME_WE)
add_dependencies(manipulation_generate_messages_py _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/harvest.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_py _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/multi_frame.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_py _manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/manipulation/srv/visual_servo.srv" NAME_WE)
add_dependencies(manipulation_generate_messages_py _manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulation_genpy)
add_dependencies(manipulation_genpy manipulation_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulation_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulation
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(manipulation_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET shape_msgs_generate_messages_cpp)
  add_dependencies(manipulation_generate_messages_cpp shape_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(manipulation_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulation
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(manipulation_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET shape_msgs_generate_messages_eus)
  add_dependencies(manipulation_generate_messages_eus shape_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(manipulation_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulation
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(manipulation_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET shape_msgs_generate_messages_lisp)
  add_dependencies(manipulation_generate_messages_lisp shape_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(manipulation_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulation
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(manipulation_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET shape_msgs_generate_messages_nodejs)
  add_dependencies(manipulation_generate_messages_nodejs shape_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(manipulation_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulation)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulation\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulation
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(manipulation_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET shape_msgs_generate_messages_py)
  add_dependencies(manipulation_generate_messages_py shape_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(manipulation_generate_messages_py geometry_msgs_generate_messages_py)
endif()
