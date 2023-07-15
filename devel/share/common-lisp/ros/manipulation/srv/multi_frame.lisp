; Auto-generated. Do not edit!


(cl:in-package manipulation-srv)


;//! \htmlinclude multi_frame-request.msg.html

(cl:defclass <multi_frame-request> (roslisp-msg-protocol:ros-message)
  ((req_id
    :reader req_id
    :initarg :req_id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass multi_frame-request (<multi_frame-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <multi_frame-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'multi_frame-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulation-srv:<multi_frame-request> is deprecated: use manipulation-srv:multi_frame-request instead.")))

(cl:ensure-generic-function 'req_id-val :lambda-list '(m))
(cl:defmethod req_id-val ((m <multi_frame-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulation-srv:req_id-val is deprecated.  Use manipulation-srv:req_id instead.")
  (req_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <multi_frame-request>) ostream)
  "Serializes a message object of type '<multi_frame-request>"
  (cl:let* ((signed (cl:slot-value msg 'req_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <multi_frame-request>) istream)
  "Deserializes a message object of type '<multi_frame-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'req_id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<multi_frame-request>)))
  "Returns string type for a service object of type '<multi_frame-request>"
  "manipulation/multi_frameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'multi_frame-request)))
  "Returns string type for a service object of type 'multi_frame-request"
  "manipulation/multi_frameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<multi_frame-request>)))
  "Returns md5sum for a message object of type '<multi_frame-request>"
  "49ea530aae91150cd4645ab17a741cf0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'multi_frame-request)))
  "Returns md5sum for a message object of type 'multi_frame-request"
  "49ea530aae91150cd4645ab17a741cf0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<multi_frame-request>)))
  "Returns full string definition for message of type '<multi_frame-request>"
  (cl:format cl:nil "int16 req_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'multi_frame-request)))
  "Returns full string definition for message of type 'multi_frame-request"
  (cl:format cl:nil "int16 req_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <multi_frame-request>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <multi_frame-request>))
  "Converts a ROS message object to a list"
  (cl:list 'multi_frame-request
    (cl:cons ':req_id (req_id msg))
))
;//! \htmlinclude multi_frame-response.msg.html

(cl:defclass <multi_frame-response> (roslisp-msg-protocol:ros-message)
  ((reply
    :reader reply
    :initarg :reply
    :type cl:fixnum
    :initform 0))
)

(cl:defclass multi_frame-response (<multi_frame-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <multi_frame-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'multi_frame-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulation-srv:<multi_frame-response> is deprecated: use manipulation-srv:multi_frame-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <multi_frame-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulation-srv:reply-val is deprecated.  Use manipulation-srv:reply instead.")
  (reply m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <multi_frame-response>) ostream)
  "Serializes a message object of type '<multi_frame-response>"
  (cl:let* ((signed (cl:slot-value msg 'reply)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <multi_frame-response>) istream)
  "Deserializes a message object of type '<multi_frame-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reply) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<multi_frame-response>)))
  "Returns string type for a service object of type '<multi_frame-response>"
  "manipulation/multi_frameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'multi_frame-response)))
  "Returns string type for a service object of type 'multi_frame-response"
  "manipulation/multi_frameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<multi_frame-response>)))
  "Returns md5sum for a message object of type '<multi_frame-response>"
  "49ea530aae91150cd4645ab17a741cf0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'multi_frame-response)))
  "Returns md5sum for a message object of type 'multi_frame-response"
  "49ea530aae91150cd4645ab17a741cf0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<multi_frame-response>)))
  "Returns full string definition for message of type '<multi_frame-response>"
  (cl:format cl:nil "int16 reply~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'multi_frame-response)))
  "Returns full string definition for message of type 'multi_frame-response"
  (cl:format cl:nil "int16 reply~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <multi_frame-response>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <multi_frame-response>))
  "Converts a ROS message object to a list"
  (cl:list 'multi_frame-response
    (cl:cons ':reply (reply msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'multi_frame)))
  'multi_frame-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'multi_frame)))
  'multi_frame-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'multi_frame)))
  "Returns string type for a service object of type '<multi_frame>"
  "manipulation/multi_frame")