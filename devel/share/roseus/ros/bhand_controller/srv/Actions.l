;; Auto-generated. Do not edit!


(when (boundp 'bhand_controller::Actions)
  (if (not (find-package "BHAND_CONTROLLER"))
    (make-package "BHAND_CONTROLLER"))
  (shadow 'Actions (find-package "BHAND_CONTROLLER")))
(unless (find-package "BHAND_CONTROLLER::ACTIONS")
  (make-package "BHAND_CONTROLLER::ACTIONS"))
(unless (find-package "BHAND_CONTROLLER::ACTIONSREQUEST")
  (make-package "BHAND_CONTROLLER::ACTIONSREQUEST"))
(unless (find-package "BHAND_CONTROLLER::ACTIONSRESPONSE")
  (make-package "BHAND_CONTROLLER::ACTIONSRESPONSE"))

(in-package "ROS")





(defclass bhand_controller::ActionsRequest
  :super ros::object
  :slots (_action ))

(defmethod bhand_controller::ActionsRequest
  (:init
   (&key
    ((:action __action) 0)
    )
   (send-super :init)
   (setq _action (round __action))
   self)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:serialization-length
   ()
   (+
    ;; int32 _action
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _action
       (write-long _action s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _action
     (setq _action (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass bhand_controller::ActionsResponse
  :super ros::object
  :slots (_ret ))

(defmethod bhand_controller::ActionsResponse
  (:init
   (&key
    ((:ret __ret) nil)
    )
   (send-super :init)
   (setq _ret __ret)
   self)
  (:ret
   (&optional __ret)
   (if __ret (setq _ret __ret)) _ret)
  (:serialization-length
   ()
   (+
    ;; bool _ret
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _ret
       (if _ret (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _ret
     (setq _ret (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass bhand_controller::Actions
  :super ros::object
  :slots ())

(setf (get bhand_controller::Actions :md5sum-) "89af4e368677e306adbb14bec6d3e1c0")
(setf (get bhand_controller::Actions :datatype-) "bhand_controller/Actions")
(setf (get bhand_controller::Actions :request) bhand_controller::ActionsRequest)
(setf (get bhand_controller::Actions :response) bhand_controller::ActionsResponse)

(defmethod bhand_controller::ActionsRequest
  (:response () (instance bhand_controller::ActionsResponse :init)))

(setf (get bhand_controller::ActionsRequest :md5sum-) "89af4e368677e306adbb14bec6d3e1c0")
(setf (get bhand_controller::ActionsRequest :datatype-) "bhand_controller/ActionsRequest")
(setf (get bhand_controller::ActionsRequest :definition-)
      "# Action ID defined in bhand/msg/Service.msg
int32 action
---
bool ret

")

(setf (get bhand_controller::ActionsResponse :md5sum-) "89af4e368677e306adbb14bec6d3e1c0")
(setf (get bhand_controller::ActionsResponse :datatype-) "bhand_controller/ActionsResponse")
(setf (get bhand_controller::ActionsResponse :definition-)
      "# Action ID defined in bhand/msg/Service.msg
int32 action
---
bool ret

")



(provide :bhand_controller/Actions "89af4e368677e306adbb14bec6d3e1c0")


