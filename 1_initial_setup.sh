#/bin/bash

# 1.1.2 Ensure separate partition exists for /tmp (Scored)
check1_1_2=`mount | grep /tmp`
if [ "$check1_1_2" == "" ]
then
	result1_1_2="ERR, Fix Manually"
else
	result1_1_2="OK"
fi
export result1_1_2

# 1.1.5 Ensure noexec option set on /tmp partition (Scored)
check1_1_5=`mount | grep /tmp | grep noexec`
if [ "$check1_1_5" == "" ]
then
    result1_1_5="ERR, Fix Manually"
else
    result1_1_5="-- OK"
fi
export result1_1_5

# 1.1.11 Ensure separate partition exists for /var/log (Scored)
check1_1_11=`mount | grep /var/log`
if [ "$check1_1_11" == "" ] 
then
	result1_1_11="ERR, Fix Manually"
else
	result1_1_11="OK"
fi
export result1_1_11

# 1.1.12 Ensure separate partition exists for /var/log/audit (Scored)
check1_1_12=`mount | grep /var/log/audit`
if [ "$check1_1_12" == "" ]
then
	result1_1_12="ERR, Fix Manually"
else
	result1_1_12="OK"
fi
export result1_1_12

# 1.1.13 Ensure separate partition exists for /home (Scored)
check1_1_13=`mount | grep /home`
if [ "$check1_1_13" == "" ]
then
	result1_1_13="ERR, Fix Manually"
else
	result1_1_13="OK"
fi
export result1_1_13

# 1.1.14 Ensure nodev option set on /home partition (Scored)
check1_1_14=`mount | grep /home | grep nodev`
if [ "$check1_1_14" == "" ]
then
	result1_1_14="ERR, Fix Manually"
else
	result1_1_14="OK"
fi
export result1_1_14

# 1.2.3 Ensure gpgcheck is globally activated (Scored)
check1_2_3=`grep gpgcheck /etc/yum.conf`
if [ $check1_2_3 == "gpgcheck=1" ]
then
	result1_2_3="OK"
else
	sed -i "s/gpgcheck=0/gpgcheck=1/g" /etc/yum.conf
	result1_2_3="ERR, Fix Automatically"
fi
export result1_2_3

# 1.3.1 Ensure AIDE is installed (Scored)
check1_3_1=`rpm -q aide`
if [ "$check1_3_1" == "package aide is not installed" ]
then 
	yum -y install aide
	result1_3_1="ERR, Fix Automatically"
else
	result1_3_1="OK"
fi
export result1_3_1

# 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
check1_3_2=`crontab -u root -l | grep aide`
if [ "$check1_3_2" == "0 5 * * * /usr/sbin/aide --check" ]
then
	result1_3_2="OK"
else
    echo "0 5 * * * /usr/sbin/aide --check" | sudo tee -a /var/spool/cron/root
	result1_3_2="ERR, Fix Automatically"
fi
export result1_3_2

# 1.4.1 Ensure permissions on bootloader config are configured (Scored)
check1_4_1=`stat /boot/grub2/grub.cfg | grep root | grep root | grep 600`

if [ "$check1_4_1" == "" ]
then
	chown root:root /boot/grub2/grub.cfg
	chmod og-rwx /boot/grub2/grub.cfg
    result1_4_1="ERR, Fix Automatically"
else
    result1_4_1="OK"
fi
export result1_4_1

# 1.5.1 Ensure core dumps are restricted (Scored)
check1_5_1=`grep "hard core" /etc/security/limits.conf /etc/security/limits.d/*`

if [ "$check1_5_1" == "" ]
then
    echo "* hard core 0" >> /etc/security/limits.conf
    result1_5_1="ERR, Fix Automatically"
else
    result1_5_1="OK"
fi
export result1_5_1

# 1.5.3 Ensure address space layout randomization (ASLR) is enabled (Scored)
check1_5_3=`/sbin/sysctl kernel.randomize_va_space`
if [ "$check1_5_3" == "" ]
then
    echo "kernel.randomize_va_space = 2" >> /etc/sysctl.conf
	sysctl -w kernel.randomize_va_space=2
    result1_5_3="ERR, Fix Automatically"
else
    result1_5_3="OK"
fi
export result1_5_3

# 1.6.1.1 Ensure SELinux is not disabled in bootloader configuration (Scored)
check1_6_1_1a=`grep selinux=0 /boot/grub2/grub.cfg`
check1_6_1_1b=`grep enforcing=0 /boot/grub2/grub.cfg`
if [ "$check1_6_1_1a" == "" ] && [ "$check1_6_1_1b" == "" ]
then
    result1_6_1_1="OK"
else
    sed -i '/selinux=0/d' /boot/grub2/grub.cfg
	sed -i '/enforcing=0/d' /boot/grub2/grub.cfg
	result1_6_1_1="ERR, Fix Automatically"
fi 
export result1_6_1_1

# 1.6.1.2 Ensure the SELinux state is enforcing (Scored)
check1_6_1_2=`grep SELINUX=enforcing /etc/selinux/config`

if [ "$check1_6_1_2" == "SELINUX=enforcing" ]
then
    result1_6_1_2="OK"
else
    sed -i 's/SELINUX=permissive/SELINUX=enforcing/g' /etc/selinux/config
    sed -i 's/SELINUX=disabled/SELINUX=enforcing/g' /etc/selinux/config
	result1_6_1_2="ERR, Fix Automatically"
fi
export result1_6_1_2

# 1.6.1.4 Ensure SETroubleshoot is not installed (Scored)
check1_6_1_4=`rpm -q setroubleshoot`
if [ "$check1_6_1_4" == "package setroubleshoot is not installed" ]
then
    result1_6_1_4="OK"
else
    yum remove setroubleshoot -y
	result1_6_1_4="ERR, Fix Automatically"
fi
export result1_6_1_4

# 1.6.1.5 Ensure the MCS Translation Service (mcstrans) is not installed (Scored)
check1_6_1_5=`rpm -q mcstrans`

if [ "$check1_6_1_5" == "package mcstrans is not installed" ]
then
    result1_6_1_5="OK"
else
	yum remove -y mcstrans
	result1_6_1_5="ERR, Fix Automatically"
fi
export result1_6_1_5

# 1.6.1.6 Ensure no unconfined daemons exist (Scored)
check1_6_1_6=`ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk" | tr ':' ' ' | awk '{print $NF }'`

if [ "$check1_6_1_6" == "" ]
then
    result1_6_1_6="OK"
else
	result1_6_1_6="ERR, Fix Manually"
fi
export result1_6_1_6

bash 1_output.sh