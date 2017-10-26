#/bin/bash

# 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)
check1_1_1_1a=`modprobe -n -v cramfs | grep "install /bin/true"`
check1_1_1_1b=`lsmod | grep cramfs`
if [ "$check1_1_1_1a" == "install /bin/true" ] && [ "$check1_1_1_1b" == "" ]
then
	result1_1_1_1="OK"
else
	result1_1_1_1="ERR, Fix Manually"
fi
export result1_1_1_1

# 1.1.1.2 Ensure mounting of freevxfs filesystems is disabled (Scored)
check1_1_1_2a=`modprobe -n -v freevxfs | grep "install /bin/true"`
check1_1_1_2b=`lsmod | grep freevxfs`
if [ "$check1_1_1_2a" == "install /bin/true" ] && [ "$check1_1_1_2b" == "" ]
then
	result1_1_1_2="OK"
else
	result1_1_1_2="ERR, Fix Manually"
fi
export result1_1_1_2

# 1.1.1.3 Ensure mounting of jffs2 filesystems is disabled (Scored)
check1_1_1_3a=`modprobe -n -v jffs2 | grep "install /bin/true"`
check1_1_1_3b=`lsmod | grep jffs2`
if [ "$check1_1_1_3a" == "install /bin/true" ] && [ "$check1_1_1_3b" == "" ]
then
	result1_1_1_3="OK"
else
	result1_1_1_3="ERR, Fix Manually"
fi
export result1_1_1_3

# 1.1.1.4 Ensure mounting of hfs filesystems is disabled (Scored)
check1_1_1_4a=`modprobe -n -v hfs | grep "install /bin/true"`
check1_1_1_4b=`lsmod | grep hfs`
if [ "$check1_1_1_4a" == "install /bin/true" ] && [ "$check1_1_1_4b" == "" ]
then
	result1_1_1_4="OK"
else
	result1_1_1_4="ERR, Fix Manually"
fi
export result1_1_1_4

# 1.1.1.5 Ensure mounting of hfsplus filesystems is disabled (Scored)
check1_1_1_5a=`modprobe -n -v hfs | grep "install /bin/true"`
check1_1_1_5b=`lsmod | grep hfs`
if [ "$check1_1_1_5a" == "install /bin/true" ] && [ "$check1_1_1_5b" == "" ]
then
	result1_1_1_5="OK"
else
	result1_1_1_5="ERR, Fix Manually"
fi
export result1_1_1_5

# 1.1.1.6 Ensure mounting of squashfs filesystems is disabled (Scored)
check1_1_1_6a=`modprobe -n -v squashfs | grep "install /bin/true"`
check1_1_1_6b=`lsmod | grep squashfs`
if [ "$check1_1_1_6a" == "install /bin/true" ] && [ "$check1_1_1_6b" == "" ]
then
	result1_1_1_6="OK"
else
	result1_1_1_6="ERR, Fix Manually"
fi
export result1_1_1_6

# 1.1.1.7 Ensure mounting of udf filesystems is disabled (Scored)
check1_1_1_7a=`modprobe -n -v udf | grep "install /bin/true"`
check1_1_1_7b=`lsmod | grep udf`
if [ "$check1_1_1_7a" == "install /bin/true" ] && [ "$check1_1_1_7b" == "" ]
then
	result1_1_1_7="OK"
else
	result1_1_1_7="ERR, Fix Manually"
fi
export result1_1_1_7

# 1.1.1.8 Ensure mounting of FAT filesystems is disabled (Scored)
check1_1_1_8a=`modprobe -n -v udf | grep "install /bin/true"`
check1_1_1_8b=`lsmod | grep udf`
if [ "$check1_1_1_8a" == "install /bin/true" ] && [ "$check1_1_1_8b" == "" ]
then
	result1_1_1_8="OK"
else
	result1_1_1_8="ERR, Fix Manually"
fi
export result1_1_1_8

# 1.1.2 Ensure separate partition exists for /tmp (Scored)
check1_1_2=`mount | grep /tmp`
if [ "$check1_1_2" == "" ]
then
	result1_1_2="ERR, Fix Manually"
else
	result1_1_2="OK"
fi
export result1_1_2

# 1.1.3 Ensure nodev option set on /tmp partition (Scored)
check1_1_3=`mount | grep /tmp | grep nodev`
if [ "$check1_1_3" == "" ]
then
	result1_1_3="ERR, Fix Manually"
