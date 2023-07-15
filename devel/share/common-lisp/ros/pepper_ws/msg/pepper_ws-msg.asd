
(cl:in-package :asdf)

(defsystem "pepper_ws-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :shape_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Obstacle" :depends-on ("_package_Obstacle"))
    (:file "_package_Obstacle" :depends-on ("_package"))
  ))