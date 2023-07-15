;; Auto-generated. Do not edit!


(when (boundp 'manipulation::dpoi)
  (if (not (find-package "MANIPULATION"))
    (make-package "MANIPULATION"))
  (shadow 'dpoi (find-package "MANIPULATION")))
(unless (find-package "MANIPULATION::DPOI")
  (make-package "MANIPULATION::DPOI"))

(in-package "ROS")
;;//! \htmlinclude dpoi.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass manipulation::dpoi
  :super ros::object
  :slots (_header _dx _dy _dz ))

(defmethod manipulation::dpoi
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:dx __dx) 0.0)
    ((:dy __dy) 0.0)
    ((:dz __dz) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _dx (float __dx))
   (setq _dy (float __dy))
   (setq _dz (float __dz))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:dx
   (&optional __dx)
   (if __dx (setq _dx __dx)) _dx)
  (:dy
   (&optional __dy)
   (if __dy (setq _dy __dy)) _dy)
  (:dz
   (&optional __dz)
   (if __dz (setq _dz __dz)) _dz)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _dx
    8
    ;; float64 _dy
    8
    ;; float64 _dz
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _dx
       (sys::poke _dx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _dy
       (sys::poke _dy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _dz
       (sys::poke _dz (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _dx
     (setq _dx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _dy
     (setq _dy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _dz
     (setq _dz (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get manipulation::dpoi :md5sum-) "2b83bf91e81f8ba47dfcdd1eb5ea305e")
(setf (get manipulation::dpoi :datatype-) "manipulation/dpoi")
(setf (get manipulation::dpoi :definition-)
      "Header header
float64 dx
float64 dy
float64 dz

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :manipulation/dpoi "2b83bf91e81f8ba47dfcdd1eb5ea305e")


