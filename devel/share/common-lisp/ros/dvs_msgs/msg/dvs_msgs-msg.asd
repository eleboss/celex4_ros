
(cl:in-package :asdf)

(defsystem "dvs_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Event" :depends-on ("_package_Event"))
    (:file "_package_Event" :depends-on ("_package"))
    (:file "EventArray" :depends-on ("_package_EventArray"))
    (:file "_package_EventArray" :depends-on ("_package"))
    (:file "FeatureImu" :depends-on ("_package_FeatureImu"))
    (:file "_package_FeatureImu" :depends-on ("_package"))
  ))