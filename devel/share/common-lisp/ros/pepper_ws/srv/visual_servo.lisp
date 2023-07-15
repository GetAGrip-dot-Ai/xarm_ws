; Auto-generated. Do not edit!


(cl:in-package pepper_ws-srv)


;//! \htmlinclude visual_servo-request.msg.html

(cl:defclass <visual_servo-request> (roslisp-msg-protocol:ros-message)
  ((req_id
    :reader req_id
    :initarg :req_id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass visual_servo-request (<visual_servo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <visual_servo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'visual_servo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pepper_ws-srv:<visual_servo-request> is deprecated: use pepper_ws-srv:visual_servo-request instead.")))

(cl:ensure-generic-function 'req_id-val :lambda-list '(m))
(cl:defmethod req_id-val ((m <visual_servo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pepper_ws-srv:req_id-val is deprecated.  Use pepper_ws-srv:req_id instead.")
  (req_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <visual_servo-request>) ostream)
  "Serializes a message object of type '<visual_servo-request>"
  (cl:let* ((signed (cl:slot-value msg 'req_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <visual_servo-request>) istream)
  "Deserializes a message object of type '<visual_servo-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'req_id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<visual_servo-request>)))
  "Returns string type for a service object of type '<visual_servo-request>"
  "pepper_ws/visual_servoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'visual_servo-request)))
  "Returns string type for a service object of type 'visual_servo-request"
  "pepper_ws/visual_servoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<visual_servo-request>)))
  "Returns md5sum for a message object of type '<visual_servo-request>"
  "49ea530aae91150cd4645ab17a741cf0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'visual_servo-request)))
  "Returns md5sum for a message object of type 'visual_servo-request"
  "49ea530aae91150cd4645ab17a741cf0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<visual_servo-request>)))
  "Returns full string definition for message of type '<visual_servo-request>"
  (cl:format cl:nil "int16 req_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'visual_servo-request)))
  "Returns full string definition for message of type 'visual_servo-request"
  (cl:format cl:nil "int16 req_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <visual_servo-request>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <visual_servo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'visual_servo-request
    (cl:cons ':req_id (req_id msg))
))
;//! \htmlinclude visual_servo-response.msg.html

(cl:defclass <visual_servo-response> (roslisp-msg-protocol:ros-message)
  ((reply
    :reader reply
    :initarg :reply
    :type cl:fixnum
    :initform 0))
)

(cl:defclass visual_servo-response (<visual_servo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <visual_servo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'visual_servo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pepper_ws-srv:<visual_servo-response> is deprecated: use pepper_ws-srv:visual_servo-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <visual_servo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pepper_ws-srv:reply-val is deprecated.  Use pepper_ws-srv:reply instead.")
  (reply m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <visual_servo-response>) ostream)
  "Serializes a message object of type '<visual_servo-response>"
  (cl:let* ((signed (cl:slot-value msg 'reply)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <visual_servo-response>) istream)
  "Deserializes a message object of type '<visual_servo-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reply) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<visual_servo-response>)))
  "Returns string type for a service object of type '<visual_servo-response>"
  "pepper_ws/visual_servoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'visual_servo-response)))
  "Returns string type for a service object of type 'visual_servo-response"
  "pepper_ws/visual_servoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<visual_servo-response>)))
  "Returns md5sum for a message object of type '<visual_servo-response>"
  "49ea530aae91150cd4645ab17a741cf0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'visual_servo-response)))
  "Returns md5sum for a message object of type 'visual_servo-response"
  "49ea530aae91150cd4645ab17a741cf0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<visual_servo-response>)))
  "Returns full string definition for message of type '<visual_servo-response>"
  (cl:format cl:nil "int16 reply~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'visual_servo-response)))
  "Returns full string definition for message of type 'visual_servo-response"
  (cl:format cl:nil "int16 reply~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <visual_servo-response>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <visual_servo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'visual_servo-response
    (cl:cons ':reply (reply msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'visual_servo)))
  'visual_servo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'visual_servo)))
  'visual_servo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'visual_servo)))
  "Returns string type for a service object of type '<visual_servo>"
  "pepper_ws/visual_servo")