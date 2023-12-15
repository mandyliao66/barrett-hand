;; Auto-generated. Do not edit!


(when (boundp 'bhand_controller::SetControlMode)
  (if (not (find-package "BHAND_CONTROLLER"))
    (make-package "BHAND_CONTROLLER"))
  (shadow 'SetControlMode (find-package "BHAND_CONTROLLER")))
(unless (find-package "BHAND_CONTROLLER::SETCONTROLMODE")
  (make-package "BHAND_CONTROLLER::SETCONTROLMODE"))
(unless (find-package "BHAND_CONTROLLER::SETCONTROLMODEREQUEST")
  (make-package "BHAND_CONTROLLER::SETCONTROLMODEREQUEST"))
(unless (find-package "BHAND_CONTROLLER::SETCONTROLMODERESPONSE")
  (make-package "BHAND_CONTROLLER::SETCONTROLMODERESPONSE"))

(in-package "ROS")





(defclass bhand_controller::SetControlModeRequest
  :super ros::object
  :slots (_mode ))

(defmethod bhand_controller::SetControlModeRequest
  (:init
   (&key
    ((:mode __mode) "")
    )
   (send-super :init)
   (setq _mode (string __mode))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:serialization-length
   ()
   (+
    ;; string _mode
    4 (length _mode)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _mode
       (write-long (length _mode) s) (princ _mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass bhand_controller::SetControlModeResponse
  :super ros::object
  :slots (_ret ))

(defmethod bhand_controller::SetControlModeResponse
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

(defclass bhand_controller::SetControlMode
  :super ros::object
  :slots ())

(setf (get bhand_controller::SetControlMode :md5sum-) "b696448a6984c2e37a93990a5f048086")
(setf (get bhand_controller::SetControlMode :datatype-) "bhand_controller/SetControlMode")
(setf (get bhand_controller::SetControlMode :request) bhand_controller::SetControlModeRequest)
(setf (get bhand_controller::SetControlMode :response) bhand_controller::SetControlModeResponse)

(defmethod bhand_controller::SetControlModeRequest
  (:response () (instance bhand_controller::SetControlModeResponse :init)))

(setf (get bhand_controller::SetControlModeRequest :md5sum-) "b696448a6984c2e37a93990a5f048086")
(setf (get bhand_controller::SetControlModeRequest :datatype-) "bhand_controller/SetControlModeRequest")
(setf (get bhand_controller::SetControlModeRequest :definition-)
      "# POSITION, VELOCITY
string mode
---
bool ret

")

(setf (get bhand_controller::SetControlModeResponse :md5sum-) "b696448a6984c2e37a93990a5f048086")
(setf (get bhand_controller::SetControlModeResponse :datatype-) "bhand_controller/SetControlModeResponse")
(setf (get bhand_controller::SetControlModeResponse :definition-)
      "# POSITION, VELOCITY
string mode
---
bool ret

")



(provide :bhand_controller/SetControlMode "b696448a6984c2e37a93990a5f048086")


