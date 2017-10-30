#!/bin/bash

# 4.1.1.1 Ensure audit log storage size is configured (Not Scored)
check4_1_1_1a=`cat /etc/audit/auditd.conf | grep "max_log_file = " | awk '{print $3}'`
check4_1_1_1b='^[0-9]+$'
if [ "$check4_1_1_1a" ~= "$check4_1_1_1b"  ]
then
    result4_1_1_1="OK"
else
	result4_1_1_1="ERR, Fix Manually"
fi
export result4_1_1_1

# 4.1.1.2 Ensure system is disabled when audit logs are full (Scored)
check4_1_1_2a=`grep space_left_action /etc/audit/auditd.conf`
check4_1_1_2b='grep action_mail_acct /etc/audit/auditd.conf'
check4_1_1_2c='grep admin_space_left_action /etc/audit/auditd.conf'
if [ "$check4_1_1_2a" == "space_left_action = email"  ] && [ "$check4_1_1_2b" == "action_mail_acct = root"  ] && [ "$check4_1_1_2c" == "admin_space_left_action = halt"  ]
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

bash 4_output.sh