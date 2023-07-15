# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pepper_ws: 1 messages, 3 services")

set(MSG_I_FLAGS "-Ipepper_ws:/home/sridevi/xarm_ws/src/pepper_ws/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Ishape_msgs:/opt/ros/noetic/share/shape_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(pepper_ws_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/msg/Obstacle.msg" NAME_WE)
add_custom_target(_pepper_ws_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pepper_ws" "/home/sridevi/xarm_ws/src/pepper_ws/msg/Obstacle.msg" "shape_msgs/SolidPrimitive:std_msgs/Header:geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/harvest.srv" NAME_WE)
add_custom_target(_pepper_ws_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pepper_ws" "/home/sridevi/xarm_ws/src/pepper_ws/srv/harvest.srv" ""
)

get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/multi_frame.srv" NAME_WE)
add_custom_target(_pepper_ws_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pepper_ws" "/home/sridevi/xarm_ws/src/pepper_ws/srv/multi_frame.srv" ""
)

get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/visual_servo.srv" NAME_WE)
add_custom_target(_pepper_ws_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pepper_ws" "/home/sridevi/xarm_ws/src/pepper_ws/srv/visual_servo.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/shape_msgs/cmake/../msg/SolidPrimitive.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pepper_ws
)

### Generating Services
_generate_srv_cpp(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/harvest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pepper_ws
)
_generate_srv_cpp(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/multi_frame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pepper_ws
)
_generate_srv_cpp(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/visual_servo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pepper_ws
)

### Generating Module File
_generate_module_cpp(pepper_ws
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pepper_ws
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(pepper_ws_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(pepper_ws_generate_messages pepper_ws_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/msg/Obstacle.msg" NAME_WE)
add_dependencies(pepper_ws_generate_messages_cpp _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/harvest.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_cpp _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/multi_frame.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_cpp _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/visual_servo.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_cpp _pepper_ws_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pepper_ws_gencpp)
add_dependencies(pepper_ws_gencpp pepper_ws_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pepper_ws_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/shape_msgs/cmake/../msg/SolidPrimitive.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pepper_ws
)

### Generating Services
_generate_srv_eus(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/harvest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pepper_ws
)
_generate_srv_eus(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/multi_frame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pepper_ws
)
_generate_srv_eus(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/visual_servo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pepper_ws
)

### Generating Module File
_generate_module_eus(pepper_ws
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pepper_ws
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(pepper_ws_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(pepper_ws_generate_messages pepper_ws_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/msg/Obstacle.msg" NAME_WE)
add_dependencies(pepper_ws_generate_messages_eus _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/harvest.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_eus _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/multi_frame.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_eus _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/visual_servo.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_eus _pepper_ws_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pepper_ws_geneus)
add_dependencies(pepper_ws_geneus pepper_ws_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pepper_ws_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/shape_msgs/cmake/../msg/SolidPrimitive.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pepper_ws
)

### Generating Services
_generate_srv_lisp(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/harvest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pepper_ws
)
_generate_srv_lisp(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/multi_frame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pepper_ws
)
_generate_srv_lisp(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/visual_servo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pepper_ws
)

### Generating Module File
_generate_module_lisp(pepper_ws
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pepper_ws
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(pepper_ws_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(pepper_ws_generate_messages pepper_ws_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/msg/Obstacle.msg" NAME_WE)
add_dependencies(pepper_ws_generate_messages_lisp _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/harvest.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_lisp _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/multi_frame.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_lisp _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/visual_servo.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_lisp _pepper_ws_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pepper_ws_genlisp)
add_dependencies(pepper_ws_genlisp pepper_ws_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pepper_ws_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/shape_msgs/cmake/../msg/SolidPrimitive.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pepper_ws
)

### Generating Services
_generate_srv_nodejs(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/harvest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pepper_ws
)
_generate_srv_nodejs(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/multi_frame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pepper_ws
)
_generate_srv_nodejs(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/visual_servo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pepper_ws
)

### Generating Module File
_generate_module_nodejs(pepper_ws
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pepper_ws
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(pepper_ws_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(pepper_ws_generate_messages pepper_ws_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/msg/Obstacle.msg" NAME_WE)
add_dependencies(pepper_ws_generate_messages_nodejs _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/harvest.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_nodejs _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/multi_frame.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_nodejs _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/visual_servo.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_nodejs _pepper_ws_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pepper_ws_gennodejs)
add_dependencies(pepper_ws_gennodejs pepper_ws_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pepper_ws_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/shape_msgs/cmake/../msg/SolidPrimitive.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pepper_ws
)

### Generating Services
_generate_srv_py(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/harvest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pepper_ws
)
_generate_srv_py(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/multi_frame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pepper_ws
)
_generate_srv_py(pepper_ws
  "/home/sridevi/xarm_ws/src/pepper_ws/srv/visual_servo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pepper_ws
)

### Generating Module File
_generate_module_py(pepper_ws
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pepper_ws
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(pepper_ws_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(pepper_ws_generate_messages pepper_ws_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/msg/Obstacle.msg" NAME_WE)
add_dependencies(pepper_ws_generate_messages_py _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/harvest.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_py _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/multi_frame.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_py _pepper_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sridevi/xarm_ws/src/pepper_ws/srv/visual_servo.srv" NAME_WE)
add_dependencies(pepper_ws_generate_messages_py _pepper_ws_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pepper_ws_genpy)
add_dependencies(pepper_ws_genpy pepper_ws_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pepper_ws_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pepper_ws)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pepper_ws
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(pepper_ws_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET shape_msgs_generate_messages_cpp)
  add_dependencies(pepper_ws_generate_messages_cpp shape_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(pepper_ws_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pepper_ws)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pepper_ws
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(pepper_ws_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET shape_msgs_generate_messages_eus)
  add_dependencies(pepper_ws_generate_messages_eus shape_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(pepper_ws_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pepper_ws)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pepper_ws
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(pepper_ws_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET shape_msgs_generate_messages_lisp)
  add_dependencies(pepper_ws_generate_messages_lisp shape_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(pepper_ws_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pepper_ws)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pepper_ws
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(pepper_ws_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET shape_msgs_generate_messages_nodejs)
  add_dependencies(pepper_ws_generate_messages_nodejs shape_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(pepper_ws_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pepper_ws)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pepper_ws\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pepper_ws
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(pepper_ws_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET shape_msgs_generate_messages_py)
  add_dependencies(pepper_ws_generate_messages_py shape_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(pepper_ws_generate_messages_py std_msgs_generate_messages_py)
endif()
