;; Auto-generated. Do not edit!


(when (boundp 'manipulation::multi_frame)
  (if (not (find-package "MANIPULATION"))
    (make-package "MANIPULATION"))
  (shadow 'multi_frame (find-package "MANIPULATION")))
(unless (find-package "MANIPULATION::MULTI_FRAME")
  (make-package "MANIPULATION::MULTI_FRAME"))
(unless (find-package "MANIPULATION::MULTI_FRAMEREQUEST")
  (make-package "MANIPULATION::MULTI_FRAMEREQUEST"))
(unless (find-package "MANIPULATION::MULTI_FRAMERESPONSE")
  (make-package "MANIPULATION::MULTI_FRAMERESPONSE"))

(in-package "ROS")





(defclass manipulation::multi_frameRequest
  :super ros::object
  :slots (_req_id ))

(defmethod manipulation::multi_frameRequest
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

(defclass manipulation::multi_frameResponse
  :super ros::object
  :slots (_reply ))

(defmethod manipulation::multi_frameResponse
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

(defclass manipulation::multi_frame
  :super ros::object
  :slots ())

(setf (get manipulation::multi_frame :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get manipulation::multi_frame :datatype-) "manipulation/multi_frame")
(setf (get manipulation::multi_frame :request) manipulation::multi_frameRequest)
(setf (get manipulation::multi_frame :response) manipulation::multi_frameResponse)

(defmethod manipulation::multi_frameRequest
  (:response () (instance manipulation::multi_frameResponse :init)))

(setf (get manipulation::multi_frameRequest :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get manipulation::multi_frameRequest :datatype-) "manipulation/multi_frameRequest")
(setf (get manipulation::multi_frameRequest :definition-)
      "int16 req_id
---
int16 reply
")

(setf (get manipulation::multi_frameResponse :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get manipulation::multi_frameResponse :datatype-) "manipulation/multi_frameResponse")
(setf (get manipulation::multi_frameResponse :definition-)
      "int16 req_id
---
int16 reply
")



(provide :manipulation/multi_frame "49ea530aae91150cd4645ab17a741cf0")


