#!/bin/bash
## Output to CSV format
echo "1.1.1.1, Ensure mounting of cramfs filesystems is disabled (Scored), $result1_1_1_1"
echo "1.1.1.2, Ensure mounting of freevxfs filesystems is disabled (Scored), $result1_1_1_2"
echo "1.1.1.3, Ensure mounting of jffs2 filesystems is disabled (Scored), $result1_1_1_3"
echo "1.1.1.4, Ensure mounting of hfs filesystems is disabled (Scored), $result1_1_1_4"
echo "1.1.1.5, Ensure mounting of hfsplus filesystems is disabled (Scored), $result1_1_1_5"
echo "1.1.1.6, Ensure mounting of squashfs filesystems is disabled (Scored), $result1_1_1_6"
echo "1.1.1.7 Ensure mounting of udf filesystems is disabled (Scored), $result1_1_1_7"
echo "1.1.1.8, Ensure mounting of FAT filesystems is disabled (Scored), $result1_1_1_8"
echo "1.1.2, Ensure separate partition exists for /tmp (Scored), $result1_1_2"
echo "1.1.3, Ensure nodev option set on /tmp partition (Scored), $result1_1_3"
echo "1.1.4, Ensure nosuid option set on /tmp partition (Scored), $result1_1_4"
echo "1.1.5, Ensure noexec option set on /tmp partition (Scored), $result1_1_5"
echo "1.1.6, Ensure separate partition exists for /var (Scored), $result1_1_6"
echo "1.1.7, Ensure separate partition exists for /var/tmp (Scored), $result1_1_7"
echo "1.1.8, Ensure nodev option set on /var/tmp partition (Scored), $result1_1_8"
echo "1.1.9, Ensure nosuid option set on /var/tmp partition (Scored), $result1_1_9"
echo "1.1.10, Ensure noexec option set on /var/tmp partition (Scored), $result1_1_10"
echo "1.1.11, Ensure separate partition exists for /var/log (Scored), $result1_1_11"
echo "1.1.12, Ensure separate partition exists for /var/log/audit (Scored), $result1_1_12"
echo "1.1.13, Ensure separate partition exists for /home (Scored), $result1_1_13"
echo "1.1.14, Ensure nodev option set on /home partition (Scored), $result1_1_14"
echo "1.1.15, Ensure nodev option set on /dev/shm partition (Scored)), $result1_1_15"
echo "1.1.16, Ensure nosuid option set on /dev/shm partition (Scored), $result1_1_16"
echo "1.1.17, Ensure noexec option set on /dev/shm partition (Scored), $result1_1_17"
echo "1.1.18, Ensure nodev option set on removable media partitions (Not Scored), $result1_1_18"
echo "1.1.19, Ensure nosuid option set on removable media partitions (Not Scored), $result1_1_19"
echo "1.1.20, Ensure noexec option set on removable media partitions (Not Scored), $result1_1_20"
echo "1.1.21, Ensure sticky bit is set on all world-writable directories (Scored), $result1_1_21"
echo "1.1.22, Disable Automounting (Scored), $result1_1_22"
echo "1.2.1, Ensure package manager repositories are configured (Not Scored), $result1_2_1"
echo "1.2.2, Ensure GPG keys are configured (Not Scored), $result1_2_2"
echo "1.2.3, Ensure gpgcheck is globally activated (Scored), $result1_2_3" 
echo "1.3.1, Ensure AIDE is installed (Scored), $result1_3_1"
echo "1.3.2, Ensure filesystem integrity is regularly checked (Scored), $result1_3_2"
echo "1.4.1, Ensure permissions on bootloader config are configured (Scored), $result1_4_1"
echo "1.4.2, Ensure bootloader password is set (Scored), $result1_4_2"
echo "1.4.3, Ensure authentication required for single user mode (Not Scored), $result1_4_3"
echo "1.5.1, Ensure core dumps are restricted (Scored), $result1_5_1"
echo "1.5.2, Ensure XD/NX support is enabled (Not Scored), $result1_5_2"
echo "1.5.3, Ensure address space layout randomization (ASLR) is enabled (Scored), $result1_5_3"
echo "1.5.4, Ensure prelink is disabled (Scored), $result1_5_4"
echo "1.6.1.1, Ensure SELinux is not disabled in bootloader configuration (Scored), $result1_6_1_1"
echo "1.6.1.2, Ensure the SELinux state is enforcing (Scored), $result1_6_1_2"
echo "1.6.1.3, Ensure SELinux policy is configured (Scored), $result1_6_1_3"
echo "1.6.1.4, Ensure SETroubleshoot is not installed (Scored), $result1_6_1_4"
echo "1.6.1.5, Ensure the MCS Translation Service (mcstrans) is not installed (Scored), $result1_6_1_5"
echo "1.6.1.6, Ensure no unconfined daemons exist (Scored), $result1_6_1_6"
echo "1.6.2, Ensure SELinux is installed (Scored), $result1_6_2"
echo "1.7.1.1, Ensure message of the day is configured properly (Scored), $result1_7_1_1"
echo "1.7.1.2, Ensure local login warning banner is configured properly (Not Scored), $result1_7_1_2"
echo "1.7.1.3, Ensure remote login warning banner is configured properly (Not Scored), $result1_7_1_3"
echo "1.7.1.4, Ensure permissions on /etc/motd are configured (Not Scored), $result1_7_1_4"
echo "1.7.1.5, Ensure permissions on /etc/issue are configured (Scored), $result1_7_1_5"
echo "1.7.1.6, Ensure permissions on /etc/issue.net are configured (Not Scored), $result1_7_1_6"
echo "1.7.2, Ensure GDM login banner is configured (Scored), $result1_7_2"
echo "1.8, Ensure updates, patches, and additional security software are installed (Not Scored), --, Please check manual"