#!/bin/sh
source /root/ini_cloud.ini
source /tmp/hour.txt
source /root/cam.ini
R=$(awk 'NR==1' /etc/config/ipcam)
hour=$(date +%H)
if [ $flg_day -eq 1 ];then
	A=$(ls -1A /tmp/ya_mot | wc -l)
	#while [ ! -e $(pgrep openRTSP) ]; do
	#sleep 1
	#done
	DD_vid=$(date +%m%d"20"%y"-"%H"_"%M"_"%S)
		if [ $A -lt 2 ];then
			#openRTSP -V -4 -f 4 -d $dlit_rol_dv_day $RTSP>/tmp/ya/$DD_vid.mp4
			openRTSP -V -B 51200 -b 200000 -4 -f 20 -d $dlit_rol_dv_day $RTSP>/tmp/ya_mot/$DD_vid.mp4
		fi
else
	A=$(ls -1A /tmp/ya_mot | wc -l)
	#while [ ! -e $(pgrep openRTSP) ]; do
	#sleep 1
	#done
	DD_vid=$(date +%m%d"20"%y"-"%H"_"%M"_"%S)
		if [ $A -lt 2 ];then 
			#openRTSP -V -4 -f 4 -d $dlit_rol_dv_night $RTSP>/tmp/ya/$DD_vid.mp4
			openRTSP -V -B 51200 -b 200000 -4 -f 20 -d $dlit_rol_dv_night $RTSP>/tmp/ya_mot/$DD_vid.mp4
		fi
fi
#DD_new=$(date +%Y-%m-%d)
#if [ -e /tmp/old.txt ];then
#        DD_old=$(cat /tmp/old.txt)
#        if [ $DD_new != $DD_old ];then
#                curl -v -k -u $email:$pass -X MKCOL https://webdav.yandex.ru/CAM
#                curl -v -k -u $email:$pass -X MKCOL https://webdav.yandex.ru/CAM/$DD_new
#                curl -v -k -u $email:$pass -X MKCOL https://webdav.yandex.ru/CAM/$DD_new/MOTION
#                curl -v -k -u $email:$pass -X MKCOL https://webdav.yandex.ru/CAM/$DD_new/MOTION/VIDEO
#        fi
#else
#        curl -v -k -u $email:$pass -X MKCOL https://webdav.yandex.ru/CAM
#        curl -v -k -u $email:$pass -X MKCOL https://webdav.yandex.ru/CAM/$DD_new
#        curl -v -k -u $email:$pass -X MKCOL https://webdav.yandex.ru/CAM/$DD_new/MOTION
#        curl -v -k -u $email:$pass -X MKCOL https://webdav.yandex.ru/CAM/$DD_new/MOTION/VIDEO
#fi
#echo $DD_new > /tmp/old.txt
#curl -v --stderr /tmp/logi2 -k -u $email:$pass -T /tmp/ya_mot/$DD_vid.mp4 https://webdav.yandex.ru/CAM/$DD_new/MOTION/VIDEO/
#rm /tmp/ya/$DD_vid.mp4
exit
