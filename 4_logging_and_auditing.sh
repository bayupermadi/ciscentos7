#!/bin/bash

# 4.1.1.1 Ensure audit log storage size is configured (Not Scored)
check4_1_1_1a=`cat /etc/audit/auditd.conf | grep "max_log_file = " | awk '{print $3}'`
check4_1_1_1b='^[0-9]+$'
if [ "$check4_1_1_1a" -gt 0  ]
then
    result4_1_1_1="OK"
else
	result4_1_1_1="ERR, Fix Manually"
fi
export result4_1_1_1

# 4.1.1.2 Ensure system is disabled when audit logs are full (Scored)
check4_1_1_2a=`cat /etc/audit/auditd.conf | grep "space_left_action = email"`
check4_1_1_2b='cat /etc/audit/auditd.conf | grep "action_mail_acct = root"'
check4_1_1_2c='cat /etc/audit/auditd.conf | grep "admin_space_left_action = halt "'
if [ "$check4_1_1_2a" != ""  ] && [ "$check4_1_1_2b" != ""  ] && [ "$check4_1_1_2c" != ""  ]
then
    result4_1_1_2="OK"
else
	result4_1_1_2="ERR, Fix Manually"
fi
export result4_1_1_2

# 4.1.1.3 Ensure audit logs are not automatically deleted (Scored)
check4_1_1_3=`grep max_log_file_action /etc/audit/auditd.conf | grep keep_logs`
if [ "$check4_1_1_3" != ""  ] 
then
    result4_1_1_3="OK"
else
	result4_1_1_3="ERR, Fix Manually"
fi
export result4_1_1_3

# 4.1.2 Ensure auditd service is enabled (Scored)
check4_1_2=`systemctl is-enabled auditd | grep enabled`
if [ "$check4_1_2" != ""  ] 
then
    result4_1_2="OK"
else
	result4_1_2="ERR, Fix Manually"
fi
export result4_1_2

# 4.1.3 Ensure auditing for processes that start prior to auditd is enabled (Scored)
check4_1_3=`grep "^\s*linux" /boot/grub2/grub.cfg | grep "audit=1"`
if [ "$check4_1_3" != ""  ] 
then
    result4_1_3="OK"
else
	result4_1_3="ERR, Fix Manually"
fi
export result4_1_3

# 4.1.4 Ensure events that modify date and time information are collected (Scored)
check4_1_4=`grep time-change /etc/audit/audit.rules | grep -E 'arch=b64|arch=b32|localtime' | wc -l`
if [ "$check4_1_4" == "5"  ] 
then
    result4_1_4="OK"
else
	result4_1_4="ERR, Fix Manually"
fi
export result4_1_4

# 4.1.5 Ensure events that modify user/group information are collected (Scored)
check4_1_5=`grep identity /etc/audit/audit.rules | grep -E 'group|passwd|gshadow|shadow|security' | wc -l`
if [ "$check4_1_5" == "5"  ] 
then
    result4_1_5="OK"
else
	result4_1_5="ERR, Fix Manually"
fi
export result4_1_5

# 4.1.6 Ensure events that modify the system's network environment are collected (Scored)
check4_1_6=`grep system-locale /etc/audit/audit.rules | grep -E 'issue -p|issue.net|hosts|network|arch' | wc -l`
if [ "$check4_1_6" == "6"  ] 
then
    result4_1_6="OK"
else
	result4_1_6="ERR, Fix Manually"
fi
export result4_1_6

# 4.1.7 Ensure events that modify the system's Mandatory Access Controls are collected (Scored)
check4_1_7=`grep MAC-policy /etc/audit/audit.rules | grep selinux`
if [ "$check4_1_7" != ""  ] 
then
    result4_1_7="OK"
else
	result4_1_7="ERR, Fix Manually"
fi
export result4_1_7

# 4.1.8 Ensure login and logout events are collected (Scored)
check4_1_8=`grep logins /etc/audit/audit.rules | grep var`
if [ "$check4_1_8" != ""  ] 
then
    result4_1_8="OK"
else
	result4_1_8="ERR, Fix Manually"
fi
export result4_1_8

# 4.1.9 Ensure session initiation information is collected (Scored)
check4_1_9=`grep session /etc/audit/audit.rules | grep var`
if [ "$check4_1_9" != ""  ] 
then
    result4_1_9="OK"
else
	result4_1_9="ERR, Fix Manually"
fi
export result4_1_9

# 4.1.10 Ensure discretionary access control permission modification events are collected (Scored)
check4_1_10=`grep perm_mod /etc/audit/audit.rules | grep 'arch|-k perm_mod' | wc -l`
if [ "$check4_1_10" == "8"  ] 
then
    result4_1_10="OK"
else
	result4_1_10="ERR, Fix Manually"
fi
export result4_1_10

# 4.1.11 Ensure unsuccessful unauthorized file access attempts are collected (Scored)
check4_1_11=`grep access /etc/audit/audit.rules | grep 'arch'`
if [ "$check4_1_11" == "4"  ] 
then
    result4_1_11="OK"
else
	result4_1_11="ERR, Fix Manually"
fi
export result4_1_11

# 4.1.12 Ensure use of privileged commands is collected (Scored)
##check4_1_12a=`for i in `df -h | awk '{ print $6 }' | grep -v Mounted`; do find $i -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" }'; done;`
##check4_1_12b=`cat /etc/audit/audit.rules`

##if [ "$check4_1_12" = ""  ] 
##then
##    result4_1_11="OK"
##else
##	result4_1_11="ERR, Fix Manually"
##fi
##export result4_1_11

# 4.1.11 Ensure unsuccessful unauthorized file access attempts are collected (Scored)
check4_1_11=`grep access /etc/audit/audit.rules | grep 'arch'`
if [ "$check4_1_11" == "4"  ] 
then
    result4_1_11="OK"
else
	result4_1_11="ERR, Fix Manually"
fi
export result4_1_11

bash 4_output.sh