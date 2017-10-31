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

# 4.1.13 Ensure successful file system mounts are collected (Scored)
check4_1_13=`grep mounts /etc/audit/audit.rules | grep 'arch'`
if [ "$check4_1_13" == "2"  ] 
then
    result4_1_13="OK"
else
	result4_1_13="ERR, Fix Manually"
fi
export result4_1_13

# 4.1.14 Ensure file deletion events by users are collected (Scored)
check4_1_14=`grep delete /etc/audit/audit.rules | grep 'arch'`
if [ "$check4_1_14" == "2"  ] 
then
    result4_1_14="OK"
else
	result4_1_14="ERR, Fix Manually"
fi
export result4_1_14

# 4.1.15 Ensure changes to system administration scope (sudoers) is collected (Scored)
check4_1_15=`grep scope /etc/audit/audit.rules | grep 'sudoers'`
if [ "$check4_1_15" == "2"  ] 
then
    result4_1_15="OK"
else
	result4_1_15="ERR, Fix Manually"
fi
export result4_1_15

# 4.1.16 Ensure system administrator actions (sudolog) are collected (Scored)
check4_1_16=`grep actions /etc/audit/audit.rules `
if [ "$check4_1_16" != ""  ] 
then
    result4_1_16="OK"
else
	result4_1_16="ERR, Fix Manually"
fi
export result4_1_16

# 4.1.17 Ensure kernel module loading and unloading is collected (Scored)
check4_1_17=`grep modules /etc/audit/audit.rules | grep -E 'insmod|rmmod|modprobe|arch=b64' | wc -l `
if [ "$check4_1_17" == "4"  ] 
then
    result4_1_17="OK"
else
	result4_1_17="ERR, Fix Manually"
fi
export result4_1_17

# 4.1.18 Ensure the audit configuration is immutable (Scored)
check4_1_18=`grep "^\s*[^#]" /etc/audit/audit.rules | tail -1`
if [ "$check4_1_18" == "-e 2"  ] 
then
    result4_1_18="OK"
else
	result4_1_18="ERR, Fix Manually"
fi
export result4_1_18

# 4.2.1.1 Ensure rsyslog Service is enabled (Scored)
check4_2_1_1=`systemctl is-enabled rsyslog | grep enabled`
if [ "$check4_2_1_1" != ""  ] 
then
    result4_2_1_1="OK"
else
	result4_2_1_1="ERR, Fix Manually"
fi
export result4_2_1_1

# 4.2.1.2 Ensure logging is configured (Not Scored)
#check4_2_1_1=`systemctl is-enabled rsyslog | grep enabled`
#if [ "$check4_2_1_1" != ""  ] 
#then
#    result4_2_1_1="OK"
#else
#	result4_2_1_1="ERR, Fix Manually"
#fi
#export result4_2_1_1

# 4.2.1.3 Ensure rsyslog default file permissions configured (Scored)
check4_2_1_3=`grep ^\$FileCreateMode /etc/rsyslog.conf | grep 0640`
if [ "$check4_2_1_3" != ""  ] 
then
    result4_2_1_3="OK"
else
	result4_2_1_3="ERR, Fix Manually"
fi
export result4_2_1_3

# 4.2.1.4 Ensure rsyslog is configured to send logs to a remote log host (Scored)
check4_2_1_4=`grep "^*.*[^I][^I]*@" /etc/rsyslog.conf`
if [ "$check4_2_1_4" != ""  ] 
then
    result4_2_1_4="OK"
else
	result4_2_1_4="ERR, Fix Manually"
fi
export result4_2_1_4

# 4.2.1.5 Ensure remote rsyslog messages are only accepted on designated log hosts. (Not Scored)
check4_2_1_5=`cat /etc/rsyslog.conf | grep '$ModLoad imtcp.so|$InputTCPServerRun 514'`
if [ "$check4_2_1_5" != ""  ] 
then
    result4_2_1_5="OK"
else
	result4_2_1_5="ERR, Fix Manually"
fi
export result4_2_1_5

# 4.2.2.1 Ensure syslog-ng service is enabled (Scored)
check4_2_2_1=`systemctl is-enabled syslog-ng | grep 'enabled'`
if [ "$check4_2_2_1" != ""  ] 
then
    result4_2_2_1="OK"
else
	result4_2_2_1="ERR, Fix Manually"
fi
export result4_2_2_1

# 4.2.2.2 Ensure logging is configured (Not Scored)
#check4_2_2_1=`systemctl is-enabled syslog-ng | grep 'enabled'`
#if [ "$check4_2_2_1" != ""  ] 
#then
#    result4_2_2_1="OK"
#else
#	result4_2_2_1="ERR, Fix Manually"
#fi
#export result4_2_2_1

# 4.2.2.3 Ensure syslog-ng default file permissions configured (Scored)
check4_2_2_3=`grep ^options /etc/syslog-ng/syslog-ng.conf | grep -E 'perm|0640'`
if [ "$check4_2_2_3" != ""  ] 
then
    result4_2_2_3="OK"
else
	result4_2_2_3="ERR, Fix Manually"
fi
export result4_2_2_3

# 4.2.2.4 Ensure syslog-ng is configured to send logs to a remote log host (Not Scored)
check4_2_2_4=`cat /etc/syslog-ng/syslog-ng.conf | grep -E 'port(514)|source(src)'`
if [ "$check4_2_2_4" != ""  ] 
then
    result4_2_2_4="OK"
else
	result4_2_2_4="ERR, Fix Manually"
fi
export result4_2_2_4

## 4.2.2.5 Ensure remote syslog-ng messages are only accepted on designated log hosts (Not Scored)
#check4_2_2_5=`cat /etc/syslog-ng/syslog-ng.conf | grep -E 'port(514)|source(src)'`
#if [ "$check4_2_2_4" != ""  ] 
#then
#    result4_2_2_4="OK"
#else
#	result4_2_2_4="ERR, Fix Manually"
#fi
#export result4_2_2_4

# 4.2.3 Ensure rsyslog or syslog-ng is installed (Scored)
check4_2_3a=`rpm -q rsyslog | grep package`
check4_2_3b=`rpm -q syslog-ng | grep package`
if [ "$check4_2_3a" != ""  ] || [ "$check4_2_3b" != ""  ]
then
    result4_2_3="OK"
else
	result4_2_3="ERR, Fix Manually"
fi
export result4_2_3

# 4.2.4 Ensure permissions on all logfiles are configured (Scored)
check4_2_4=`sudo find /var/log -type f -printf '%m %p\n' | awk '{print $1}' | grep 7`
if [ "$check4_2_4" != ""  ]
then
    result4_2_4="OK"
else
	result4_2_4="ERR, Fix Manually"
fi
export result4_2_4

# 4.3 Ensure logrotate is configured (Not Scored)
check4_3=`sudo find /var/log -type f -printf '%m %p\n' | awk '{print $1}' | grep 7`
if [ "$check4_2_4" == ""  ]
then
    result4_2_4="OK"
else
	result4_2_4="ERR, Fix Manually"
fi
export result4_2_4

bash 4_output.sh