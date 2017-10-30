# 2.1.1 Ensure chargen services are not enabled (Scored)
check2_1_1=`systemctl list-unit-files | grep -e 'chargen-dgram\|chargen-stream' | grep enabled`
if [ "$check2_1_1" == "" ] 
then
    result2_1_1="OK"
else
	result2_1_1="ERR, Fix Manually"
fi
export result2_1_1

# 2.1.2 Ensure daytime services are not enabled (Scored)
check2_1_2=`systemctl list-unit-files | grep -e 'daytime-dgram\|daytime-stream' | grep enabled`
if [ "$check2_1_2" == "" ] 
then
    result2_1_2="OK"
else
	result2_1_2="ERR, Fix Manually"
fi
export result2_1_2

# 2.1.2 Ensure discard services are not enabled (Scored)
check2_1_3=`systemctl list-unit-files | grep -e 'discard-dgram\|discard-stream' | grep enabled`
if [ "$check2_1_3" == "" ] 
then
    result2_1_3="OK"
else
	result2_1_3="ERR, Fix Manually"
fi
export result2_1_3

# 2.1.4 Ensure echo services are not enabled (Scored)
check2_1_4=`systemctl list-unit-files | grep -e 'echo-dgram\|echo-stream' | grep enabled`
if [ "$check2_1_4" == "" ] 
then
    result2_1_4="OK"
else
	result2_1_4="ERR, Fix Manually"
fi
export result2_1_4

# 2.1.5 Ensure time services are not enabled (Scored)
check2_1_5=`systemctl list-unit-files | grep -e 'time-dgram\|time-stream' | grep enabled`
if [ "$check2_1_5" == "" ]
then
    result2_1_5="OK"
else
	result2_1_5="ERR, Fix Manually"
fi
export result2_1_5

# 2.1.6 Ensure tftp server is not enabled (Scored)
check2_1_6=`systemctl list-unit-files | grep -e 'tftp' | grep enabled`
if [ "$check2_1_6" != "" ] || [ "$check2_1_6" != "Unit tftp.service could not be found." ]
then
    result2_1_6="OK"
else
	result2_1_6="ERR, Fix Manually"
fi
export result2_1_6

# 2.1.7 Ensure xinetd is not enabled (Scored)
check2_1_7=`systemctl is-enabled xinetd | grep enabled`
if [ "$check2_1_7" != "" ] || [ "$check2_1_7" != "Unit xinetd.service could not be found." ] 
then
    result2_1_7="OK"
else
	result2_1_7="ERR, Fix Manually"
fi
export result2_1_7

# 2.2.1.1 Ensure time synchronization is in use (Not Scored)
check2_2_1_1a=`rpm -q chrony | grep package`
check2_2_1_1b=`rpm -q ntp | grep package`
if [ "$check2_2_1_1a" == "" ] || [ "$check2_2_1_1b" == "" ] 
then
    result2_2_1_1="OK"
else
	result2_2_1_1="ERR, Fix Manually"
fi
export result2_2_1_1

# 2.2.1.2 Ensure ntp is configured (Scored)
check2_2_1_2a=`grep "^restrict" /etc/ntp.conf | grep -v "#"`
check2_2_1_2b=`grep "^server" /etc/ntp.conf | grep -v "#"` 
check2_2_1_2c=`grep "^OPTIONS" /etc/sysconfig/ntpd | grep -v "#"` 
check2_2_1_2d=`grep "^ExecStart" /usr/lib/systemd/system/ntpd.service | grep -v "#"`
if [ "$check2_2_1_2a" != "" ] && [ "$check2_2_1_2b" != "" ] && [ "$check2_2_1_2c" == 'OPTIONS="-u ntp:ntp"' ] && [ "$check2_2_1_2d" == 'OPTIONS="ExecStart=/usr/sbin/ntpd -u ntp:ntp $OPTIONS"' ]
then
    result2_2_1_2="OK"
else
	result2_2_1_2="ERR, Fix Manually"
fi
export result2_2_1_2

# 2.2.1.3 Ensure chrony is configured (Scored)
check2_2_1_3a=`grep "^server" /etc/chrony.conf | grep -v "#"`
check2_2_1_3b=`grep ^OPTIONS /etc/sysconfig/chronyd | grep -v "#"` 
if [ "$check2_2_1_3a" != "" ] && [ "$check2_2_1_3b" == "OPTIONS="-u chrony"" ] 
then
    result2_2_1_3="OK"
else
	result2_2_1_3="ERR, Fix Manually"
fi
export result2_2_1_3

# 2.2.2 Ensure X Window System is not installed (Scored)
check2_2_2=`rpm -qa xorg-x11*`
if [ "$check2_2_2" != "" ] 
then
    result2_2_2="OK"
else
	result2_2_2="ERR, Fix Manually"
fi
export result2_2_2

# 2.2.3 Ensure Avahi Server is not enabled (Scored)
check2_2_3=`systemctl is-enabled avahi-daemon`
if [ "$check2_2_3" != "enabled" ] 
then
    result2_2_3="OK"
else
	result2_2_3="ERR, Fix Manually"
fi
export result2_2_3

# 2.2.4 Ensure CUPS is not enabled (Scored)
check2_2_4=`systemctl is-enabled cups`
if [ "$check2_2_4" != "enabled" ] 
then
    result2_2_4="OK"
else
	result2_2_4="ERR, Fix Manually"
fi
export result2_2_4

