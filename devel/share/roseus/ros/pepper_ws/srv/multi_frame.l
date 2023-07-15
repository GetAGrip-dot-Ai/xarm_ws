;; Auto-generated. Do not edit!


(when (boundp 'pepper_ws::multi_frame)
  (if (not (find-package "PEPPER_WS"))
    (make-package "PEPPER_WS"))
  (shadow 'multi_frame (find-package "PEPPER_WS")))
(unless (find-package "PEPPER_WS::MULTI_FRAME")
  (make-package "PEPPER_WS::MULTI_FRAME"))
(unless (find-package "PEPPER_WS::MULTI_FRAMEREQUEST")
  (make-package "PEPPER_WS::MULTI_FRAMEREQUEST"))
(unless (find-package "PEPPER_WS::MULTI_FRAMERESPONSE")
  (make-package "PEPPER_WS::MULTI_FRAMERESPONSE"))

(in-package "ROS")





(defclass pepper_ws::multi_frameRequest
  :super ros::object
  :slots (_req_id ))

(defmethod pepper_ws::multi_frameRequest
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

(defclass pepper_ws::multi_frameResponse
  :super ros::object
  :slots (_reply ))

(defmethod pepper_ws::multi_frameResponse
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

(defclass pepper_ws::multi_frame
  :super ros::object
  :slots ())

(setf (get pepper_ws::multi_frame :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get pepper_ws::multi_frame :datatype-) "pepper_ws/multi_frame")
(setf (get pepper_ws::multi_frame :request) pepper_ws::multi_frameRequest)
(setf (get pepper_ws::multi_frame :response) pepper_ws::multi_frameResponse)

(defmethod pepper_ws::multi_frameRequest
  (:response () (instance pepper_ws::multi_frameResponse :init)))

(setf (get pepper_ws::multi_frameRequest :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get pepper_ws::multi_frameRequest :datatype-) "pepper_ws/multi_frameRequest")
(setf (get pepper_ws::multi_frameRequest :definition-)
      "int16 req_id
---
int16 reply
")

(setf (get pepper_ws::multi_frameResponse :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get pepper_ws::multi_frameResponse :datatype-) "pepper_ws/multi_frameResponse")
(setf (get pepper_ws::multi_frameResponse :definition-)
      "int16 req_id
---
int16 reply
")



(provide :pepper_ws/multi_frame "49ea530aae91150cd4645ab17a741cf0")


