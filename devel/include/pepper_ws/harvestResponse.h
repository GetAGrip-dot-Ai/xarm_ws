// Generated by gencpp from file pepper_ws/harvestResponse.msg
// DO NOT EDIT!


#ifndef PEPPER_WS_MESSAGE_HARVESTRESPONSE_H
#define PEPPER_WS_MESSAGE_HARVESTRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace pepper_ws
{
template <class ContainerAllocator>
struct harvestResponse_
{
  typedef harvestResponse_<ContainerAllocator> Type;

  harvestResponse_()
    : reply(0)  {
    }
  harvestResponse_(const ContainerAllocator& _alloc)
    : reply(0)  {
  (void)_alloc;
    }



   typedef int16_t _reply_type;
  _reply_type reply;





  typedef boost::shared_ptr< ::pepper_ws::harvestResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pepper_ws::harvestResponse_<ContainerAllocator> const> ConstPtr;

}; // struct harvestResponse_

typedef ::pepper_ws::harvestResponse_<std::allocator<void> > harvestResponse;

typedef boost::shared_ptr< ::pepper_ws::harvestResponse > harvestResponsePtr;
typedef boost::shared_ptr< ::pepper_ws::harvestResponse const> harvestResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pepper_ws::harvestResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pepper_ws::harvestResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::pepper_ws::harvestResponse_<ContainerAllocator1> & lhs, const ::pepper_ws::harvestResponse_<ContainerAllocator2> & rhs)
{
  return lhs.reply == rhs.reply;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::pepper_ws::harvestResponse_<ContainerAllocator1> & lhs, const ::pepper_ws::harvestResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace pepper_ws

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::pepper_ws::harvestResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pepper_ws::harvestResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pepper_ws::harvestResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pepper_ws::harvestResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pepper_ws::harvestResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pepper_ws::harvestResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pepper_ws::harvestResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8649bbb6dd4aac4f3d4e2a496294c98f";
  }

  static const char* value(const ::pepper_ws::harvestResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8649bbb6dd4aac4fULL;
  static const uint64_t static_value2 = 0x3d4e2a496294c98fULL;
};

template<class ContainerAllocator>
struct DataType< ::pepper_ws::harvestResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pepper_ws/harvestResponse";
  }

  static const char* value(const ::pepper_ws::harvestResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pepper_ws::harvestResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16 reply\n"
;
  }

  static const char* value(const ::pepper_ws::harvestResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pepper_ws::harvestResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.reply);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct harvestResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pepper_ws::harvestResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pepper_ws::harvestResponse_<ContainerAllocator>& v)
  {
    s << indent << "reply: ";
    Printer<int16_t>::stream(s, indent + "  ", v.reply);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PEPPER_WS_MESSAGE_HARVESTRESPONSE_H
