#!/bin/bash
###Warning: Please run this script as root user###

#Author: Abrar Khalish
#Version: 1.0 (28/07/2020)

#Description: This script is used to check for probable rogue large files and send e-mail to alarm@animapoint.net.

date=$(date +%d-%m-%Y)
file=/tmp/rogue_log/"$date"_rogue_file_result.txt

##Findng probable rogue large files
echo "Top 10 Probable Rogue Large Files" > $file
echo "=================================" >> $file
find / -type f -exec du -Sh {} + 2> /dev/null | sort -rh | head -n 10 >> $file

##Timetstamp
echo "Report generated at $(date)" >> $file

##Send the report via SSMTP
cat $file | mail -s "Probable Rogue Files Past 12 Hours" alarm@animapoint.net