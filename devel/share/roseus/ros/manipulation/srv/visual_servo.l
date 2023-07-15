;; Auto-generated. Do not edit!


(when (boundp 'manipulation::visual_servo)
  (if (not (find-package "MANIPULATION"))
    (make-package "MANIPULATION"))
  (shadow 'visual_servo (find-package "MANIPULATION")))
(unless (find-package "MANIPULATION::VISUAL_SERVO")
  (make-package "MANIPULATION::VISUAL_SERVO"))
(unless (find-package "MANIPULATION::VISUAL_SERVOREQUEST")
  (make-package "MANIPULATION::VISUAL_SERVOREQUEST"))
(unless (find-package "MANIPULATION::VISUAL_SERVORESPONSE")
  (make-package "MANIPULATION::VISUAL_SERVORESPONSE"))

(in-package "ROS")





(defclass manipulation::visual_servoRequest
  :super ros::object
  :slots (_req_id ))

(defmethod manipulation::visual_servoRequest
  (:init
   (&key
    ((:req_id __req_id) 0)
    )
   (send-super :init)
   (setq _req_id (round __req_id))
   self)
  (:req_id
   (&optional __req_id)
   (if __req_id (setq _req_id __req_id)) _req_id)
  (:serialization-length
   ()
   (+
    ;; int16 _req_id
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _req_id
       (write-word _req_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _req_id
     (setq _req_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass manipulation::visual_servoResponse
  :super ros::object
  :slots (_reply ))

(defmethod manipulation::visual_servoResponse
  (:init
   (&key
    ((:reply __reply) 0)
    )
   (send-super :init)
   (setq _reply (round __reply))
   self)
  (:reply
   (&optional __reply)
   (if __reply (setq _reply __reply)) _reply)
  (:serialization-length
   ()
   (+
    ;; int16 _reply
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _reply
       (write-word _reply s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _reply
     (setq _reply (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass manipulation::visual_servo
  :super ros::object
  :slots ())

(setf (get manipulation::visual_servo :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get manipulation::visual_servo :datatype-) "manipulation/visual_servo")
(setf (get manipulation::visual_servo :request) manipulation::visual_servoRequest)
(setf (get manipulation::visual_servo :response) manipulation::visual_servoResponse)

(defmethod manipulation::visual_servoRequest
  (:response () (instance manipulation::visual_servoResponse :init)))

(setf (get manipulation::visual_servoRequest :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get manipulation::visual_servoRequest :datatype-) "manipulation/visual_servoRequest")
(setf (get manipulation::visual_servoRequest :definition-)
      "int16 req_id
---
int16 reply
")

(setf (get manipulation::visual_servoResponse :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get manipulation::visual_servoResponse :datatype-) "manipulation/visual_servoResponse")
(setf (get manipulation::visual_servoResponse :definition-)
      "int16 req_id
---
int16 reply
")



(provide :manipulation/visual_servo "49ea530aae91150cd4645ab17a741cf0")


