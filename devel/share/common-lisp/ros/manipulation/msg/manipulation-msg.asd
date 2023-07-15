
(cl:in-package :asdf)

(defsystem "manipulation-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :shape_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Obstacle" :depends-on ("_package_Obstacle"))
    (:file "_package_Obstacle" :depends-on ("_package"))
    (:file "dpoi" :depends-on ("_package_dpoi"))
    (:file "_package_dpoi" :depends-on ("_package"))
  ))