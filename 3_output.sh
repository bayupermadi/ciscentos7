#!/bin/bash

echo "3.1.1 Ensure IP forwarding is disabled (Scored), $result3_1_1"
echo "3.1.2 Ensure packet redirect sending is disabled (Scored), $result3_1_2"
echo "3.2.1 Ensure source routed packets are not accepted (Scored), $result3_2_1"
echo "3.2.2 Ensure ICMP redirects are not accepted (Scored), $result3_2_2"
echo "3.2.3 Ensure secure ICMP redirects are not accepted (Scored), $result3_2_3"
echo "3.2.4 Ensure suspicious packets are logged (Scored), $result3_2_4"
echo "3.2.5 Ensure broadcast ICMP requests are ignored (Scored), $result3_2_5"
echo "3.2.6 Ensure bogus ICMP responses are ignored (Scored), $result3_2_6"
echo "3.2.7 Ensure Reverse Path Filtering is enabled (Scored), $result3_2_7"
echo "3.2.8 Ensure TCP SYN Cookies is enabled (Scored), $result3_2_8"
echo "3.3.1 Ensure IPv6 router advertisements are not accepted (Scored), $result3_3_1"
echo "3.3.2 Ensure IPv6 redirects are not accepted (Scored), $result3_3_2"
echo "3.3.3 Ensure IPv6 is disabled (Not Scored), $result3_3_3"
echo "3.4.1 Ensure TCP Wrappers is installed (Scored), $result3_4_1"
echo "3.4.2 Ensure /etc/hosts.allow is configured (Scored), $result3_4_2"
echo "3.4.3 Ensure /etc/hosts.deny is configured (Scored), $result3_4_3"
echo "3.4.4 Ensure permissions on /etc/hosts.allow are configured (Scored), $result3_4_4"
echo "3.4.5 Ensure permissions on /etc/hosts.deny are 644 (Scored), $result3_4_5"
echo "3.5.1 Ensure DCCP is disabled (Not Scored), $result3_5_1"
echo "3.5.2 Ensure SCTP is disabled (Not Scored), $result3_5_2"
echo "3.5.3 Ensure RDS is disabled (Not Scored), $result3_5_3"
echo "3.5.4 Ensure TIPC is disabled (Not Scored), $result3_5_4"
echo "3.7 Ensure wireless interfaces are disabled (Not Scored), $result3_7"