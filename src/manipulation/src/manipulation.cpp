// CMU MRSD Program, course 16-681
// Team GetAGrip.AI
// Team members: Sridevi Kaza, Jiyoon Park, Shri Ishwaryaa S V, Alec Trela, Solomon Fenton
// Rev0: March 15th, 2023
// Code description: Handles all manipulation commands for the SVD

#include <ros/ros.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit_msgs/DisplayRobotState.h>
#include <moveit_msgs/DisplayTrajectory.h>
#include <moveit_visual_tools/moveit_visual_tools.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <string>
#include <std_msgs/Int16.h>
#include <manipulation/visual_servo.h>
#include <manipulation/harvest.h>
#include <manipulation/multi_frame.h>

// Defining your own ROS stream color
namespace pc
{
  enum PRINT_COLOR
  {
    BLACK,
    RED,
    GREEN,
    YELLOW,
    BLUE,
    MAGENTA,
    CYAN,
    WHITE,
    ENDCOLOR
  };

  std::ostream& operator<<(std::ostream& os, PRINT_COLOR c)
  {
    switch(c)
    {
      case BLACK    : os << "\033[1;30m"; break;
      case RED      : os << "\033[1;31m"; break;
      case GREEN    : os << "\033[1;32m"; break;
      case YELLOW   : os << "\033[1;33m"; break;
      case BLUE     : os << "\033[1;34m"; break;
      case MAGENTA  : os << "\033[1;35m"; break;
      case CYAN     : os << "\033[1;36m"; break;
      case WHITE    : os << "\033[1;37m"; break;
      case ENDCOLOR : os << "\033[0m";    break;
      default       : os << "\033[1;37m";
    }
    return os;
  }
} //namespace pc

#define ROS_BLACK_STREAM(x)   ROS_INFO_STREAM(pc::BLACK   << x << pc::ENDCOLOR)
#define ROS_RED_STREAM(x)     ROS_INFO_STREAM(pc::RED     << x << pc::ENDCOLOR)
#define ROS_GREEN_STREAM(x)   ROS_INFO_STREAM(pc::GREEN   << x << pc::ENDCOLOR)
#define ROS_YELLOW_STREAM(x)  ROS_INFO_STREAM(pc::YELLOW  << x << pc::ENDCOLOR)
#define ROS_BLUE_STREAM(x)    ROS_INFO_STREAM(pc::BLUE    << x << pc::ENDCOLOR)
#define ROS_MAGENTA_STREAM(x) ROS_INFO_STREAM(pc::MAGENTA << x << pc::ENDCOLOR)
#define ROS_CYAN_STREAM(x)    ROS_INFO_STREAM(pc::CYAN    << x << pc::ENDCOLOR)

#define ROS_BLACK_STREAM_COND(c, x)   ROS_INFO_STREAM_COND(c, pc::BLACK   << x << pc::ENDCOLOR)
#define ROS_RED_STREAM_COND(c, x)     ROS_INFO_STREAM_COND(c, pc::RED     << x << pc::ENDCOLOR)
#define ROS_GREEN_STREAM_COND(c, x)   ROS_INFO_STREAM_COND(c, pc::GREEN   << x << pc::ENDCOLOR)
#define ROS_YELLOW_STREAM_COND(c, x)  ROS_INFO_STREAM_COND(c, pc::YELLOW  << x << pc::ENDCOLOR)
#define ROS_BLUE_STREAM_COND(c, x)    ROS_INFO_STREAM_COND(c, pc::BLUE    << x << pc::ENDCOLOR)
#define ROS_MAGENTA_STREAM_COND(c, x) ROS_INFO_STREAM_COND(c, pc::MAGENTA << x << pc::ENDCOLOR)
#define ROS_CYAN_STREAM_COND(c, x)    ROS_INFO_STREAM_COND(c, pc::CYAN    << x << pc::ENDCOLOR)


// initialize values for MoveIt
const double tau = 2 * M_PI;
static const std::string PLANNING_GROUP = "xarm6";
namespace rvt = rviz_visual_tools;

