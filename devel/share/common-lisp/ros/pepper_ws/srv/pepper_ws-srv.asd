
(cl:in-package :asdf)

(defsystem "pepper_ws-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "harvest" :depends-on ("_package_harvest"))
    (:file "_package_harvest" :depends-on ("_package"))
    (:file "multi_frame" :depends-on ("_package_multi_frame"))
    (:file "_package_multi_frame" :depends-on ("_package"))
    (:file "visual_servo" :depends-on ("_package_visual_servo"))
    (:file "_package_visual_servo" :depends-on ("_package"))
  ))