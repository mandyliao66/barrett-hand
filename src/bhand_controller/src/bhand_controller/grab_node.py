#!/usr/bin/env python

import rospy
from sensor_msgs.msg import JointState
from bhand_controller.srv import Actions
from bhand_controller.msg import TactileArray

def read_tactile_sensor_data():
    #sub to tactile array topic
    topic = '/bhand_node/tact_array'
    msg = rospy.wait_for_message(topic, TactileArray)

    finger1_data = msg.finger1
    finger2_data = msg.finger2
    finger3_data = msg.finger3
    #palm_data = msg.palm    
    return [finger1_data, finger2_data, finger3_data]

def is_force_reached():
    # Read tactile sensor array information
    tactile_data = read_tactile_sensor_data()
    threshold = 16.0
    for sensor_data in tactile_data:
        for x in sensor_data:
            if x >= threshold:
                return True
    return False

def grab_node():
    rospy.init_node('grab_node')
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
        joint_state.velocity = [0.0] * len(joint_state.name)
        pub.publish(joint_state)
        
        angle = float(input("Enter your desired angle: "))
        js = [angle, angle, 0.0, 0.0, 0.0]
        pub.publish(joint_state)

        while g == 0:
            # Open
            rospy.loginfo("Opening")
            actions_service(3)
            rate.sleep()
            g = int(input('Press 1 to grab: '))

        while g == 1:
            

            # Check if the force reading exceeds a certain threshold
            while not is_force_reached():
                # Increase the joint state of each finger
                js[2] += 0.2
                js[3] += 0.2
                js[4] += 0.2

                rospy.loginfo(js)

                rospy.sleep(0.3)
                # Publish the updated joint states
                joint_state.position = js
                pub.publish(joint_state)

                rospy.sleep(0.25)

            # Force threshold reached, stop tightening
            rospy.loginfo('Force threshold reached')
            g = int(input('Press 0 to release: '))



if __name__ == '__main__':
    try:
        grab_node()
    except rospy.ROSInterruptException:
        pass