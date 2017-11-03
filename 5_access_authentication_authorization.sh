#!/bin/bash

# 5.1.1 Ensure cron daemon is enabled (Scored)
check5_1_1=`systemctl is-enabled crond | grep enabled`
if [ "$check5_1_1" != ""  ]
then
    result5_1_1="OK"
else
	result5_1_1="ERR, Fix Manually"
fi
export result5_1_1

# 5.1.2 Ensure permissions on /etc/crontab are configured (Scored)
check5_1_2=`stat /etc/crontab | grep root | grep 600`
if [ "$check5_1_2" != ""  ]
then
    result5_1_2="OK"
else
	result5_1_2="ERR, Fix Manually"
fi
export result5_1_2

# 5.1.3 Ensure permissions on /etc/cron.hourly are configured (Scored)
check5_1_3=`stat /etc/cron.hourly | grep root | grep 600`
if [ "$check5_1_3" != ""  ]
then
    result5_1_3="OK"
else
	result5_1_3="ERR, Fix Manually"
fi
export result5_1_3

# 5.1.4 Ensure permissions on /etc/cron.daily are configured (Scored)
check5_1_4=`stat /etc/cron.daily | grep root | grep 600`
if [ "$check5_1_4" != ""  ]
then
    result5_1_4="OK"
else
	result5_1_4="ERR, Fix Manually"
fi
export result5_1_4

# 5.1.5 Ensure permissions on /etc/cron.weekly are configured (Scored)
check5_1_5=`stat /etc/cron.weekly | grep root | grep 600`
if [ "$check5_1_5" != ""  ]
then
    result5_1_5="OK"
else
	result5_1_5="ERR, Fix Manually"
fi
export result5_1_5

# 5.1.6 Ensure permissions on /etc/cron.monthly are configured (Scored)
check5_1_6=`stat /etc/cron.monthly | grep root | grep 600`
if [ "$check5_1_6" != ""  ]
then
    result5_1_6="OK"
else
	result5_1_6="ERR, Fix Manually"
fi
export result5_1_6

# 5.1.7 Ensure permissions on /etc/cron.d are configured (Scored)
check5_1_7=`stat /etc/cron.d | grep root | grep 600`
if [ "$check5_1_7" != ""  ]
then
    result5_1_7="OK"
else
	result5_1_7="ERR, Fix Manually"
fi
export result5_1_7

# 5.1.8 Ensure at/cron is restricted to authorized users (Scored)
check5_1_8a=`stat /etc/cron.allow | grep root | grep 600`
check5_1_8b=`stat /etc/at.allow | grep root | grep 600`
if [ "$check5_1_8a" != ""  ] && [ "$check5_1_8b" != ""  ]  && [ -f "/etc/cron.deny"  ] && [ -f /etc/at.deny  ]
then
    result5_1_8="OK"
else
	result5_1_8="ERR, Fix Manually"
fi
export result5_1_8

# 5.1.8 Ensure at/cron is restricted to authorized users (Scored)
check5_1_8a=`stat /etc/cron.allow | grep root | grep 600`
check5_1_8b=`stat /etc/at.allow | grep root | grep 600`
if [ "$check5_1_8a" != ""  ] && [ "$check5_1_8b" != ""  ]  && [ -f "/etc/cron.deny"  ] && [ -f "/etc/at.deny"  ]
then
    result5_1_8="OK"
else
	result5_1_8="ERR, Fix Manually"
fi
export result5_1_8

# 5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured (Scored)
check5_2_1=`stat /etc/ssh/sshd_config | grep root | grep 600`
if [ "$check5_2_1" != ""  ]
then
    result5_2_1="OK"
else
	result5_2_1="ERR, Fix Manually"
fi
export result5_2_1

# 5.2.2 Ensure SSH Protocol is set to 2 (Scored)
check5_2_2=`grep "^Protocol" /etc/ssh/sshd_config | grep "Protocol 2"`
if [ "$check5_2_2" != ""  ]
then
    result5_2_2="OK"
else
	result5_2_2="ERR, Fix Manually"
fi
export result5_2_2

# 5.2.3 Ensure SSH LogLevel is set to INFO (Scored)
check5_2_3=`grep "^LogLevel" /etc/ssh/sshd_config | grep "LogLevel INFO"`
if [ "$check5_2_3" != ""  ]
then
    result5_2_3="OK"
else
	result5_2_3="ERR, Fix Manually"
fi
export result5_2_3

# 5.2.4 Ensure SSH X11 forwarding is disabled (Scored)
check5_2_4=`grep "^X11Forwarding" /etc/ssh/sshd_config | grep "X11Forwarding no"`
if [ "$check5_2_4" != ""  ]
then
    result5_2_4="OK"
else
	result5_2_4="ERR, Fix Manually"
fi
export result5_2_4

# 5.2.5 Ensure SSH MaxAuthTries is set to 4 or less (Scored)
check5_2_5=`grep "^MaxAuthTries" /etc/ssh/sshd_config | grep "MaxAuthTries 4"`
if [ "$check5_2_5" != ""  ]
then
    result5_2_5="OK"
