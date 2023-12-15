#!/usr/bin/env python

import rospy
from std_msgs.msg import Float64
from sensor_msgs.msg import JointState
from bhand_controller.srv import Actions


def spread_node():
    rospy.init_node('spread_node')
    pub = rospy.Publisher('/bhand_node/command', JointState, queue_size=10)
    rate = rospy.Rate(10) 

    rospy.wait_for_service('bhand_node/actions')
    actions_service = rospy.ServiceProxy('bhand_node/actions', Actions)

    # Initialize
    rospy.loginfo("Initializing")
    actions_service(1)
    rospy.sleep(1.0)
    cont = 1

    while cont == 1:

        

        joint_state = JointState()
        joint_state.name = ['bh_j21_joint']
        joint_state.position = [0]
        joint_state.velocity = [0]
        joint_state.effort = [0]

        pub.publish(joint_state)

        rospy.sleep(1.5)

        angle = float(input("Enter your desired angle: "))

        joint_state.position = [angle]

        pub.publish(joint_state)
        rospy.loginfo("Angle is now %f", angle)
        rospy.sleep(1.0)

        cont = bool(input("to set the angle again, press 1. to exit, press 0: "))

if __name__ == '__main__':
    try:
        spread_node()
    except rospy.ROSInterruptException:
        pass
