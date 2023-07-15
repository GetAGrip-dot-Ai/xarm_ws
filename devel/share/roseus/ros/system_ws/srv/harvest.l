;; Auto-generated. Do not edit!


(when (boundp 'system_ws::harvest)
  (if (not (find-package "SYSTEM_WS"))
    (make-package "SYSTEM_WS"))
  (shadow 'harvest (find-package "SYSTEM_WS")))
(unless (find-package "SYSTEM_WS::HARVEST")
  (make-package "SYSTEM_WS::HARVEST"))
(unless (find-package "SYSTEM_WS::HARVESTREQUEST")
  (make-package "SYSTEM_WS::HARVESTREQUEST"))
(unless (find-package "SYSTEM_WS::HARVESTRESPONSE")
  (make-package "SYSTEM_WS::HARVESTRESPONSE"))

(in-package "ROS")





(defclass system_ws::harvestRequest
  :super ros::object
  :slots (_req_id ))

(defmethod system_ws::harvestRequest
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

(defclass system_ws::harvestResponse
  :super ros::object
  :slots (_reply ))

(defmethod system_ws::harvestResponse
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

(defclass system_ws::harvest
  :super ros::object
  :slots ())

(setf (get system_ws::harvest :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get system_ws::harvest :datatype-) "system_ws/harvest")
(setf (get system_ws::harvest :request) system_ws::harvestRequest)
(setf (get system_ws::harvest :response) system_ws::harvestResponse)

(defmethod system_ws::harvestRequest
  (:response () (instance system_ws::harvestResponse :init)))

(setf (get system_ws::harvestRequest :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get system_ws::harvestRequest :datatype-) "system_ws/harvestRequest")
(setf (get system_ws::harvestRequest :definition-)
      "int16 req_id
---
int16 reply
")

(setf (get system_ws::harvestResponse :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get system_ws::harvestResponse :datatype-) "system_ws/harvestResponse")
(setf (get system_ws::harvestResponse :definition-)
      "int16 req_id
---
int16 reply
")



(provide :system_ws/harvest "49ea530aae91150cd4645ab17a741cf0")


