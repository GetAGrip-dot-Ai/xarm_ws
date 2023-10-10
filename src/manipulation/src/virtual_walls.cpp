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


void addVirtualWalls(){
  // initialize move group
  moveit::planning_interface::MoveGroupInterface move_group_interface(PLANNING_GROUP);
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  const moveit::core::JointModelGroup* joint_model_group = move_group_interface.getCurrentState()->getJointModelGroup(PLANNING_GROUP);
  moveit_visual_tools::MoveItVisualTools visual_tools("base");
  visual_tools.deleteAllMarkers();
  visual_tools.loadRemoteControl();
  Eigen::Isometry3d text_pose = Eigen::Isometry3d::Identity();

  // make first collision object (wall 1 -- amiga wheels)
  moveit_msgs::CollisionObject collision_object1;
  collision_object1.header.frame_id = move_group_interface.getPlanningFrame();
  collision_object1.id = "wall1";

  shape_msgs::SolidPrimitive primitive1;
  primitive1.type = primitive1.BOX;
  primitive1.dimensions.resize(3);
  primitive1.dimensions[0] = 0.03;
  primitive1.dimensions[1] = 0.9144*2;
  primitive1.dimensions[2] = 0.9144*2;

  geometry_msgs::Pose wall_pose1;
  wall_pose1.orientation.w = 1.0;
  wall_pose1.position.x = -0.22;
  wall_pose1.position.y = 0;
  wall_pose1.position.z = 0;

  // make second collision object (wall 2 -- ground)
  moveit_msgs::CollisionObject collision_object2;
  collision_object2.header.frame_id = move_group_interface.getPlanningFrame();
  collision_object2.id = "wall2";

  shape_msgs::SolidPrimitive primitive2;
  primitive2.type = primitive2.BOX;
  primitive2.dimensions.resize(3);
  primitive2.dimensions[0] = 2+0.22+0.03;
  primitive2.dimensions[1] = 2.0;
  primitive2.dimensions[2] = 0.03;

  geometry_msgs::Pose wall_pose2;
  wall_pose2.orientation.w = 1.0;
  wall_pose2.position.x = (2-0.22)/2;
  wall_pose2.position.y = 0;
  wall_pose2.position.z = 0.9144;

  // add collision objects to planning scene
  collision_object1.primitives.push_back(primitive1);
  collision_object1.primitive_poses.push_back(wall_pose1);
  collision_object1.operation = collision_object1.ADD;

  collision_object2.primitives.push_back(primitive2);
  collision_object2.primitive_poses.push_back(wall_pose2);
  collision_object2.operation = collision_object2.ADD;

  std::vector<moveit_msgs::CollisionObject> collision_objects;
  collision_objects.push_back(collision_object1);
  collision_objects.push_back(collision_object2);

  planning_scene_interface.addCollisionObjects(collision_objects);

  visual_tools.publishText(text_pose, "Add object", rvt::WHITE, rvt::XLARGE);
  visual_tools.trigger();
}


int main(int argc, char **argv) {
  
  // start node
  ros::init(argc, argv, "manipulation_testing");
  ros::NodeHandle node_handle;
  ros::AsyncSpinner spinner(1);
  spinner.start();

  addVirtualWalls();

  return 0;

}