else
	result1_1_3="OK"
fi
export result1_1_3

# 1.1.4 Ensure nosuid option set on /tmp partition (Scored)
check1_1_4=`mount | grep /tmp | grep nosuid`
if [ "$check1_1_4" == "" ]
then
	result1_1_4="ERR, Fix Manually"
else
	result1_1_4="OK"
fi
export result1_1_4

# 1.1.5 Ensure noexec option set on /tmp partition (Scored)
check1_1_5=`mount | grep /tmp | grep noexec`
if [ "$check1_1_5" == "" ]
then
    result1_1_5="ERR, Fix Manually"
else
    result1_1_5="OK"
fi
export result1_1_5

# 1.1.6 Ensure separate partition exists for /var (Scored)
check1_1_6=`mount | grep /var`
if [ "$check1_1_6" == "" ]
then
    result1_1_6="ERR, Fix Manually"
else
    result1_1_6="OK"
fi
export result1_1_6

# 1.1.7 Ensure separate partition exists for /var/tmp (Scored)
check1_1_7=`mount | grep /var/tmp`
if [ "$check1_1_7" == "" ]
then
    result1_1_7="ERR, Fix Manually"
else
    result1_1_7="OK"
fi
export result1_1_7

# 1.1.8 Ensure nodev option set on /var/tmp partition (Scored)
check1_1_8=`mount | grep /var/tmp | grep nodev`
if [ "$check1_1_8" == "" ]
then
    result1_1_8="ERR, Fix Manually"
else
    result1_1_8="OK"
fi
export result1_1_8

# 1.1.9 Ensure nosuid option set on /var/tmp partition (Scored)
check1_1_9=`mount | grep /var/tmp | grep nosuid`
if [ "$check1_1_9" == "" ]
then
    result1_1_9="ERR, Fix Manually"
else
    result1_1_9="OK"
fi
export result1_1_9

# 1.1.10 Ensure noexec option set on /var/tmp partition (Scored)
check1_1_10=`mount | grep /var/tmp | grep noexec`
if [ "$check1_1_10" == "" ]
then
    result1_1_10="ERR, Fix Manually"
else
    result1_1_10="OK"
fi
export result1_1_10

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

# 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)
check1_1_15=`mount | grep /dev/shm | grep nodev`
if [ "$check1_1_15" == "" ]
then
	result1_1_15="ERR, Fix Manually"
else
	result1_1_15="OK"
fi
export result1_1_15

# 1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)
check1_1_16=`mount | grep /dev/shm | grep nosuid`
if [ "$check1_1_16" == "" ]
then
	result1_1_16="ERR, Fix Manually"
else
	result1_1_16="OK"
fi
export result1_1_16

# 1.1.17 Ensure noexec option set on /dev/shm partition (Scored)
check1_1_17=`mount | grep /dev/shm | grep noexec`
if [ "$check1_1_17" == "" ]
then
	result1_1_17="ERR, Fix Manually"
else
	result1_1_17="OK"
fi
export result1_1_17

# 1.1.18 Ensure nodev option set on removable media partitions (Not Scored)
check1_1_18a=`mount | grep media | wc -l`
check1_1_18b=`mount | grep media | grep nodev | wc -l`
if [ "$check1_1_18a" == "0" ] || [ "$check1_1_18a" == "$check1_1_18b" ]
then
	result1_1_18="OK"
elif [ "$check1_1_18a" -ne "0" ] && [ "$check1_1_18a" -ne "$check1_1_18b" ]
then
	result1_1_18="ERR, Fix Manually"
else
	result1_1_18="ERR, Fix Manually"
fi
export result1_1_18

# 1.1.19 Ensure nosuid option set on removable media partitions (Not Scored)
check1_1_19a=`mount | grep media | wc -l`
check1_1_19b=`mount | grep media | grep nosuid | wc -l`
if [ "$check1_1_19a" == "0" ] || [ "$check1_1_19a" == "$check1_1_19b" ]
then
	result1_1_19="OK"
elif [ "$check1_1_19a" -ne "0" ] && [ "$check1_1_19a" -ne "$check1_1_19b" ]
then
	result1_1_19="ERR, Fix Manually"
else
	result1_1_19="ERR, Fix Manually"
fi
export result1_1_19

