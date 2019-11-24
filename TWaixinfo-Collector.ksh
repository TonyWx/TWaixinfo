#!/usr/bin/ksh93
################################################################
# TWaixinfo-Collector.ksh - AIX System Information Collector
# Written By: TonyW {TWx} - https://github.com/TonyWx/TWaixinfo
# Version 7.1.0.3 for AIX 7.1 / 7.2 (System Report)
# Update 2019/11/19 -- New Release on AIX 7100-05-02-1810
#
# Compatibility:
# AIX 7.2 / AIX 7.1 / VIOS 2.2.6 / AIX 6.1 TL 2 Service Pack 5 (6100-02-05) or later
# Release History:
# v7.1.0.3 - 2019/11/19 - New Release.
#+++++++++++++++++++++++++++++++++++++
export PATH=/usr/bin:/usr/sbin:$PATH
if [ ! -d /tmp/TWaixinfo ]; then mkdir -m 755 /tmp/TWaixinfo; fi
FDATE=$(date +%Y%m%d%H%M)
RepFile="/tmp/TWaixinfo/TWaixinfo-Collector-`hostname`-"$FDATE".out"
DChange="#######################################################
# Please don\'t change any content in the output file.
# Out file can convert to html from SMIT of TWaixinfo.
#######################################################"
echo "$DChange" >> $RepFile
print
Rc(){
    if [ $# -eq 1 ]; then Title=$1; echo "##### $Title #####" >> $RepFile; return; fi
    if (( $# > 1 && $# % 2 == 0  )); then
        for i in {1..$(($#/2))}; do
            echo "##### $Title $1 #####" >> $RepFile
            if (( $# > 1 )); then shift; fi
            $1 >> $RepFile
            if (( $# > 0 )); then shift; fi
        done
        print "\tGathering ... $TN .....\t done."
    fi
}

TN='System_Information'; Rc "$TN"
AR=("oslevel" "oslevel -s" "uptime" "uptime" "lsattr" "lsattr -El sys0" "lparstat-E" "lparstat -E" "prtconf" "prtconf -s" "environment" "cat /etc/environment" "lparstat" "lparstat"); Rc "${AR[@]}"

TN='Adapters_Device'; Rc "$TN"
AR=("lsdev" "lsdev"); Rc "${AR[@]}"

TN='System_Storage_Info'; Rc "$TN"

LSVG=`lsvg -o`
AR=("lsdev-disk" "lsdev -Cc disk" "lspv" "lspv" "lsvg-o" "lsvg -o" "lsvg" "lsvg $LSVG" "lsvg-l" "lsvg -l $LSVG"); Rc "${AR[@]}"

TN='Filesystems_Info'; Rc "$TN"
AR=("df" "df -g" "lsfs" "lsfs -a"); Rc "${AR[@]}"

TN='Memory_Consumption'; Rc "$TN"
AR=("svmon" "svmon" )
if [ $(id -u) == 0 ]; then AR=("svmon" "svmon" "vmo" "vmo -F -x"); fi
Rc "${AR[@]}"

TN='AIX_Mainten_Level'; Rc "$TN"
AR=("oslevel-s" "oslevel -s"); Rc "${AR[@]}"
Rs01=`instfix -iqv |grep AIX_ML`
echo "##### $TN instfix-iq #####" >> $RepFile
echo "$Rs01" >> $RepFile
Rs02=`instfix -i |grep AIX_ML`
echo "##### $TN instfix-i #####" >> $RepFile
echo "$Rs02" >> $RepFile

TN='Installed_Software'; Rc "$TN"
AR=("lslpp-q" "lslpp -qch" "lslpp-qL" "lslpp -qLc"); Rc "${AR[@]}"

TN='TCP_IP_Information'; Rc "$TN"
AR=("netstat-i" "netstat -i -n -f inet" "netstat-r" "netstat -r -n -f inet"); Rc "${AR[@]}"
echo "##### $TN entstat #####" >> $RepFile
for i in `ifconfig -l`;do entstat $i 2>/dev/null >>$RepFile ;done

TN='Error_Summary'; Rc "$TN"
AR=("errpt" "errpt"); Rc "${AR[@]}"

if [ $(id -u) = 0 ]; then
  TN='Dump_Device_Info'; Rc "$TN"
  AR=("sysdumpdev" "sysdumpdev -l"); Rc "${AR[@]}"
fi

TN='Subsystems_Info'; Rc "$TN"
AR=("lssrc" "lssrc -a"); Rc "${AR[@]}"

TN='VPD_Information'; Rc "$TN"
AR=("lscfg" "lscfg -vp"); Rc "${AR[@]}"

print "\n\tCompleted the Collection.\n\n\t$RepFile\n"
exit 0
