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

bash 2_output.sh