// Initialize values for the state machine
geometry_msgs::Pose poi_pose;
geometry_msgs::Pose basket_pose; 
geometry_msgs::Pose reset_pose; 
geometry_msgs::Pose approach_pose;
geometry_msgs::Pose pregrasp_pose;
geometry_msgs::Pose pregrasp_pose2;
float dx;
float dy;
float dz;
int approach_pose_num = 0;
int in_case_10 = 0;
bool depth_failed = 0;
manipulation::visual_servo vs_srv;
ros::ServiceClient vs_client;
ros::Time found_poi;
int frame_id = 0;

// empirical offset values //! need to change
float pregrasp_offset = 0.095;
float pregrasp_offset_far = 0.215;
float pregrasp_offset_z = 0.03; 


// move to target pose
bool moveToPose(geometry_msgs::Pose target_pose){
  ros::AsyncSpinner spinner(1);
  spinner.start();

  moveit::planning_interface::MoveGroupInterface move_group_interface(PLANNING_GROUP);
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  const moveit::core::JointModelGroup* joint_model_group = move_group_interface.getCurrentState()->getJointModelGroup(PLANNING_GROUP);
  moveit_visual_tools::MoveItVisualTools visual_tools("base");
  visual_tools.deleteAllMarkers();
  visual_tools.loadRemoteControl();

  // RViz provides many types of markers, in this demo we will use text, cylinders, and spheres
  Eigen::Isometry3d text_pose = Eigen::Isometry3d::Identity();
  text_pose.translation().z() = 1.0;
  visual_tools.publishText(text_pose, "MoveGroupInterface Demo", rvt::WHITE, rvt::XLARGE);

  // Batch publishing is used to reduce the number of messages being sent to RViz for large visualizations
  visual_tools.trigger();

  // Getting Basic Information
  // print the name of the reference frame for this robot
  ROS_INFO_NAMED("tutorial", "Planning frame: %s", move_group_interface.getPlanningFrame().c_str());
  //  print the name of the end-effector link for this group.
  ROS_INFO_NAMED("tutorial", "End effector link: %s", move_group_interface.getEndEffectorLink().c_str());
  // list of all the groups in the robot:
  ROS_INFO_NAMED("tutorial", "Available Planning Groups:");
  std::copy(move_group_interface.getJointModelGroupNames().begin(),
            move_group_interface.getJointModelGroupNames().end(), std::ostream_iterator<std::string>(std::cout, ", "));

  // we call the planner to compute the plan and visualize it.
  // move_group_interface.setPlanningTime(15.0);
  tf2::Quaternion q;
  q.setRPY(-M_PI/2,-M_PI/2,-M_PI/2);  //! change
  geometry_msgs::Quaternion quat;
  quat = tf2::toMsg(q);
  geometry_msgs::Pose constrained_pose;
  constrained_pose.orientation = quat;
  constrained_pose.position = target_pose.position;
  constrained_pose.position.x -= 0.03; //! change
  // (0.192 - 0.061525); // offset between our end-effector gripping point and tool_frame for robotiq ee
  move_group_interface.setPoseTarget(constrained_pose);

  // make plan
  moveit::planning_interface::MoveGroupInterface::Plan my_plan;
  bool success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
  ROS_INFO_NAMED("tutorial", "Visualizing plan 1 (pose goal) %s", success ? "" : "FAILED");

  if(!success){
    return false;
  }

  // visualize plan
  ROS_INFO_NAMED("tutorial", "Visualizing plan 1 as trajectory line");
  visual_tools.publishAxisLabeled(target_pose, "pose1");
  visual_tools.publishText(text_pose, "Pose Goal", rvt::WHITE, rvt::XLARGE);
  visual_tools.publishTrajectoryLine(my_plan.trajectory_, joint_model_group);
  visual_tools.trigger();

  // execute plan
  moveit::planning_interface::MoveItErrorCode moved = move_group_interface.move();
  if (moved == moveit::planning_interface::MoveItErrorCode::SUCCESS){
    return true;
  }
  return false;

}

