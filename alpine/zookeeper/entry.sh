#!/usr/bin/env /bin/sh

ZK_HOME='/opt/zookeeper'
ZK_DATA_DIR=${ZK_DATA_DIR:-/tmp/zookeeper}

# Populate server id
echo "${ZK_SERVER_ID:-1}" > ${ZK_DATA_DIR}/myid

# Populate base zoo.cfg
cat > ${ZK_HOME}/conf/zoo.cfg <<EOF
tickTime=${ZK_TICK_TIME:-2000}
clientPort=${ZK_CLIENT_PORT:-2181}
dataDir=${ZK_DATA_DIR:-/tmp/zookeeper}
EOF

# Populate server pool in zoo.cfg
if [ "x${ZK_SERVER_POOL}" != "x" ]
then
  a=1
  for i in ${ZK_SERVER_POOL}
  do
    echo "server.${a}=${i}" >> ${ZK_HOME}/conf/zoo.cfg
    let a=a+1
  done
fi
 
# Pass parameters to zkServer script         
/usr/bin/env ${ZK_HOME}/bin/zkServer.sh "$@"
