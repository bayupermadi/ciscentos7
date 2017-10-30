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