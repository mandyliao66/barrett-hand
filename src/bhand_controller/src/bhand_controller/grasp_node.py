#!/usr/bin/env python

import rospy
from sensor_msgs.msg import JointState
from bhand_controller.srv import Actions
from bhand_controller.msg import TactileArray


def grasp_node():
    rospy.init_node('grasp_node')
    pub = rospy.Publisher('/bhand_node/command', JointState, queue_size=100)
    rate = rospy.Rate(10)  # Adjust the rate as needed

    rospy.wait_for_service('bhand_node/actions')
    actions_service = rospy.ServiceProxy('bhand_node/actions', Actions)

    # Initialize
    rospy.loginfo("Initializing")
    actions_service(1)
    rospy.sleep(1.0)
    
    g = 0

   
    while not rospy.is_shutdown():
        
        js = [0.0, 0.0, 0.0, 0.0, 0.0]
        joint_state = JointState()
        joint_state.name = ['bh_j21_joint', 'bh_j11_joint', 'bh_j32_joint', 'bh_j12_joint', 'bh_j22_joint']
        joint_state.position = js
        joint_state.velocity = [-0.1] * len(joint_state.name)
        pub.publish(joint_state)
        
        

        while g == 0:
            # Open
            rospy.loginfo("Opening")
            actions_service(3)
            rate.sleep()
            g = int(input('Press 1 to grab: '))

        while g == 1:
            
            js = [0.45, 0.45, 0,0,0]
            joint_state.position = js
            pub.publish(joint_state)
            rospy.sleep(0.5)

            js = [0.45, 0.45, 1.33, 1.33, 1.33]
            pub.publish(joint_state)
            joint_state.position = js
            rospy.sleep(0.3)
            # Publish the updated joint states
            pub.publish(joint_state)
            rospy.sleep(0.25)

            
            g = int(input('Press 0 to release: '))



if __name__ == '__main__':
    try:
        grasp_node()
    except rospy.ROSInterruptException:
        pass