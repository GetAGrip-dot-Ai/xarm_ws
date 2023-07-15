;; Auto-generated. Do not edit!


(when (boundp 'manipulation::harvest)
  (if (not (find-package "MANIPULATION"))
    (make-package "MANIPULATION"))
  (shadow 'harvest (find-package "MANIPULATION")))
(unless (find-package "MANIPULATION::HARVEST")
  (make-package "MANIPULATION::HARVEST"))
(unless (find-package "MANIPULATION::HARVESTREQUEST")
  (make-package "MANIPULATION::HARVESTREQUEST"))
(unless (find-package "MANIPULATION::HARVESTRESPONSE")
  (make-package "MANIPULATION::HARVESTRESPONSE"))

(in-package "ROS")





(defclass manipulation::harvestRequest
  :super ros::object
  :slots (_req_id ))

(defmethod manipulation::harvestRequest
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

(defclass manipulation::harvestResponse
  :super ros::object
  :slots (_reply ))

(defmethod manipulation::harvestResponse
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

(defclass manipulation::harvest
  :super ros::object
  :slots ())

(setf (get manipulation::harvest :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get manipulation::harvest :datatype-) "manipulation/harvest")
(setf (get manipulation::harvest :request) manipulation::harvestRequest)
(setf (get manipulation::harvest :response) manipulation::harvestResponse)

(defmethod manipulation::harvestRequest
  (:response () (instance manipulation::harvestResponse :init)))

(setf (get manipulation::harvestRequest :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get manipulation::harvestRequest :datatype-) "manipulation/harvestRequest")
(setf (get manipulation::harvestRequest :definition-)
      "int16 req_id
---
int16 reply
")

(setf (get manipulation::harvestResponse :md5sum-) "49ea530aae91150cd4645ab17a741cf0")
(setf (get manipulation::harvestResponse :datatype-) "manipulation/harvestResponse")
(setf (get manipulation::harvestResponse :definition-)
      "int16 req_id
---
int16 reply
")



(provide :manipulation/harvest "49ea530aae91150cd4645ab17a741cf0")


