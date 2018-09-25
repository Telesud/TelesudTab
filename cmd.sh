#!/usr/bin/env bash
memTotal_b=`free -b |grep Mem |awk '{print $2}'`
memFree_b=`free -b |grep Mem |awk '{print $4}'`
memBuffer_b=`free -b |grep Mem |awk '{print $6}'`
memCache_b=`free -b |grep Mem |awk '{print $7}'`
memTotal_m=`free -m |grep Mem |awk '{print $2}'`
memFree_m=`free -m |grep Mem |awk '{print $4}'`
memBuffer_m=`free -m |grep Mem |awk '{print $6}'`
memCache_m=`free -m |grep Mem |awk '{print $7}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
hdd=`df -lh | awk '{if ($6 == "/") { print $5 }}' | head -1 | cut -d'%' -f1`
uptime=`uptime`
time=`date` 
calendar=`cal` 
ProcessCnt=`ps -A | wc -l`
memUsed_b=$(($memTotal_b-$memFree_b))
memUsed_m=$(($memTotal_m-$memFree_m))
memUsedPrc=$((($memUsed_b*100)/$memTotal_b))
if [ "$1" = "fa" ]; then
echo '• کل رم : '"$memTotal_m"' مگابايت'
echo '• ميزان استفاده شده از رم : '"$memUsed_m"' مگابايت - '"$memUsedPrc"'%'
echo '• مقدار استفاده شده از سي پي يو : '"$CPUPer"'%'
echo '• مقدار استفاده شده از حافظه : '"$hdd"'%'
echo '• فرايد هاي در حال اجرا : '"$ProcessCnt"''
echo '• آپتایم : 👇'
echo '• '"$uptime"''
exit 1
fi
if [ "$1" = "en" ]; then
echo '• Total RAM : '"$memTotal_m"' Mb'
echo '• Memory Usage : '"$memUsed_m"' Mb - '"$memUsedPrc"'%'
echo '• Cpu Usage : '"$CPUPer"'%'
echo '• Hdd Usage : '"$hdd"'%'
echo '• Processes : '"$ProcessCnt"''
echo '• UpTime : 👇'
echo '• '"$uptime"''
exit 1
fi
