#/bin/bash
echo""
echo "==========================="
echo ""


echo "- 1.2.3 Ensure gpgcheck is globally activated (Scored)"
check1=`grep gpgcheck /etc/yum.conf`

if [ $check1 == "gpgcheck=1" ]
then
	echo "-- okay"
else
	echo "-- $check1"
	sed -i "s/gpgcheck=0/gpgcheck=1/g" /etc/yum.conf
	echo "-- its okay now"
fi

echo""
echo "==========================="
echo ""

echo "- 1.3.1 Ensure AIDE is installed (Scored)"
check2=`rpm -q aide`

if [ "$check2" == "package aide is not installed" ]
then 
	echo "-- package not installed, proceed to install"
	yum -y install aide
	rpm -q aide
	echo "-- its okay now"
else
	echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "- 1.3.2 Ensure filesystem integrity is regularly checked (Scored)"
check3=`crontab -u root -l | grep aide`

if [ "$check3" == "0 5 * * * /usr/sbin/aide --check" ]
then
        echo "-- okay"
else
        echo "0 5 * * * /usr/sbin/aide --check" | sudo tee -a /var/spool/cron/root
	echo "-- its okay now"
fi

echo""
echo "==========================="
echo ""

echo "- 1.6.1.1 Ensure SELinux is not disabled in bootloader configuration (Scored)"
check4a=`grep selinux=0 /boot/grub2/grub.cfg`
check4b=`grep enforcing=0 /boot/grub2/grub.cfg`

if [ "$check4a" == "" ] && [ "$check4b" == "" ]
then
        echo "-- okay"
else
        sed -i '/selinux=0/d' /boot/grub2/grub.cfg
	sed -i '/enforcing=0/d' /boot/grub2/grub.cfg
	echo "-- Its okay now"
fi 

echo""
echo "==========================="
echo ""

echo "-  1.6.1.2 Ensure the SELinux state is enforcing (Scored)"
check5=`grep SELINUX=enforcing /etc/selinux/config`

if [ "$check5" == "SELINUX=enforcing" ]
then
        echo "-- okay"
else
        sed -i 's/SELINUX=permissive/SELINUX=enforcing/g' /etc/selinux/config
        sed -i 's/SELINUX=disabled/SELINUX=enforcing/g' /etc/selinux/config
        echo "-- Its okay now"
fi

echo""
echo "==========================="
echo ""

echo "-  1.6.1.4 Ensure SETroubleshoot is not installed (Scored) "
check6=`rpm -q setroubleshoot`

if [ "$check6" == "package setroubleshoot is not installed" ]
then
        echo "-- okay"
else
        yum remove setroubleshoot -y
        echo "-- Its okay now"
fi

echo""
echo "==========================="
echo ""

echo "- 1.6.1.6 Ensure no unconfined daemons exist (Scored)"
check7=`ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk" | tr ':' ' ' | awk '{print $NF }'`

if [ "$check7" == "" ]
then
        echo "-- okay"
else
        echo "-- Its not okay please investigate manually"
fi

echo""
echo "==========================="
echo ""

echo "- 1.4.1 Ensure permissions on bootloader config are configured (Scored) "
check8=`stat /boot/grub2/grub.cfg | grep root | grep root | grep 600`

if [ "$check8" == "" ]
then
	chown root:root /boot/grub2/grub.cfg
	chmod og-rwx /boot/grub2/grub.cfg
        echo "-- Its okay now"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "- 1.5.1 Ensure core dumps are restricted (Scored)"
check10a=`grep "hard core" /etc/security/limits.conf /etc/security/limits.d/*`

if [ "$check10a" == "" ]
then
        echo "* hard core 0" >> /etc/security/limits.conf
        echo "-- Its okay now"
else
        echo "-- okay"
fi

check10b=`/sbin/sysctl fs.suid_dumpable`

if [ "$check10b" == "" ]
then
        echo "fs.suid_dumpable = 0" >> /etc/sysctl.conf
        echo "-- Its okay now"
else
        echo "-- okay"
fi


echo""
echo "==========================="
echo ""

echo "- 1.5.3 Ensure address space layout randomization (ASLR) is enabled (Scored)"
check11=`/sbin/sysctl kernel.randomize_va_space`

if [ "$check11" == "" ]
then
       	echo "kernel.randomize_va_space = 2" >> /etc/sysctl.conf
	sysctl -w kernel.randomize_va_space=2
        echo "-- Its okay now"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "-  1.6.1.3 Ensure SELinux policy is configured (Scored)"
check12=`sudo grep SELINUXTYPE=targeted /etc/selinux/config`

if [ $check12 == "SELINUXTYPE=targeted" ]
then
        echo "-- okay"
else
        sed -i 's/SELINUXTYPE=minimum/SELINUXTYPE=targeted/g' /etc/selinux/config
        sed -i 's/SELINUXTYPE=mls/SELINUXTYPE=targeted/g' /etc/selinux/config
        echo "-- Its okay now"
fi

echo""
echo "==========================="
echo ""

echo "-  1.6.1.5 Ensure the MCS Translation Service (mcstrans) is not installed (Scored)"
check13=`rpm -q mcstrans`

if [ "$check13" == "package mcstrans is not installed" ]
then
        echo "-- okay"
else
	yum remove -y mcstrans
        echo "-- its okay now"
fi

echo""
echo "==========================="
echo ""

echo "-  1.1.2 Ensure separate partition exists for /tmp (Scored) "
check14=`mount | grep /tmp`

if [ "$check14" == "" ]
then
        echo "-- its not okay, please do it manually"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "-  1.1.5 Ensure noexec option set on /tmp partition (Scored)"
check14a=`mount | grep /tmp | grep noexec`
check14b=`mount | grep "[[:space:]]/tmp[[:space:]]" | grep noexec`

if [ "$check14a" == "" ]
then
        echo "-- its not okay, please do it manually"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "- 1.1.11 Ensure separate partition exists for /var/log (Scored)"
check16=`mount | grep /var/log`

if [ "$check16" == "" ] 
then
        echo "-- its not okay, please do it manually"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "- 1.1.12 Ensure separate partition exists for /var/log/audit (Scored)"
check17=`mount | grep /var/log/audit`

if [ "$check17" == "" ]
then
        echo "-- its not okay, please do it manually"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "- 1.1.13 Ensure separate partition exists for /home (Scored) "
check18=`mount | grep /home`

if [ "$check18" == "" ]
then
        echo "-- its not okay, please do it manually"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "- 1.1.14 Ensure nodev option set on /home partition (Scored)"
check19=`mount | grep /home | grep nodev`

if [ "$check19" == "" ]
then
        echo "-- its not okay, please do it manually"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

