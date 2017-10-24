#/bin/bash
echo""
echo "==========================="
echo ""


echo "- Verify that gpgcheck is Globally Activated"
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

echo "- Install AIDE"
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

echo "- Implement Periodic Execution of File Integrity"
check3=`crontab -u root -l | grep aide`

if [ "$check3" == "0 5 * * * /usr/sbin/aide --check" ]
then
        echo "-- okay"
else
        echo "0 5 * * * /usr/sbin/aide --check" | tee -a /var/spool/cron/root
	echo "-- its okay now"
fi

echo""
echo "==========================="
echo ""

echo "- Enable SELinux in /boot/grub2/grub.cfg"
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

echo "-  Set the SELinux State"
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

echo "-  Remove SETroubleshoot"
check6=`rpm -q setroubleshoot`

if [ "$check6" == "package setroubleshoot is not installed" ]
then
        echo "-- okay"
else
        yum erase setroubleshoot -y
        echo "-- Its okay now"
fi

echo""
echo "==========================="
echo ""

echo "- Check for Unconfined Daemons"
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

echo "- Set User/Group Owner on /boot/grub2/grub.cfg"
check8=`stat -L -c "%u %g" /boot/grub2/grub.cfg | egrep "0 0"`

if [ "$check8" == "" ]
then
	chown root:root /boot/grub2/grub.cfg
        echo "-- Its okay now"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "- Set Permissions on /boot/grub2/grub.cfg"
check9=`stat -L -c "%a" /boot/grub2/grub.cfg | egrep ".00"`

if [ "$check9" == "" ]
then
        chmod og-rwx /boot/grub2/grub.cfg
        echo "-- Its okay now"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "- Restrict Core Dumps"
check10a=`grep "hard core" /etc/security/limits.conf`

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

echo "- Enable Randomized Virtual Memory Region Placement"
check11=`/sbin/sysctl kernel.randomize_va_space`

if [ "$check11" == "" ]
then
       	echo "kernel.randomize_va_space = 2" >> /etc/sysctl.conf
        echo "-- Its okay now"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "-  Set the SELinux Policy"
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

echo "-  Remove MCS Translation Service (mcstrans)"
check13=`rpm -q mcstrans`

if [ "$check13" == "package mcstrans is not installed" ]
then
        echo "-- okay"
else
	yum erase mcstrans
        echo "-- its okay now"
fi

echo""
echo "==========================="
echo ""

echo "-  Create Separate Partition for /tmp"
check14=`grep "[[:space:]]/tmp[[:space:]]" /etc/fstab`

if [ "$check14" == "" ]
then
        echo "-- its not okay, please do it manually"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "-  Set noexec option for /tmp Partition"
check14a=`grep "[[:space:]]/tmp[[:space:]]" /etc/fstab | grep noexec`
check14b=`mount | grep "[[:space:]]/tmp[[:space:]]" | grep noexec`

if [ "$check14a" == "" ] || [ "$check14b" == "" ] 
then
        echo "-- its not okay, please do it manually"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "- Bind Mount the /var/tmp directory to /tmp"
check15a=`grep -e "^/tmp[[:space:]]" /etc/fstab | grep /var/tmp`
check15b=`mount | grep -e "^/tmp[[:space:]]" | grep /var/tmp`

if [ "$check15a" == "" ] || [ "$check15b" == "" ]
then
        echo "-- its not okay, please do it manually"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "- Create Separate Partition for /var/log"
check16=`grep "[[:space:]]/var/log/audit[[:space:]]" /etc/fstab`

if [ "$check16" == "" ] 
then
        echo "-- its not okay, please do it manually"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "- Create Separate Partition for /var/log/audit"
check17=`grep "[[:space:]]/var/log/audit[[:space:]]" /etc/fstab`

if [ "$check17" == "" ]
then
        echo "-- its not okay, please do it manually"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "- Create Separate Partition for /home"
check18=`grep "[[:space:]]/home[[:space:]]" /etc/fstab`

if [ "$check18" == "" ]
then
        echo "-- its not okay, please do it manually"
else
        echo "-- okay"
fi

echo""
echo "==========================="
echo ""

echo "- Add nodev Option to /home"
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