// cartesian move to the poi position
bool cartMoveToPoi(){
  ros::AsyncSpinner spinner(1);
  spinner.start();

  moveit::planning_interface::MoveGroupInterface move_group_interface(PLANNING_GROUP);
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  const moveit::core::JointModelGroup* joint_model_group = move_group_interface.getCurrentState()->getJointModelGroup(PLANNING_GROUP);
  moveit_visual_tools::MoveItVisualTools visual_tools("base");
  visual_tools.deleteAllMarkers();
  visual_tools.loadRemoteControl();

  // RViz provides many types of markers, in this demo we will use text, cylinders, and spheres
  Eigen::Isometry3d text_pose = Eigen::Isometry3d::Identity();
  text_pose.translation().z() = 1.0;
  visual_tools.publishText(text_pose, "Demo", rvt::WHITE, rvt::XLARGE);
  visual_tools.trigger();

  std::vector<geometry_msgs::Pose> waypoints;
  geometry_msgs::PoseStamped current_pose = move_group_interface.getCurrentPose();
  geometry_msgs::Pose next_pose = current_pose.pose;

  next_pose.position.x += pregrasp_offset;
  waypoints.push_back(next_pose);

  moveit_msgs::RobotTrajectory trajectory;
  const double jump_threshold = 0.0;
  const double eef_step = 0.01;
  double fraction = move_group_interface.computeCartesianPath(waypoints, eef_step, jump_threshold, trajectory);

  if (fraction < 0.9){
    return false;
  }

  // Set the execution duration of the trajectory -- for kinova
  // const double duration = 10; // 15;
  // double traj_duration = trajectory.joint_trajectory.points.back().time_from_start.toSec();
  // double scale = duration / traj_duration;
  // for (auto& point : trajectory.joint_trajectory.points) {
  //   point.time_from_start *= scale;
  // }

  // Visualize the plan in RViz
  visual_tools.deleteAllMarkers();
  visual_tools.publishText(text_pose, "Cartesian Path", rvt::WHITE, rvt::XLARGE);
  visual_tools.publishPath(waypoints, rvt::LIME_GREEN, rvt::SMALL);
  for (std::size_t i = 0; i < waypoints.size(); ++i)
    visual_tools.publishAxisLabeled(waypoints[i], "pt" + std::to_string(i), rvt::SMALL);
  visual_tools.trigger();
  // visual_tools.prompt("Execute multiframe move?");

  // You can execute a trajectory like this.
  moveit::planning_interface::MoveItErrorCode moved = move_group_interface.execute(trajectory);
  if (moved == moveit::planning_interface::MoveItErrorCode::SUCCESS){
    return true;
  }
  return false;

}

// cartesian move back to pregrasp pose
bool cartMoveToPreGrasp(){
  ros::AsyncSpinner spinner(1);
  spinner.start();

  moveit::planning_interface::MoveGroupInterface move_group_interface(PLANNING_GROUP);
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  const moveit::core::JointModelGroup* joint_model_group = move_group_interface.getCurrentState()->getJointModelGroup(PLANNING_GROUP);
  moveit_visual_tools::MoveItVisualTools visual_tools("base");
  visual_tools.deleteAllMarkers();
  visual_tools.loadRemoteControl();

  // RViz provides many types of markers, in this demo we will use text, cylinders, and spheres
  Eigen::Isometry3d text_pose = Eigen::Isometry3d::Identity();
  text_pose.translation().z() = 1.0;
  visual_tools.publishText(text_pose, "Demo", rvt::WHITE, rvt::XLARGE);
  visual_tools.trigger();

  std::vector<geometry_msgs::Pose> waypoints;
  geometry_msgs::PoseStamped current_pose = move_group_interface.getCurrentPose();
  geometry_msgs::Pose next_pose = current_pose.pose;

  next_pose.position.x -= 0.18; //! change
  waypoints.push_back(next_pose);

  moveit_msgs::RobotTrajectory trajectory;
  const double jump_threshold = 0.0;
  const double eef_step = 0.01;
  double fraction = move_group_interface.computeCartesianPath(waypoints, eef_step, jump_threshold, trajectory);

  if (fraction < 0.9){
    return false;
  }

  // Set the execution duration of the trajectory -- 
  // const double duration = 50;
  // double traj_duration = trajectory.joint_trajectory.points.back().time_from_start.toSec();
  // double scale = duration / traj_duration;
  // for (auto& point : trajectory.joint_trajectory.points) {
  //   point.time_from_start *= scale;
  // }

  // Visualize the plan in RViz
  visual_tools.deleteAllMarkers();
  visual_tools.publishText(text_pose, "Cartesian Path", rvt::WHITE, rvt::XLARGE);
  visual_tools.publishPath(waypoints, rvt::LIME_GREEN, rvt::SMALL);
  for (std::size_t i = 0; i < waypoints.size(); ++i)
    visual_tools.publishAxisLabeled(waypoints[i], "pt" + std::to_string(i), rvt::SMALL);
  visual_tools.trigger();
  // visual_tools.prompt("Execute multiframe move?");

  moveit::planning_interface::MoveItErrorCode moved = move_group_interface.execute(trajectory);
  if (moved == moveit::planning_interface::MoveItErrorCode::SUCCESS){
    return true;
  }
  return false;
  
}