# 1.1.20 Ensure noexec option set on removable media partitions (Not Scored)
check1_1_20a=`mount | grep media | wc -l`
check1_1_20b=`mount | grep media | grep noexec | wc -l`
if [ "$check1_1_20a" == "0" ] || [ "$check1_1_20a" == "$check1_1_20b" ]
then
	result1_1_20="OK"
elif [ "$check1_1_20a" -ne "0" ] && [ "$check1_1_20a" -ne "$check1_1_20b" ]
then
	result1_1_20="ERR, Fix Manually"
else
	result1_1_20="ERR, Fix Manually"
fi
export result1_1_20

# 1.1.21 Ensure sticky bit is set on all world-writable directories (Scored)
check1_1_21=`df --local -P | awk '{ if ( NR != 1 ) print $6 }' | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null`
if [ "$check1_1_21" == "" ] 
then
	result1_1_21="OK"
else
	result1_1_21="ERR, Fix Manually"
fi
export result1_1_21

# 1.1.22 Disable Automounting (Scored)
check1_1_22=`sudo systemctl is-enabled autofs`
if [ "$check1_1_22" == "disabled" ] || [ "$check1_1_22" == "Failed to get unit file state for autofs.service: No such file or directory" ]
then
	result1_1_22="OK"
else
	result1_1_22="ERR, Fix Manually"
fi
export result1_1_22

# 1.2.1 Ensure package manager repositories are configured (Not Scored)
check1_2_1=`yum repolist | grep repolist | awk '{print $2}'`
if [ "$check1_2_1" != "0" ] 
then
	result1_2_1="OK"
else
	result1_2_1="ERR, Fix Manually"
fi
export result1_2_1

# 1.2.2 Ensure GPG keys are configured (Not Scored)
check1_2_2=`rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n' | wc -l`
if [ "$check1_2_2" -ne "0" ] 
then
	result1_2_2="OK"
else
	result1_2_2="ERR, Fix Manually"
fi
export result1_2_2

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
    echo "0 5 * * * /usr/sbin/aide --check" | tee --append /var/spool/cron/root
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

# 1.4.2 Ensure bootloader password is set (Scored)
check1_4_2a=`grep "^set superusers" /boot/grub2/grub.cfg`
check1_4_2b=`grep "^password" /boot/grub2/grub.cfg`
if [ "$check1_4_2a" == "" ] || [ "$check1_4_2b" == "" ]
then
    result1_4_2="ERR, Fix Manually"
else
    result1_4_2="OK"
fi
export result1_4_2

# 1.4.3 Ensure authentication required for single user mode (Not Scored)
check1_4_3a=`grep /sbin/sulogin /usr/lib/systemd/system/rescue.service`
check1_4_3b=`grep /sbin/sulogin /usr/lib/systemd/system/emergency.service`
output1_4_3='ExecStart=-/bin/sh -c "/usr/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"'
if [ "$check1_4_3a" == "$output1_4_3" ] || [ "$check1_4_3b" == "$output1_4_3" ]
then
    result1_4_3="OK"
else
    result1_4_3="ERR, Fix Manually"
fi
export result1_4_3

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

# 1.5.2 Ensure XD/NX support is enabled (Not Scored)
check1_5_2=`dmesg | grep "NX (Execute Disable) protection: active"`

if [ "$check1_5_2" == "" ]
then
    result1_5_2="ERR, Fix Manually"
else
    result1_5_2="OK"
fi
export result1_5_2

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

# 1.5.4 Ensure prelink is disabled (Scored)
check1_5_4=`rpm -q prelink`
if [ "$check1_5_4" == "package prelink is not installed" ]
then
    result1_5_4="OK"
else
    result1_5_4="ERR, Fix Automatically"
fi
export result1_5_4


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

# 1.6.1.3 Ensure SELinux policy is configured (Scored)
check1_6_1_3a=`grep SELINUXTYPE=targeted /etc/selinux/config`
check1_6_1_3b=`sestatus | grep "Loaded policy name" | grep targeted`
if [ "$check1_6_1_3a" != "" ] || [ "$check1_6_1_3b" -ne "" ]
then
    result1_6_1_3="OK"
else
	result1_6_1_3="ERR, Fix Manually"
fi
export result1_6_1_3

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

# 1.6.2 Ensure SELinux is installed (Scored)
check1_6_2=`rpm -q libselinux`
if [ "$check1_6_2" == "" ]
then
    result1_6_2="ERR, Fix Manually"
else
	result1_6_2="OK"
fi
export result1_6_2

bash 1_output.sh