else
	result5_2_5="ERR, Fix Manually"
fi
export result5_2_5

# 5.2.6 Ensure SSH IgnoreRhosts is enabled (Scored)
check5_2_6=`grep "^IgnoreRhosts" /etc/ssh/sshd_config | grep "IgnoreRhosts yes"`
if [ "$check5_2_6" != ""  ]
then
    result5_2_6="OK"
else
	result5_2_6="ERR, Fix Manually"
fi
export result5_2_6

# 5.2.7 Ensure SSH HostbasedAuthentication is disabled (Scored)
check5_2_7=`grep "^HostbasedAuthentication" /etc/ssh/sshd_config | grep "HostbasedAuthentication no"`
if [ "$check5_2_7" != ""  ]
then
    result5_2_7="OK"
else
	result5_2_7="ERR, Fix Manually"
fi
export result5_2_7

# 5.2.8 Ensure SSH root login is disabled (Scored)
check5_2_8=`grep "^PermitRootLogin" /etc/ssh/sshd_config | grep "PermitRootLogin no"`
if [ "$check5_2_8" != ""  ]
then
    result5_2_8="OK"
else
	result5_2_8="ERR, Fix Manually"
fi
export result5_2_8

# 5.2.9 Ensure SSH PermitEmptyPasswords is disabled (Scored)
check5_2_9=`grep "^PermitEmptyPasswords" /etc/ssh/sshd_config | grep "PermitEmptyPasswords no"`
if [ "$check5_2_9" != ""  ]
then
    result5_2_9="OK"
else
	result5_2_9="ERR, Fix Manually"
fi
export result5_2_9

# 5.2.10 Ensure SSH PermitUserEnvironment is disabled (Scored)
check5_2_10=`grep "PermitUserEnvironment" /etc/ssh/sshd_config | grep "PermitUserEnvironment no"`
if [ "$check5_2_10" != ""  ]
then
    result5_2_10="OK"
else
	result5_2_10="ERR, Fix Manually"
fi
export result5_2_10

# 5.2.11 Ensure only approved ciphers are used (Scored)
check5_2_11=`grep "Ciphers" /etc/ssh/sshd_config | grep "Ciphers aes256-ctr,aes192-ctr,aes128-ctr"`
if [ "$check5_2_11" != ""  ]
then
    result5_2_11="OK"
else
	result5_2_11="ERR, Fix Manually"
fi
export result5_2_11

# 5.2.12 Ensure only approved MAC algorithms are used (Scored)
check5_2_12=`grep "MACs" /etc/ssh/sshd_config | grep "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-
etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com"`
if [ "$check5_2_12" != ""  ]
then
    result5_2_12="OK"
else
	result5_2_12="ERR, Fix Manually"
fi
export result5_2_12

# 5.2.13 Ensure SSH Idle Timeout Interval is configured (Scored)
check5_2_13a=`grep "^ClientAliveIntervalMACs" /etc/ssh/sshd_config | grep "ClientAliveInterval 300"`
check5_2_13b=`grep "^ClientAliveCountMax" /etc/ssh/sshd_config | grep "ClientAliveCountMax 0"`
if [ "$check5_2_13a" != ""  ] || [ "$check5_2_13b" != ""  ]
then
    result5_2_13="OK"
else
	result5_2_13="ERR, Fix Manually"
fi
export result5_2_13

# 5.2.14 Ensure SSH LoginGraceTime is set to one minute or less (Scored)
check5_2_14=`grep "^LoginGraceTime" /etc/ssh/sshd_config | grep "LoginGraceTime 60"`
if [ "$check5_2_14" != ""  ]
then
    result5_2_14="OK"
else
	result5_2_14="ERR, Fix Manually"
fi
export result5_2_14

# 5.2.15 Ensure SSH access is limited (Scored)
check5_2_15=`grep "^AllowUsers|^AllowGroups|^DenyUsers|^DenyGroups" "/etc/ssh/sshd_config"`
if [ "$check5_2_15" != ""  ]
then
    result5_2_15="OK"
else
	result5_2_15="ERR, Fix Manually"
fi
export result5_2_15

# 5.2.16 Ensure SSH warning banner is configured (Scored)
check5_2_16=`grep "^Banner" /etc/ssh/sshd_config | grep "Banner /etc/issue.net"`
if [ "$check5_2_16" != ""  ]
then
    result5_2_16="OK"
else
	result5_2_16="ERR, Fix Manually"
fi
export result5_2_16

# 5.3.1 Ensure password creation requirements are configured (Scored)
check5_3_1=`grep "^Banner" /etc/ssh/sshd_config | grep "Banner /etc/issue.net"`
if [ "$check5_2_16" != ""  ]
then
    result5_2_16="OK"
else
	result5_2_16="ERR, Fix Manually"
fi
export result5_2_16

