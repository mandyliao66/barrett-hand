;; Auto-generated. Do not edit!


(when (boundp 'bhand_controller::Service)
  (if (not (find-package "BHAND_CONTROLLER"))
    (make-package "BHAND_CONTROLLER"))
  (shadow 'Service (find-package "BHAND_CONTROLLER")))
(unless (find-package "BHAND_CONTROLLER::SERVICE")
  (make-package "BHAND_CONTROLLER::SERVICE"))

(in-package "ROS")
;;//! \htmlinclude Service.msg.html


(intern "*INIT_HAND*" (find-package "BHAND_CONTROLLER::SERVICE"))
(shadow '*INIT_HAND* (find-package "BHAND_CONTROLLER::SERVICE"))
(defconstant bhand_controller::Service::*INIT_HAND* 1)
(intern "*CLOSE_GRASP*" (find-package "BHAND_CONTROLLER::SERVICE"))
(shadow '*CLOSE_GRASP* (find-package "BHAND_CONTROLLER::SERVICE"))
(defconstant bhand_controller::Service::*CLOSE_GRASP* 2)
(intern "*OPEN_GRASP*" (find-package "BHAND_CONTROLLER::SERVICE"))
(shadow '*OPEN_GRASP* (find-package "BHAND_CONTROLLER::SERVICE"))
(defconstant bhand_controller::Service::*OPEN_GRASP* 3)
(intern "*SET_GRASP_1*" (find-package "BHAND_CONTROLLER::SERVICE"))
(shadow '*SET_GRASP_1* (find-package "BHAND_CONTROLLER::SERVICE"))
(defconstant bhand_controller::Service::*SET_GRASP_1* 4)
(intern "*SET_GRASP_2*" (find-package "BHAND_CONTROLLER::SERVICE"))
(shadow '*SET_GRASP_2* (find-package "BHAND_CONTROLLER::SERVICE"))
(defconstant bhand_controller::Service::*SET_GRASP_2* 5)
(intern "*CLOSE_HALF_GRASP*" (find-package "BHAND_CONTROLLER::SERVICE"))
(shadow '*CLOSE_HALF_GRASP* (find-package "BHAND_CONTROLLER::SERVICE"))
(defconstant bhand_controller::Service::*CLOSE_HALF_GRASP* 6)
(intern "*TARE_FTS*" (find-package "BHAND_CONTROLLER::SERVICE"))
(shadow '*TARE_FTS* (find-package "BHAND_CONTROLLER::SERVICE"))
(defconstant bhand_controller::Service::*TARE_FTS* 7)
(defclass bhand_controller::Service
  :super ros::object
  :slots ())

(defmethod bhand_controller::Service
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(setf (get bhand_controller::Service :md5sum-) "c09093085862e16e122942cf27b990b9")
(setf (get bhand_controller::Service :datatype-) "bhand_controller/Service")
(setf (get bhand_controller::Service :definition-)
      "# constants
int32 INIT_HAND = 1
int32 CLOSE_GRASP = 2
int32 OPEN_GRASP = 3
int32 SET_GRASP_1 = 4
int32 SET_GRASP_2 = 5
int32 CLOSE_HALF_GRASP = 6
int32 TARE_FTS = 7


")



(provide :bhand_controller/Service "c09093085862e16e122942cf27b990b9")