# 2.2.5 Ensure DHCP Server is not enabled (Scored)
check2_2_5=`systemctl is-enabled dhcpd`
if [ "$check2_2_5" != "enabled" ] 
then
    result2_2_5="OK"
else
	result2_2_5="ERR, Fix Manually"
fi
export result2_2_5

# 2.2.6 Ensure LDAP server is not enabled (Scored)
check2_2_6=`systemctl is-enabled slapd`
if [ "$check2_2_6" != "enabled" ] 
then
    result2_2_6="OK"
else
	result2_2_6="ERR, Fix Manually"
fi
export result2_2_6

# 2.2.7 Ensure NFS and RPC are not enabled (Scored)
check2_2_7a=`systemctl is-enabled nfs`
check2_2_7b=`systemctl is-enabled rpcbind`
if [ "$check2_2_7a" != "enabled" ] && [ "$check2_2_7b" != "enabled" ]
then
    result2_2_7="OK"
else
	result2_2_7="ERR, Fix Manually"
fi
export result2_2_7

# 2.2.8 Ensure DNS Server is not enabled (Scored)
check2_2_8=`systemctl is-enabled named`
if [ "$check2_2_8" != "enabled" ]
then
    result2_2_8="OK"
else
	result2_2_8="ERR, Fix Manually"
fi
export result2_2_8

# 2.2.9 Ensure FTP Server is not enabled (Scored)
check2_2_9=`systemctl is-enabled vsftpd`
if [ "$check2_2_9" != "enabled" ]
then
    result2_2_9="OK"
else
	result2_2_9="ERR, Fix Manually"
fi
export result2_2_9

# 2.2.10 Ensure HTTP server is not enabled (Scored)
check2_2_10=`systemctl is-enabled httpd`
if [ "$check2_2_10" != "enabled" ]
then
    result2_2_10="OK"
else
	result2_2_10="ERR, Fix Manually"
fi
export result2_2_10

# 2.2.11 Ensure IMAP and POP3 server is not enabled (Scored)
check2_2_11=`systemctl is-enabled dovecot`
if [ "$check2_2_11" != "enabled" ]
then
    result2_2_11="OK"
else
	result2_2_11="ERR, Fix Manually"
fi
export result2_2_11

# 2.2.12 Ensure Samba is not enabled (Scored)
check2_2_12=`systemctl is-enabled smb`
if [ "$check2_2_12" != "enabled" ]
then
    result2_2_12="OK"
else
	result2_2_12="ERR, Fix Manually"
fi
export result2_2_12

# 2.2.13 Ensure HTTP Proxy Server is not enabled (Scored)
check2_2_13=`systemctl is-enabled squid`
if [ "$check2_2_13" != "enabled" ]
then
    result2_2_13="OK"
else
	result2_2_13="ERR, Fix Manually"
fi
export result2_2_13

# 2.2.14 Ensure SNMP Server is not enabled (Scored)
check2_2_14=`systemctl is-enabled snmpd`
if [ "$check2_2_14" != "enabled" ]
then
    result2_2_14="OK"
else
	result2_2_14="ERR, Fix Manually"
fi
export result2_2_14

# 2.2.15 Ensure mail transfer agent is configured for local-only mode (Scored)
check2_2_15=`netstat -an | grep LIST | grep ":25[[:space:]]"`
if [ "$check2_2_15" == "tcp 0 0 127.0.0.1:25 0.0.0.0:* LISTEN" ]
then
    result2_2_15="OK"
else
	result2_2_15="ERR, Fix Manually"
fi
export result2_2_15

# 2.2.16 Ensure NIS Server is not enabled (Scored)
check2_2_16=`systemctl is-enabled ypserv`
if [ "$check2_2_16" != "enabled" ]
then
    result2_2_16="OK"
else
	result2_2_16="ERR, Fix Manually"
fi
export result2_2_16

# 2.2.17 Ensure rsh server is not enabled (Scored)
check2_2_17a=`systemctl is-enabled rsh.socket`
check2_2_17b=`systemctl is-enabled rlogin.socket`
check2_2_17c=`systemctl is-enabled rexec.socket`
if [ "$check2_2_17a" != "enabled" ] && [ "$check2_2_17b" != "enabled" ] && [ "$check2_2_17c" != "enabled" ]
then
    result2_2_17="OK"
else
	result2_2_17="ERR, Fix Manually"
fi
export result2_2_17

# 2.2.18 Ensure telnet server is not enabled (Scored)
check2_2_18=`systemctl is-enabled telnet.socket`
if [ "$check2_2_18" != "enabled" ]
then
    result2_2_18="OK"
else
	result2_2_18="ERR, Fix Manually"
fi
export result2_2_18

# 2.2.19 Ensure tftp server is not enabled (Scored)
check2_2_19=`systemctl is-enabled tftp.socket`
if [ "$check2_2_19" != "enabled" ]
then
    result2_2_19="OK"
else
	result2_2_19="ERR, Fix Manually"
fi
export result2_2_19

# 2.2.20 Ensure rsync service is not enabled (Scored)
check2_2_20=`systemctl is-enabled rsyncd`
if [ "$check2_2_20" != "enabled" ]
then
    result2_2_20="OK"
else
	result2_2_20="ERR, Fix Manually"
fi
export result2_2_20

# 2.2.21 Ensure talk server is not enabled (Scored)
check2_2_21=`systemctl is-enabled ntalk`
if [ "$check2_2_21" != "enabled" ]
then
    result2_2_21="OK"
else
	result2_2_21="ERR, Fix Manually"
fi
export result2_2_21

bash 2_output.sh