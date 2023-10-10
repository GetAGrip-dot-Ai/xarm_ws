#include <ros/ros.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit_msgs/DisplayRobotState.h>
#include <moveit_msgs/DisplayTrajectory.h>
#include <moveit_visual_tools/moveit_visual_tools.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <string>


// initialize values for MoveIt
const double tau = 2 * M_PI;
static const std::string PLANNING_GROUP = "xarm6";
namespace rvt = rviz_visual_tools;

// move to target pose
void moveToPose(geometry_msgs::Pose target_pose){
  // initialize move group interface
  moveit::planning_interface::MoveGroupInterface move_group_interface(PLANNING_GROUP);
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  const moveit::core::JointModelGroup* joint_model_group = move_group_interface.getCurrentState()->getJointModelGroup(PLANNING_GROUP);
  moveit_visual_tools::MoveItVisualTools visual_tools("base");
  visual_tools.deleteAllMarkers();
  visual_tools.loadRemoteControl();
  visual_tools.trigger();

  // RViz provides many types of markers, in this demo we will use text, cylinders, and spheres
  //  Eigen::Isometry3d text_pose = Eigen::Isometry3d::Identity();
  // text_pose.translation().z() = 1.0;
  // visual_tools.publishText(text_pose, "MoveGroupInterface Demo", rvt::WHITE, rvt::XLARGE);

  // Batch publishing is used to reduce the number of messages being sent to RViz for large visualizations

  // Getting Basic Information
  // // print the name of the reference frame for this robot
  // ROS_INFO_NAMED("tutorial", "Planning frame: %s", move_group_interface.getPlanningFrame().c_str());
  // //  print the name of the end-effector link for this group.
  // ROS_INFO_NAMED("tutorial", "End effector link: %s", move_group_interface.getEndEffectorLink().c_str());
  // // list of all the groups in the robot:
  // ROS_INFO_NAMED("tutorial", "Available Planning Groups:");
  std::copy(move_group_interface.getJointModelGroupNames().begin(),
            move_group_interface.getJointModelGroupNames().end(), std::ostream_iterator<std::string>(std::cout, ", "));

  // set orientation
  tf2::Quaternion q;
  q.setRPY(-M_PI/2,-M_PI/2+M_PI/4,-M_PI/2);  //xarm
  geometry_msgs::Quaternion quat;
  quat = tf2::toMsg(q);

  // set target pose
  geometry_msgs::Pose constrained_pose;
  constrained_pose.orientation = quat;
  constrained_pose.position = target_pose.position;
  move_group_interface.setPoseTarget(constrained_pose);

  // make plan
  moveit::planning_interface::MoveGroupInterface::Plan my_plan;
  bool success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
  // ROS_INFO_NAMED("tutorial", "Visualizing plan 1 (pose goal) %s", success ? "" : "FAILED");

  // visualize plan
  // ROS_INFO_NAMED("tutorial", "Visualizing plan 1 as trajectory line");
  // visual_tools.publishAxisLabeled(target_pose, "pose1");
  // visual_tools.publishText(text_pose, "Pose Goal", rvt::WHITE, rvt::XLARGE);
  visual_tools.publishTrajectoryLine(my_plan.trajectory_, joint_model_group);
  visual_tools.trigger();

  // execute plan if it was generated successfully
  if(success){
    moveit::planning_interface::MoveItErrorCode moved = move_group_interface.move();
    if (moved == moveit::planning_interface::MoveItErrorCode::SUCCESS){
      ROS_WARN_STREAM("MOVE SUCCESSFUL");
    }
    else{
      ROS_WARN_STREAM("MOVE FAILED");
    }
  }
  else{
    ROS_WARN_STREAM("PLAN FAILED");
  }

}

// generate set of poses from csv
std::vector<geometry_msgs::Pose> generatePoses(){
  // read csv

  // create poses
  std::vector<geometry_msgs::Pose> poses;
  return poses;
}


// move to the set of poses
void planToPoses(std::vector<geometry_msgs::Pose> poses){
  // for each pose in poses
  // print pose
  // move to pose
}


int main(int argc, char **argv) {
  
  // start node
  ros::init(argc, argv, "manipulation_testing");
  ros::NodeHandle node_handle;
  ros::AsyncSpinner spinner(1);
  spinner.start();

  // planToPoses();

  return 0;

}


// PLANNING NOTES

// z: 6 in from base until 36 inch VW height --> 0.15 to 0.9
// x: 6 in until 2ft --> 0.15 to 0.8
// y: 1.5 ft on either side --> -0.5 to 0.5

// python script to generate a set of x,y,z points
// saves them to a csv

// cpp world --> load the csv
// create poses from each point
// print the point
// move to pose (point)
// optional: automate logging the point and whether or not plan succeeded