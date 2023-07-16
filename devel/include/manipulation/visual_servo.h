// Generated by gencpp from file manipulation/visual_servo.msg
// DO NOT EDIT!


#ifndef MANIPULATION_MESSAGE_VISUAL_SERVO_H
#define MANIPULATION_MESSAGE_VISUAL_SERVO_H

#include <ros/service_traits.h>


#include <manipulation/visual_servoRequest.h>
#include <manipulation/visual_servoResponse.h>


namespace manipulation
{

struct visual_servo
{

typedef visual_servoRequest Request;
typedef visual_servoResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct visual_servo
} // namespace manipulation


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::manipulation::visual_servo > {
  static const char* value()
  {
    return "49ea530aae91150cd4645ab17a741cf0";
  }

  static const char* value(const ::manipulation::visual_servo&) { return value(); }
};

template<>
struct DataType< ::manipulation::visual_servo > {
  static const char* value()
  {
    return "manipulation/visual_servo";
  }

  static const char* value(const ::manipulation::visual_servo&) { return value(); }
};


// service_traits::MD5Sum< ::manipulation::visual_servoRequest> should match
// service_traits::MD5Sum< ::manipulation::visual_servo >
template<>
struct MD5Sum< ::manipulation::visual_servoRequest>
{
  static const char* value()
  {
    return MD5Sum< ::manipulation::visual_servo >::value();
  }
  static const char* value(const ::manipulation::visual_servoRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::manipulation::visual_servoRequest> should match
// service_traits::DataType< ::manipulation::visual_servo >
template<>
struct DataType< ::manipulation::visual_servoRequest>
{
  static const char* value()
  {
    return DataType< ::manipulation::visual_servo >::value();
  }
  static const char* value(const ::manipulation::visual_servoRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::manipulation::visual_servoResponse> should match
// service_traits::MD5Sum< ::manipulation::visual_servo >
template<>
struct MD5Sum< ::manipulation::visual_servoResponse>
{
  static const char* value()
  {
    return MD5Sum< ::manipulation::visual_servo >::value();
  }
  static const char* value(const ::manipulation::visual_servoResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::manipulation::visual_servoResponse> should match
// service_traits::DataType< ::manipulation::visual_servo >
template<>
struct DataType< ::manipulation::visual_servoResponse>
{
  static const char* value()
  {
    return DataType< ::manipulation::visual_servo >::value();
  }
  static const char* value(const ::manipulation::visual_servoResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MANIPULATION_MESSAGE_VISUAL_SERVO_H