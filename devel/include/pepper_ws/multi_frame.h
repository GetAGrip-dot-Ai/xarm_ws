// Generated by gencpp from file pepper_ws/multi_frame.msg
// DO NOT EDIT!


#ifndef PEPPER_WS_MESSAGE_MULTI_FRAME_H
#define PEPPER_WS_MESSAGE_MULTI_FRAME_H

#include <ros/service_traits.h>


#include <pepper_ws/multi_frameRequest.h>
#include <pepper_ws/multi_frameResponse.h>


namespace pepper_ws
{

struct multi_frame
{

typedef multi_frameRequest Request;
typedef multi_frameResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct multi_frame
} // namespace pepper_ws


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::pepper_ws::multi_frame > {
  static const char* value()
  {
    return "49ea530aae91150cd4645ab17a741cf0";
  }

  static const char* value(const ::pepper_ws::multi_frame&) { return value(); }
};

template<>
struct DataType< ::pepper_ws::multi_frame > {
  static const char* value()
  {
    return "pepper_ws/multi_frame";
  }

  static const char* value(const ::pepper_ws::multi_frame&) { return value(); }
};


// service_traits::MD5Sum< ::pepper_ws::multi_frameRequest> should match
// service_traits::MD5Sum< ::pepper_ws::multi_frame >
template<>
struct MD5Sum< ::pepper_ws::multi_frameRequest>
{
  static const char* value()
  {
    return MD5Sum< ::pepper_ws::multi_frame >::value();
  }
  static const char* value(const ::pepper_ws::multi_frameRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::pepper_ws::multi_frameRequest> should match
// service_traits::DataType< ::pepper_ws::multi_frame >
template<>
struct DataType< ::pepper_ws::multi_frameRequest>
{
  static const char* value()
  {
    return DataType< ::pepper_ws::multi_frame >::value();
  }
  static const char* value(const ::pepper_ws::multi_frameRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::pepper_ws::multi_frameResponse> should match
// service_traits::MD5Sum< ::pepper_ws::multi_frame >
template<>
struct MD5Sum< ::pepper_ws::multi_frameResponse>
{
  static const char* value()
  {
    return MD5Sum< ::pepper_ws::multi_frame >::value();
  }
  static const char* value(const ::pepper_ws::multi_frameResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::pepper_ws::multi_frameResponse> should match
// service_traits::DataType< ::pepper_ws::multi_frame >
template<>
struct DataType< ::pepper_ws::multi_frameResponse>
{
  static const char* value()
  {
    return DataType< ::pepper_ws::multi_frame >::value();
  }
  static const char* value(const ::pepper_ws::multi_frameResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PEPPER_WS_MESSAGE_MULTI_FRAME_H