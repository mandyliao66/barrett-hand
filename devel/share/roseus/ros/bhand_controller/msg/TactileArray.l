;; Auto-generated. Do not edit!


(when (boundp 'bhand_controller::TactileArray)
  (if (not (find-package "BHAND_CONTROLLER"))
    (make-package "BHAND_CONTROLLER"))
  (shadow 'TactileArray (find-package "BHAND_CONTROLLER")))
(unless (find-package "BHAND_CONTROLLER::TACTILEARRAY")
  (make-package "BHAND_CONTROLLER::TACTILEARRAY"))

(in-package "ROS")
;;//! \htmlinclude TactileArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass bhand_controller::TactileArray
  :super ros::object
  :slots (_header _finger1 _finger2 _finger3 _palm ))

(defmethod bhand_controller::TactileArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:finger1 __finger1) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:finger2 __finger2) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:finger3 __finger3) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:palm __palm) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _finger1 __finger1)
   (setq _finger2 __finger2)
   (setq _finger3 __finger3)
   (setq _palm __palm)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:finger1
   (&optional __finger1)
   (if __finger1 (setq _finger1 __finger1)) _finger1)
  (:finger2
   (&optional __finger2)
   (if __finger2 (setq _finger2 __finger2)) _finger2)
  (:finger3
   (&optional __finger3)
   (if __finger3 (setq _finger3 __finger3)) _finger3)
  (:palm
   (&optional __palm)
   (if __palm (setq _palm __palm)) _palm)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32[] _finger1
    (* 4    (length _finger1)) 4
    ;; float32[] _finger2
    (* 4    (length _finger2)) 4
    ;; float32[] _finger3
    (* 4    (length _finger3)) 4
    ;; float32[] _palm
    (* 4    (length _palm)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32[] _finger1
     (write-long (length _finger1) s)
     (dotimes (i (length _finger1))
       (sys::poke (elt _finger1 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _finger2
     (write-long (length _finger2) s)
     (dotimes (i (length _finger2))
       (sys::poke (elt _finger2 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _finger3
     (write-long (length _finger3) s)
     (dotimes (i (length _finger3))
       (sys::poke (elt _finger3 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _palm
     (write-long (length _palm) s)
     (dotimes (i (length _palm))
       (sys::poke (elt _palm i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32[] _finger1
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _finger1 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _finger1 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _finger2
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _finger2 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _finger2 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _finger3
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _finger3 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _finger3 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _palm
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _palm (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _palm i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get bhand_controller::TactileArray :md5sum-) "c13cabdf3bf4be5ec7e27247c9867860")
(setf (get bhand_controller::TactileArray :datatype-) "bhand_controller/TactileArray")
(setf (get bhand_controller::TactileArray :definition-)
      "Header header
# Units in N/cm2
# array sensor of the finger 1
float32[] finger1
# array sensor of the finger 2
float32[] finger2
# array sensor of the finger 3
float32[] finger3
# array sensor of the palm
float32[] palm


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :bhand_controller/TactileArray "c13cabdf3bf4be5ec7e27247c9867860")


