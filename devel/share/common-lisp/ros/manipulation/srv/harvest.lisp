; Auto-generated. Do not edit!


(cl:in-package manipulation-srv)


;//! \htmlinclude harvest-request.msg.html

(cl:defclass <harvest-request> (roslisp-msg-protocol:ros-message)
  ((req_id
    :reader req_id
    :initarg :req_id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass harvest-request (<harvest-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <harvest-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'harvest-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulation-srv:<harvest-request> is deprecated: use manipulation-srv:harvest-request instead.")))

(cl:ensure-generic-function 'req_id-val :lambda-list '(m))
(cl:defmethod req_id-val ((m <harvest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulation-srv:req_id-val is deprecated.  Use manipulation-srv:req_id instead.")
  (req_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <harvest-request>) ostream)
  "Serializes a message object of type '<harvest-request>"
  (cl:let* ((signed (cl:slot-value msg 'req_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <harvest-request>) istream)
  "Deserializes a message object of type '<harvest-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'req_id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<harvest-request>)))
  "Returns string type for a service object of type '<harvest-request>"
  "manipulation/harvestRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'harvest-request)))
  "Returns string type for a service object of type 'harvest-request"
  "manipulation/harvestRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<harvest-request>)))
  "Returns md5sum for a message object of type '<harvest-request>"
  "49ea530aae91150cd4645ab17a741cf0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'harvest-request)))
  "Returns md5sum for a message object of type 'harvest-request"
  "49ea530aae91150cd4645ab17a741cf0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<harvest-request>)))
  "Returns full string definition for message of type '<harvest-request>"
  (cl:format cl:nil "int16 req_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'harvest-request)))
  "Returns full string definition for message of type 'harvest-request"
  (cl:format cl:nil "int16 req_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <harvest-request>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <harvest-request>))
  "Converts a ROS message object to a list"
  (cl:list 'harvest-request
    (cl:cons ':req_id (req_id msg))
))
;//! \htmlinclude harvest-response.msg.html

(cl:defclass <harvest-response> (roslisp-msg-protocol:ros-message)
  ((reply
    :reader reply
    :initarg :reply
    :type cl:fixnum
    :initform 0))
)

(cl:defclass harvest-response (<harvest-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <harvest-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'harvest-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulation-srv:<harvest-response> is deprecated: use manipulation-srv:harvest-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <harvest-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulation-srv:reply-val is deprecated.  Use manipulation-srv:reply instead.")
  (reply m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <harvest-response>) ostream)
  "Serializes a message object of type '<harvest-response>"
  (cl:let* ((signed (cl:slot-value msg 'reply)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <harvest-response>) istream)
  "Deserializes a message object of type '<harvest-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reply) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<harvest-response>)))
  "Returns string type for a service object of type '<harvest-response>"
  "manipulation/harvestResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'harvest-response)))
  "Returns string type for a service object of type 'harvest-response"
  "manipulation/harvestResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<harvest-response>)))
  "Returns md5sum for a message object of type '<harvest-response>"
  "49ea530aae91150cd4645ab17a741cf0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'harvest-response)))
  "Returns md5sum for a message object of type 'harvest-response"
  "49ea530aae91150cd4645ab17a741cf0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<harvest-response>)))
  "Returns full string definition for message of type '<harvest-response>"
  (cl:format cl:nil "int16 reply~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'harvest-response)))
  "Returns full string definition for message of type 'harvest-response"
  (cl:format cl:nil "int16 reply~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <harvest-response>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <harvest-response>))
  "Converts a ROS message object to a list"
  (cl:list 'harvest-response
    (cl:cons ':reply (reply msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'harvest)))
  'harvest-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'harvest)))
  'harvest-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'harvest)))
  "Returns string type for a service object of type '<harvest>"
  "manipulation/harvest")