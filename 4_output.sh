#!/bin/bash

echo "4.1.1.1 Ensure audit log storage size is configured (Not Scored), $result4_1_1_1"
echo "4.1.1.2 Ensure system is disabled when audit logs are full (Scored), $result4_1_1_2"
echo "4.1.1.3 Ensure audit logs are not automatically deleted (Scored), $result4_1_1_3"
echo "4.1.2 Ensure auditd service is enabled (Scored), $result4_1_2"
echo "4.1.3 Ensure auditing for processes that start prior to auditd is enabled (Scored), $result4_1_3"
echo "4.1.4 Ensure events that modify date and time information are collected (Scored), $result4_1_4"
echo "4.1.5 Ensure events that modify user/group information are collected (Scored), $result4_1_5"
echo "4.1.6 Ensure events that modify the system's network environment are collected (Scored), $result4_1_6"
echo "4.1.7 Ensure events that modify the system's Mandatory Access Controls are collected (Scored), $result4_1_7"
echo "4.1.8 Ensure login and logout events are collected (Scored), $result4_1_8"
echo "4.1.9 Ensure session initiation information is collected (Scored), $result4_1_9"
echo "4.1.10 Ensure discretionary access control permission modification events are collected (Scored), $result4_1_10"