// move to basket drop pose
bool moveToBasket(){
  ros::AsyncSpinner spinner(1);
  spinner.start();

  ROS_INFO("moving to joint state");

  moveit::planning_interface::MoveGroupInterface move_group_interface(PLANNING_GROUP);
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  const moveit::core::JointModelGroup* joint_model_group = move_group_interface.getCurrentState()->getJointModelGroup(PLANNING_GROUP);
  moveit_visual_tools::MoveItVisualTools visual_tools("base");
  visual_tools.deleteAllMarkers();
  visual_tools.loadRemoteControl();

  // RViz provides many types of markers, in this demo we will use text, cylinders, and spheres
  Eigen::Isometry3d text_pose = Eigen::Isometry3d::Identity();
  text_pose.translation().z() = 1.0;
  visual_tools.publishText(text_pose, "MoveGroupInterface Demo", rvt::WHITE, rvt::XLARGE);

  // Batch publishing is used to reduce the number of messages being sent to RViz for large visualizations
  visual_tools.trigger();

  // current pose
  geometry_msgs::Pose current_pose = move_group_interface.getCurrentPose().pose;

  // current state
  moveit::core::RobotStatePtr current_state = move_group_interface.getCurrentState();
  std::vector<double> joint_group_positions;
  current_state->copyJointGroupPositions(joint_model_group, joint_group_positions);
  double J0 = joint_group_positions[0];

  // find alpha (offset from base)
  float alpha = tan(current_pose.position.y / current_pose.position.x);
  if(alpha < M_PI/2){
    alpha -= 2*M_PI;
  }

  // set new J0 value
  joint_group_positions[0] = J0+alpha+M_PI/3; // move 60 degrees //! need to tune
  move_group_interface.setJointValueTarget(joint_group_positions);

  moveit::planning_interface::MoveGroupInterface::Plan my_plan;
  bool success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
  ROS_INFO_NAMED("tutorial", "Visualizing plan 1 (pose goal) %s", success ? "" : "FAILED");

  // Visualize the plan in RViz
  visual_tools.deleteAllMarkers();
  visual_tools.publishText(text_pose, "Joint Space Goal", rvt::WHITE, rvt::XLARGE);
  visual_tools.publishTrajectoryLine(my_plan.trajectory_, joint_model_group);
  visual_tools.trigger();
  move_group_interface.move();

}