# 5.3.1 Ensure password creation requirements are configured (Scored)
check5_3_1a=`grep pam_pwquality.so /etc/pam.d/password-auth | grep "retry=3"`
check5_3_1b=`grep pam_pwquality.so /etc/pam.d/system-auth | grep "retry=3"`
check5_3_1c=`grep ^minlen /etc/pam.d/pwquality.conf | grep "minlen=14"`
check5_3_1d=`grep ^dcredit /etc/pam.d/pwquality.conf | grep "dcredit=-1"`
check5_3_1e=`grep ^lcredit /etc/pam.d/pwquality.conf | grep "lcredit=-1"`
check5_3_1f=`grep ^ocredit /etc/pam.d/pwquality.conf | grep "ocredit=-1"`
check5_3_1g=`grep ^ucredit /etc/pam.d/pwquality.conf | grep "ucredit=-1"`
if  [ "$check5_3_1a" != ""  ] || 
    [ "$check5_3_1b" != ""  ] || 
    [ "$check5_3_1c" != ""  ] || 
    [ "$check5_3_1d" != ""  ] || 
    [ "$check5_3_1e" != ""  ] || 
    [ "$check5_3_1f" != ""  ] || 
    [ "$check5_3_1g" != ""  ]
then
    result5_3_1="OK"
else
	result5_3_1="ERR, Fix Manually"
fi
export result5_3_1

# 5.3.3 Ensure password reuse is limited (Scored)
check5_3_3a=`grep "password sufficient pam_unix.so" /etc/pam.d/password-auth | grep "remember=5"`
check5_3_3b=`grep "password sufficient pam_unix.so" /etc/pam.d/system-auth | grep "remember=5"`
if  [ "$check5_3_3a" != ""  ] || [ "$check5_3_3b" != ""  ]
then
    result5_3_3="OK"
else
	result5_3_3="ERR, Fix Manually"
fi
export result5_3_3

# 5.3.4 Ensure password hashing algorithm is SHA-512 (Scored)
check5_3_4a=`grep "password sufficient pam_unix.so" /etc/pam.d/password-auth | grep "sha512"`
check5_3_4b=`grep "password sufficient pam_unix.so" /etc/pam.d/system-auth | grep "sha512"`
if  [ "$check5_3_4a" != ""  ] || [ "$check5_3_4b" != ""  ]
then
    result5_3_4="OK"
else
	result5_3_4="ERR, Fix Manually"
fi
export result5_3_4

# 5.4.1.1 Ensure password expiration is 90 days or less (Scored)
check5_4_1_1=`grep PASS_MAX_DAYS /etc/login.defs | grep "PASS_MAX_DAYS 90"`
if  [ "$check5_4_1_1" != ""  ] 
then
    result5_4_1_1="OK"
else
	result5_4_1_1="ERR, Fix Manually"
fi
export result5_4_1_1

# 5.4.1.2 Ensure minimum days between password changes is 7 or more (Scored)
check5_4_1_2=`grep PASS_MIN_DAYS /etc/login.defs | grep "PASS_MIN_DAYS 7"`
if  [ "$check5_4_1_2" != ""  ] 
then
    result5_4_1_2="OK"
else
	result5_4_1_2="ERR, Fix Manually"
fi
export result5_4_1_2

# 5.4.1.3 Ensure password expiration warning days is 7 or more (Scored)
check5_4_1_3=`grep PASS_WARN_AGE /etc/login.defs | grep "PASS_WARN_AGE 7"`
if  [ "$check5_4_1_3" != ""  ] 
then
    result5_4_1_3="OK"
else
	result5_4_1_3="ERR, Fix Manually"
fi
export result5_4_1_3

# 5.4.1.4 Ensure inactive password lock is 30 days or less (Scored)
check5_4_1_4=`useradd -D | grep INACTIVE | grep "INACTIVE=30"`
if  [ "$check5_4_1_4" != ""  ] 
then
    result5_4_1_4="OK"
else
	result5_4_1_4="ERR, Fix Manually"
fi
export result5_4_1_4

# 5.4.2 Ensure system accounts are non-login (Scored)
check5_4_2=`egrep -v "^\+" /etc/passwd | awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $3<1000 && $7!="/sbin/nologin" && $7!="/bin/false") {print}'`
if  [ "$check5_4_2" == ""  ] 
then
    result5_4_2="OK"
else
	result5_4_2="ERR, Fix Manually"
fi
export result5_4_2

# 5.4.3 Ensure default group for the root account is GID 0 (Scored)
check5_4_3=`grep "^root:" /etc/passwd | cut -f4 -d: | grep 0`
if  [ "$check5_4_3" != ""  ] 
then
    result5_4_3="OK"
else
	result5_4_3="ERR, Fix Manually"
fi
export result5_4_3

# 5.4.4 Ensure default user umask is 027 or more restrictive (Scored)
check5_4_4a=`grep "^umask" /etc/bashrc | grep "umask 027"`
check5_4_4b=`grep "^umask" /etc/profile | grep "umask 027"`
if  [ "$check5_4_4b" != ""  ] 
then
    result5_4_4="OK"
else
	result5_4_4="ERR, Fix Manually"
fi
export result5_4_4

bash 5_output.sh