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

# 3.3.1 Ensure IPv6 router advertisements are not accepted (Scored)
check3_3_1a=`sysctl net.ipv6.conf.all.accept_ra`
check3_3_1b=`sysctl net.ipv6.conf.default.accept_ra`
if [ "$check3_3_1a" == "net.ipv6.conf.all.accept_ra = 0" ] && [ "$check3_3_1b" == "net.ipv6.conf.default.accept_ra = 0" ]
then
    result3_3_1="OK"
else
	result3_3_1="ERR, Fix Manually"
fi
export result3_3_1

# 3.3.2 Ensure IPv6 redirects are not accepted (Scored)
check3_3_2a=`sysctl net.ipv6.conf.all.accept_redirects`
check3_3_2b=`sysctl net.ipv6.conf.default.accept_redirects`
if [ "$check3_3_2a" == "net.ipv6.conf.all.accept_redirect = 0" ] && [ "$check3_3_2b" == "net.ipv6.conf.default.accept_redirect = 0" ]
then
    result3_3_2="OK"
else
	result3_3_2="ERR, Fix Manually"
fi
export result3_3_2

# 3.3.3 Ensure IPv6 is disabled (Not Scored)
check3_3_3=`modprobe -c | grep ipv6 | grep disable=1 | grep "#"`
if [ "$check3_3_3" != "" ] 
then
    result3_3_3="OK"
else
	result3_3_3="ERR, Fix Manually"
fi
export result3_3_3

# 3.4.1 Ensure TCP Wrappers is installed (Scored)
check3_4_1a=`rpm -q tcp_wrappers | grep package`
check3_4_1b=`rpm -q tcp_wrappers-libs | grep package `
if [ "$check3_4_1a" == "" ] && [ "$check3_4_1b" == "" ] 
then
    result3_4_1="OK"
else
	result3_4_1="ERR, Fix Manually"
fi
export result3_4_1

# 3.4.2 Ensure /etc/hosts.allow is configured (Scored)
check3_4_2=`cat /etc/hosts.allow | grep "ALL:" | "#"`
if [ "$check3_4_2" != "" ] 
then
    result3_4_2="OK"
else
	result3_4_2="ERR, Fix Manually"
fi
export result3_4_2

# 3.4.3 Ensure /etc/hosts.deny is configured (Scored)
check3_4_3=`cat /etc/hosts.deny | grep "ALL: ALL" | "#"`
if [ "$check3_4_3" != "" ] 
then
    result3_4_3="OK"
else
	result3_4_3="ERR, Fix Manually"
fi
export result3_4_3

# 3.4.4 Ensure permissions on /etc/hosts.allow are configured (Scored)
check3_4_4=`stat /etc/hosts.allow | grep 644 | grep root`
if [ "$check3_4_4" != "" ] 
then
    result3_4_4="OK"
else
	result3_4_4="ERR, Fix Manually"
fi
export result3_4_4

# 3.4.5 Ensure permissions on /etc/hosts.deny are 644 (Scored)
check3_4_5=`stat /etc/hosts.deny | grep 644 | grep root`
if [ "$check3_4_5" != "" ] 
then
    result3_4_5="OK"
else
	result3_4_5="ERR, Fix Manually"
fi
export result3_4_5

# 3.5.1 Ensure DCCP is disabled (Not Scored)
check3_5_1a=`modprobe -n -v dccp | grep install`
check3_5_1b=`lsmod | grep dccp`
if [ "$check3_5_1a" != "" ] && [ "$check3_5_1b" == "" ] 
then
    result3_5_1="OK"
else
	result3_5_1="ERR, Fix Manually"
fi
export result3_5_1

# 3.5.2 Ensure SCTP is disabled (Not Scored)
check3_5_2a=`modprobe -n -v sctp | grep install`
check3_5_2b=`lsmod | grep sctp`
if [ "$check3_5_2a" != "" ] && [ "$check3_5_2b" == "" ] 
then
    result3_5_2="OK"
else
	result3_5_2="ERR, Fix Manually"
fi
export result3_5_2

# 3.5.3 Ensure RDS is disabled (Not Scored)
check3_5_3a=`modprobe -n -v rds | grep install`
check3_5_3b=`lsmod | grep rds`
if [ "$check3_5_3a" != "" ] && [ "$check3_5_3b" == "" ] 
then
    result3_5_3="OK"
else
	result3_5_3="ERR, Fix Manually"
fi
export result3_5_3

# 3.5.4 Ensure TIPC is disabled (Not Scored)
check3_5_4a=`modprobe -n -v tipc | grep install`
check3_5_4b=`lsmod | grep tipc`
if [ "$check3_5_4a" != "" ] && [ "$check3_5_4b" == "" ] 
then
    result3_5_4="OK"
else
	result3_5_4="ERR, Fix Manually"
fi
export result3_5_4

# 3.7 Ensure wireless interfaces are disabled (Not Scored)
check3_7=`iw dev`
if [ "$check3_7" == "-bash: iw: command not found"  
then
    result3_7="OK"
else
	result3_7="ERR, Fix Manually"
fi
export result3_7

bash 3_output.sh