// move to pre grasp 2 during visual servo
bool moveToPG2ForVS() {

  ros::AsyncSpinner spinner(1);
  spinner.start();

  moveit::planning_interface::MoveGroupInterface move_group_interface(PLANNING_GROUP);
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  const moveit::core::JointModelGroup* joint_model_group = move_group_interface.getCurrentState()->getJointModelGroup(PLANNING_GROUP);
  moveit_visual_tools::MoveItVisualTools visual_tools("base");
  visual_tools.deleteAllMarkers();
  visual_tools.loadRemoteControl();

  // RViz provides many types of markers, in this demo we will use text, cylinders, and spheres
  Eigen::Isometry3d text_pose = Eigen::Isometry3d::Identity();
  text_pose.translation().z() = 1.0;
  visual_tools.publishText(text_pose, "MoveGroupInterface Demo", rvt::WHITE, rvt::XLARGE);

  // Batch publishing is used to reduce the number of messages being sent to RViz for large visualizations
  visual_tools.trigger();

  // Getting Basic Information
  // print the name of the reference frame for this robot
  ROS_INFO_NAMED("tutorial", "Planning frame: %s", move_group_interface.getPlanningFrame().c_str());
  //  print the name of the end-effector link for this group.
  ROS_INFO_NAMED("tutorial", "End effector link: %s", move_group_interface.getEndEffectorLink().c_str());
  // list of all the groups in the robot:
  ROS_INFO_NAMED("tutorial", "Available Planning Groups:");
  std::copy(move_group_interface.getJointModelGroupNames().begin(),
            move_group_interface.getJointModelGroupNames().end(), std::ostream_iterator<std::string>(std::cout, ", "));

  // we call the planner to compute the plan and visualize it.
  tf2::Quaternion q;
  q.setRPY(-M_PI/2,-M_PI/2,-M_PI/2);; //kinovas
  geometry_msgs::Quaternion quat;
  quat = tf2::toMsg(q);
  geometry_msgs::Pose constrained_pose;
  constrained_pose.orientation = quat;
  // constrained_pose.position = target_pose.position;
  // constrained_pose.position.x -= 0.03; // (0.192 - 0.061525); // offset between our end-effector gripping point and tool_frame for robotiq ee
  geometry_msgs::Pose current_pose = move_group_interface.getCurrentPose().pose;
  constrained_pose.position.y =  current_pose.position.y + dy;
  constrained_pose.position.z  = current_pose.position.z + dz;
  constrained_pose.position.x = current_pose.position.x + dx - pregrasp_offset; //! change?
  ROS_GREEN_STREAM("PRE GRASP 2 FOR VS (poi minus offset in x)");
  ROS_GREEN_STREAM(constrained_pose);

  // make plan
  moveit::planning_interface::MoveGroupInterface::Plan my_plan;
  bool success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
  ROS_INFO_NAMED("tutorial", "Visualizing plan 1 (pose goal) %s", success ? "" : "FAILED");

  if(!success){
    return false;
  }

  // visualize plan
  ROS_INFO_NAMED("tutorial", "Visualizing plan 1 as trajectory line");
  visual_tools.publishTrajectoryLine(my_plan.trajectory_, joint_model_group);
  visual_tools.trigger();

  moveit::planning_interface::MoveItErrorCode moved = move_group_interface.move();
  if (moved == moveit::planning_interface::MoveItErrorCode::SUCCESS){
    return true;
  }
  return false;

}

// multiframe rotation
bool mfRotation(){
  ros::AsyncSpinner spinner(1);
  spinner.start();

  ROS_INFO("moving to joint state");

  moveit::planning_interface::MoveGroupInterface move_group_interface(PLANNING_GROUP);
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  const moveit::core::JointModelGroup* joint_model_group = move_group_interface.getCurrentState()->getJointModelGroup(PLANNING_GROUP);
  moveit_visual_tools::MoveItVisualTools visual_tools("base");
  visual_tools.deleteAllMarkers();
  visual_tools.loadRemoteControl();

  // RViz provides many types of markers, in this demo we will use text, cylinders, and spheres
  Eigen::Isometry3d text_pose = Eigen::Isometry3d::Identity();
  text_pose.translation().z() = 1.0;
  visual_tools.publishText(text_pose, "MoveGroupInterface Demo", rvt::WHITE, rvt::XLARGE);
  visual_tools.trigger();

  // current state
  moveit::core::RobotStatePtr current_state = move_group_interface.getCurrentState();
  std::vector<double> joint_group_positions;
  current_state->copyJointGroupPositions(joint_model_group, joint_group_positions);
  double J0 = joint_group_positions[0];

  // rotate 2 degrees
  joint_group_positions[0] = J0-M_PI/90;
  move_group_interface.setJointValueTarget(joint_group_positions);

  moveit::planning_interface::MoveGroupInterface::Plan my_plan;
  bool success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
  ROS_INFO_NAMED("tutorial", "Visualizing plan 1 (pose goal) %s", success ? "" : "FAILED");

  // Visualize the plan in RViz
  visual_tools.deleteAllMarkers();
  visual_tools.publishTrajectoryLine(my_plan.trajectory_, joint_model_group);
  visual_tools.trigger();
  move_group_interface.move();

  return true;
}

