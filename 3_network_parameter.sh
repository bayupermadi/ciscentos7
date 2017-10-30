#!/bin/bash

# 3.1.1 Ensure IP forwarding is disabled (Scored)
check3_1_1=`sysctl net.ipv4.ip_forward`
if [ "$check3_1_1" == "net.ipv4.ip_forward = 0" ] 
then
    result3_1_1="OK"
else
	result3_1_1="ERR, Fix Manually"
fi
export result3_1_1

# 3.1.2 Ensure packet redirect sending is disabled (Scored)
check3_1_2a=`sysctl net.ipv4.conf.all.send_redirects`
check3_1_2b=`sysctl net.ipv4.conf.default.send_redirects`
if [ "$check3_1_2a" == "net.ipv4.conf.all.send_redirects = 0" ] && [ "$check3_1_2b" == "net.ipv4.conf.default.send_redirects = 0" ]
then
    result3_1_2="OK"
else
	result3_1_2="ERR, Fix Manually"
fi
export result3_1_2

# 3.2.1 Ensure source routed packets are not accepted (Scored)
check3_2_1a=`sysctl net.ipv4.conf.all.accept_source_route`
check3_2_1b=`sysctl net.ipv4.conf.default.accept_source_route`
if [ "$check3_2_1a" == "net.ipv4.conf.all.accept_source_route = 0" ] && [ "$check3_2_1b" == "net.ipv4.conf.default.accept_source_route = 0" ]
then
    result3_2_1="OK"
else
	result3_2_1="ERR, Fix Manually"
fi
export result3_2_1

# 3.2.2 Ensure ICMP redirects are not accepted (Scored)
check3_2_2a=`sysctl net.ipv4.conf.all.accept_redirects`
check3_2_2b=`sysctl net.ipv4.conf.default.accept_redirects`
if [ "$check3_2_2a" == "net.ipv4.conf.all.accept_redirects = 0" ] && [ "$check3_2_2b" == "net.ipv4.conf.default.accept_redirects = 0" ]
then
    result3_2_2="OK"
else
	result3_2_2="ERR, Fix Manually"
fi
export result3_2_2

# 3.2.3 Ensure secure ICMP redirects are not accepted (Scored)
check3_2_3a=`sysctl net.ipv4.conf.all.secure_redirects`
check3_2_3b=`sysctl net.ipv4.conf.default.secure_redirects`
if [ "$check3_2_3a" == "net.ipv4.conf.all.secure_redirects = 0" ] && [ "$check3_2_3b" == "net.ipv4.conf.default.secure_redirects = 0" ]
then
    result3_2_3="OK"
else
	result3_2_3="ERR, Fix Manually"
fi
export result3_2_3

# 3.2.4 Ensure suspicious packets are logged (Scored)
check3_2_4a=`sysctl net.ipv4.conf.all.log_martians`
check3_2_4b=`sysctl net.ipv4.conf.default.log_martians`
if [ "$check3_2_4a" == "net.ipv4.conf.all.log_martians = 1" ] && [ "$check3_2_4b" == "net.ipv4.conf.default.log_martians = 1" ]
then
    result3_2_4="OK"
else
	result3_2_4="ERR, Fix Manually"
fi
export result3_2_4

# 3.2.5 Ensure broadcast ICMP requests are ignored (Scored)
check3_2_5=`sysctl net.ipv4.icmp_echo_ignore_broadcasts`
if [ "$check3_2_5" == "net.ipv4.icmp_echo_ignore_broadcasts = 1" ]
then
    result3_2_5="OK"
else
	result3_2_5="ERR, Fix Manually"
fi
export result3_2_5

# 3.2.6 Ensure bogus ICMP responses are ignored (Scored)
check3_2_6=`sysctl net.ipv4.icmp_ignore_bogus_error_responses`
if [ "$check3_2_6" == "net.ipv4.icmp_ignore_bogus_error_responses = 1" ]
then
    result3_2_6="OK"
else
	result3_2_6="ERR, Fix Manually"
fi
export result3_2_6

# 3.2.7 Ensure Reverse Path Filtering is enabled (Scored)
check3_2_7a=`sysctl net.ipv4.conf.all.rp_filter`
check3_2_7b=`sysctl net.ipv4.conf.default.rp_filter`
if [ "$check3_2_7a" == "net.ipv4.conf.all.rp_filter = 1" ] || [ "$check3_2_7b" == "net.ipv4.conf.default.rp_filter = 1" ]
then
    result3_2_7="OK"
else
	result3_2_7="ERR, Fix Manually"
fi
export result3_2_7

# 3.2.8 Ensure TCP SYN Cookies is enabled (Scored)
check3_2_8a=`sysctl net.ipv4.tcp_syncookies`
if [ "$check3_2_8a" == "net.ipv4.tcp_syncookies = 1" ]
then
    result3_2_8="OK"
else
	result3_2_8="ERR, Fix Manually"
fi
export result3_2_8

bash 3_output.sh