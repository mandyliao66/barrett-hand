;; Auto-generated. Do not edit!


(when (boundp 'bhand_controller::State)
  (if (not (find-package "BHAND_CONTROLLER"))
    (make-package "BHAND_CONTROLLER"))
  (shadow 'State (find-package "BHAND_CONTROLLER")))
(unless (find-package "BHAND_CONTROLLER::STATE")
  (make-package "BHAND_CONTROLLER::STATE"))

(in-package "ROS")
;;//! \htmlinclude State.msg.html


(intern "*INIT_STATE*" (find-package "BHAND_CONTROLLER::STATE"))
(shadow '*INIT_STATE* (find-package "BHAND_CONTROLLER::STATE"))
(defconstant bhand_controller::State::*INIT_STATE* 100)
(intern "*STANDBY_STATE*" (find-package "BHAND_CONTROLLER::STATE"))
(shadow '*STANDBY_STATE* (find-package "BHAND_CONTROLLER::STATE"))
(defconstant bhand_controller::State::*STANDBY_STATE* 200)
(intern "*READY_STATE*" (find-package "BHAND_CONTROLLER::STATE"))
(shadow '*READY_STATE* (find-package "BHAND_CONTROLLER::STATE"))
(defconstant bhand_controller::State::*READY_STATE* 300)
(intern "*EMERGENCY_STATE*" (find-package "BHAND_CONTROLLER::STATE"))
(shadow '*EMERGENCY_STATE* (find-package "BHAND_CONTROLLER::STATE"))
(defconstant bhand_controller::State::*EMERGENCY_STATE* 400)
(intern "*FAILURE_STATE*" (find-package "BHAND_CONTROLLER::STATE"))
(shadow '*FAILURE_STATE* (find-package "BHAND_CONTROLLER::STATE"))
(defconstant bhand_controller::State::*FAILURE_STATE* 500)
(intern "*SHUTDOWN_STATE*" (find-package "BHAND_CONTROLLER::STATE"))
(shadow '*SHUTDOWN_STATE* (find-package "BHAND_CONTROLLER::STATE"))
(defconstant bhand_controller::State::*SHUTDOWN_STATE* 600)
(defclass bhand_controller::State
  :super ros::object
  :slots (_state _control_mode _hand_initialized _desired_freq _real_freq _state_description _temp_f1 _temp_f2 _temp_f3 _temp_spread ))

(defmethod bhand_controller::State
  (:init
   (&key
    ((:state __state) 0)
    ((:control_mode __control_mode) "")
    ((:hand_initialized __hand_initialized) nil)
    ((:desired_freq __desired_freq) 0.0)
    ((:real_freq __real_freq) 0.0)
    ((:state_description __state_description) "")
    ((:temp_f1 __temp_f1) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:temp_f2 __temp_f2) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:temp_f3 __temp_f3) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:temp_spread __temp_spread) (make-array 2 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _state (round __state))
   (setq _control_mode (string __control_mode))
   (setq _hand_initialized __hand_initialized)
   (setq _desired_freq (float __desired_freq))
   (setq _real_freq (float __real_freq))
   (setq _state_description (string __state_description))
   (setq _temp_f1 __temp_f1)
   (setq _temp_f2 __temp_f2)
   (setq _temp_f3 __temp_f3)
   (setq _temp_spread __temp_spread)
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:control_mode
   (&optional __control_mode)
   (if __control_mode (setq _control_mode __control_mode)) _control_mode)
  (:hand_initialized
   (&optional __hand_initialized)
   (if __hand_initialized (setq _hand_initialized __hand_initialized)) _hand_initialized)
  (:desired_freq
   (&optional __desired_freq)
   (if __desired_freq (setq _desired_freq __desired_freq)) _desired_freq)
  (:real_freq
   (&optional __real_freq)
   (if __real_freq (setq _real_freq __real_freq)) _real_freq)
  (:state_description
   (&optional __state_description)
   (if __state_description (setq _state_description __state_description)) _state_description)
  (:temp_f1
   (&optional __temp_f1)
   (if __temp_f1 (setq _temp_f1 __temp_f1)) _temp_f1)
  (:temp_f2
   (&optional __temp_f2)
   (if __temp_f2 (setq _temp_f2 __temp_f2)) _temp_f2)
  (:temp_f3
   (&optional __temp_f3)
   (if __temp_f3 (setq _temp_f3 __temp_f3)) _temp_f3)
  (:temp_spread
   (&optional __temp_spread)
   (if __temp_spread (setq _temp_spread __temp_spread)) _temp_spread)
  (:serialization-length
   ()
   (+
    ;; int32 _state
    4
    ;; string _control_mode
    4 (length _control_mode)
    ;; bool _hand_initialized
    1
    ;; float32 _desired_freq
    4
    ;; float32 _real_freq
    4
    ;; string _state_description
    4 (length _state_description)
    ;; float32[2] _temp_f1
    (* 4    2)
    ;; float32[2] _temp_f2
    (* 4    2)
    ;; float32[2] _temp_f3
    (* 4    2)
    ;; float32[2] _temp_spread
    (* 4    2)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _state
       (write-long _state s)
     ;; string _control_mode
       (write-long (length _control_mode) s) (princ _control_mode s)
     ;; bool _hand_initialized
       (if _hand_initialized (write-byte -1 s) (write-byte 0 s))
     ;; float32 _desired_freq
       (sys::poke _desired_freq (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _real_freq
       (sys::poke _real_freq (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _state_description
       (write-long (length _state_description) s) (princ _state_description s)
     ;; float32[2] _temp_f1
     (dotimes (i 2)
       (sys::poke (elt _temp_f1 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[2] _temp_f2
     (dotimes (i 2)
       (sys::poke (elt _temp_f2 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[2] _temp_f3
     (dotimes (i 2)
       (sys::poke (elt _temp_f3 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[2] _temp_spread
     (dotimes (i 2)
       (sys::poke (elt _temp_spread i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _state
     (setq _state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _control_mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _control_mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _hand_initialized
     (setq _hand_initialized (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _desired_freq
     (setq _desired_freq (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _real_freq
     (setq _real_freq (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _state_description
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _state_description (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32[2] _temp_f1
   (dotimes (i (length _temp_f1))
     (setf (elt _temp_f1 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[2] _temp_f2
   (dotimes (i (length _temp_f2))
     (setf (elt _temp_f2 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[2] _temp_f3
   (dotimes (i (length _temp_f3))
     (setf (elt _temp_f3 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[2] _temp_spread
   (dotimes (i (length _temp_spread))
     (setf (elt _temp_spread i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get bhand_controller::State :md5sum-) "43dbdaf8df84846b4d0203e0d6845e11")
(setf (get bhand_controller::State :datatype-) "bhand_controller/State")
(setf (get bhand_controller::State :definition-)
      "# constants
int32 INIT_STATE = 100
int32 STANDBY_STATE = 200
int32 READY_STATE = 300
int32 EMERGENCY_STATE = 400
int32 FAILURE_STATE = 500
int32 SHUTDOWN_STATE = 600


# state of the component
int32 state
# Control mode
string control_mode
# Flag active when the hand position has been initialized
bool hand_initialized
# desired control loop frecuency
float32 desired_freq
# real frecuency 
float32 real_freq
# Description of the state
string state_description
# [temp_motor, temp_puck]
float32[2] temp_f1
# [temp_motor, temp_puck]
float32[2] temp_f2
# [temp_motor, temp_puck]
float32[2] temp_f3
# [temp_motor, temp_puck]
float32[2] temp_spread

")



(provide :bhand_controller/State "43dbdaf8df84846b4d0203e0d6845e11")


