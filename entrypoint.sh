#!/usr/bin/env bash
   
USER=nginx
LOGDIR=/var/log/adm
   
# prepare environment
mkdir -p /var/run/adm /tmp/cores ${LOGDIR}
chmod 755 /var/run/adm /tmp/cores ${LOGDIR}
chown ${USER}:${USER} /var/run/adm /tmp/cores ${LOGDIR}
   
# set location for core dumps
# echo '/tmp/cores/core.%h.%e.%t' > /proc/sys/kernel/core_pattern
   
# run processes
/bin/su -s /bin/bash -c "/usr/bin/adminstall --daemons 1 --memory 200 > ${LOGDIR}/adminstall.log 2>&1" ${USER}
/usr/sbin/nginx &
/bin/su -s /bin/bash -c "/usr/bin/admd -d --log info > ${LOGDIR}/admd.log 2>&1 &" ${USER}