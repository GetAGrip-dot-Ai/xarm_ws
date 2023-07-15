
(cl:in-package :asdf)

(defsystem "system_ws-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "harvest" :depends-on ("_package_harvest"))
    (:file "_package_harvest" :depends-on ("_package"))
  ))