// update POI
void updatePOICallback(const geometry_msgs::Pose msg)
{
	poi_pose = msg;
}

// update POI from visual servoing
void deltaPOICallback(const geometry_msgs::Pose msg){
  dx = msg.position.x;
  dy = msg.position.y;
  dz = msg.position.z;
  ROS_GREEN_STREAM("dx: " << dx <<" dy: "<< dy << " dz: " <<dz );
}

// harvest service callback
bool harvestSrvCallback(manipulation::harvest::Request& request, manipulation::harvest::Response& response)
{
  int state = request.req_id;
  ROS_RED_STREAM("STATE: "<<state);

  switch (state) {
    case 0:{ // move to reset pose
      std::cout << "moving to reset pose" << std::endl;
      reset_pose.position.x = 0.1;
      reset_pose.position.y = 0;
      reset_pose.position.z = 0.5;
      bool success = moveToPose(reset_pose);
      if(success==true){
        response.reply = 1;
      }
      else{
        response.reply = 0;
      }
      return 1;
    }

    case 1:{ // approach plant positions
      std::cout << "approaching plant" << std::endl;
      std::cout << "going to approach position "<< approach_pose_num << std::endl;
      bool moved;
      if (approach_pose_num == 0){ // approach pose 1
        approach_pose.position.x = 0.15;
        approach_pose.position.y = 0;
        approach_pose.position.z = 0.65;
        moved = moveToPose(approach_pose);
      }
      else if (approach_pose_num == 1){ // approach pose 2
        approach_pose.position.x = 0.1;
        approach_pose.position.y = 0.16;
        approach_pose.position.z = 0.6;
        moved = moveToPose(approach_pose);
      }
      else if (approach_pose_num == 2){ // approach pose 3
        approach_pose.position.x = 0.1;
        approach_pose.position.y = 0.03;
        approach_pose.position.z = 0.56;
        moved = moveToPose(approach_pose);
      }
      else {
        response.reply = 0;
        return 1;
      }

      response.reply = 1;
      return 1;
    }

    case 2:{ // multiframe
        ros::Time mf_init = ros::Time::now();
        ROS_INFO("running multiframe");
        ROS_MAGENTA_STREAM("frame id: "<<frame_id);
        int num_frames = 1;

        // frames 0 to num_frames
        if(frame_id<num_frames){
          ros::Time mf_moving_time_start = ros::Time::now();
          bool cart_mf = mfRotation(); // execute multiframe move
          ros::Time mf_moving_time_end = ros::Time::now();
          ROS_RED_STREAM("Done moving");
          ROS_INFO_STREAM("MF Moving time: "<< (mf_moving_time_end - mf_moving_time_start));
          frame_id += 1;
          response.reply = 1;
        }

        if (frame_id==num_frames){
          ROS_MAGENTA_STREAM("frame id: "<<frame_id);
          ros::Time mf_moving_time_start = ros::Time::now();
          bool cart_mf = mfRotation(); // execute multiframe move
          response.reply = 0; // system level respond 0
          frame_id = 0;
        }
      
      return 1;
    }

    case 3:{ // move to pre-grasp POI pose

      // move to pre-grasp POI pose
      ros::Time got_poi = ros::Time::now();
      ROS_RED_STREAM("Time diff: "<< (got_poi - found_poi));
      std::cout << "moving to pre-grasp pose" << std::endl;
      pregrasp_pose = poi_pose;
      if(poi_pose.position.x < 0.3){
        depth_failed = 1;
        ROS_RED_STREAM("DEPTH FAILED");
        pregrasp_pose.position.x = 0.3;

      }
      else{
        pregrasp_pose.position.x -= (pregrasp_offset_far-0.015); //! change?
      }
      pregrasp_pose.position.z -= pregrasp_offset_z;
      bool success = moveToPose(pregrasp_pose);
      std::cout << "moved to pre grasp" << std::endl;

      if (success){
        std::cout << "moved to pre grasp" << std::endl;
        response.reply = 1;
      }
      else{
        std::cout << "move to pre-grasp POI pose failed" << std::endl;
        response.reply = 0;
      }
      ROS_BLUE_STREAM(response.reply);
      return 1;
    }

    case 7:{ // move back to pre-grasp poi, move to basket drop pose
      // move to pre grasp
      std::cout << "moving to pre-grasp" << std::endl;
      bool cart_move1 = cartMoveToPreGrasp();
      if (cart_move1){
          std::cout << "moved to pre grasp" << std::endl;
      }
      else{
        std::cout << "move to pre grasp failed" << std::endl;
        response.reply = 0; 
      }

      // move to basket
      std::cout << "moving to basket" << std::endl;
      bool moved_to_basket = moveToBasket();
      if (moved_to_basket){
          std::cout << "moved to basket successfully" << std::endl;
      }
      else{
        std::cout << "move to basket pose failed" << std::endl;
        response.reply = 0; 
      }

      response.reply = 1;
      return 1;

    }
  
    case 10:{ // visual servoing
      ROS_INFO("start visual servoing");

        ROS_INFO("visual servoing");
        vs_srv.request.req_id = 0;
        
        // waiting for response
        int wait_count = 0;
        while(!vs_client.call(vs_srv)){
          if (wait_count % 500 == 0){
            ROS_INFO("WAITING for visual servo server");
          }
          wait_count+=1;
        }

        // received response
        ROS_INFO("Received Response");
        ROS_RED_STREAM("response from perception");

        // check
        int did_vs = vs_srv.response.reply;
        // ros::Duration(5).sleep();

        // if VS succeeded, move to updated poi
        if(did_vs==1){
            ROS_BLUE_STREAM("Done with visual servoing, moving to updated POI");
            ros::spinOnce();
            bool success1 = moveToPG2ForVS();
            if (!success1){
              ROS_BLUE_STREAM("Moving to pre grasp 2 failed - telling system VS failed");
              response.reply = 0;
            }

            // cartesian move to upated poi 
            bool vs_moved_to_poi = cartMoveToPoi();
            if(vs_moved_to_poi){
              ROS_BLUE_STREAM("Moved to updated POI");
              response.reply = 1;
            }
            else{
              ROS_BLUE_STREAM("Cartesian move to POI failed");
              response.reply = 0;
            }
        }
        // if VS failed, move to old poi
        else{
          ROS_BLUE_STREAM("Visual Servoing failed in perception world");
          // move to pre grasp 2 with joint space move
          pregrasp_pose2 = poi_pose;
          pregrasp_pose2.position.x -= (pregrasp_offset-0.015); //! change?
          pregrasp_pose2.position.z += (pregrasp_offset_z-0.01); //! change?
          bool success1 = moveToPose(pregrasp_pose2);
          if (!success1){
            ROS_BLUE_STREAM("Moving to pre grasp 2 failed - telling system VS failed");
            response.reply = 0;
          }
          
          // move to POI with cartesian move
          ROS_INFO_STREAM("Moving to POI");
          bool success2 = cartMoveToPoi();
          if (!success2){
            ROS_BLUE_STREAM("cartesian move to poi failed - telling system VS failed");
            response.reply = 0;
          }

          response.reply = 1; // tell system we moved to POI

        }

      return 1;
    }
  
    case 15:{ // increment approach position
      approach_pose_num += 1;
      response.reply = 1;
      return 1;
    }

  }
}

int main(int argc, char **argv) {
  
  ROS_INFO("in main");

  // start node
  ros::init(argc, argv, "manipulation_node");
  ros::NodeHandle n;

  // visual servo sub service
  vs_client = n.serviceClient<manipulation::visual_servo>("/perception/visual_servo");

  // subscribers
  ros::Subscriber poi_sub = n.subscribe("/perception/peduncle/poi", 1000, updatePOICallback);
  ros::Subscriber delta_poi_sub = n.subscribe("/perception/peduncle/dpoi", 1000, deltaPOICallback);

  // harvest server service
  ros::ServiceServer harvest_server = n.advertiseService("/manipulation/harvest",harvestSrvCallback);
  
  ros::Rate loop_rate(1);
  int main_count=0;
  while(ros::ok()) {
    if (main_count%500==0)
      ROS_INFO("waiting for something to happen");
      main_count += 1;
      ros::spinOnce();
      loop_rate.sleep();
  }
  return 0;

}

