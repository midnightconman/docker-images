# consul Docker Image

NOTES: 

## VOLUMES:
  - /etc/consul/

## Usage:
`docker run -v /etc/consul:/etc/consul \
   -p 53:53 -p 53:53/udp -p 8300-8302:8300-8302 \
   -p 8301:8301/udp -p 8302:8302/udp -p 8400:8400 -p 8500:8500 \
   midnightconman/consul:0.6.4 agent -config-dir=/etc/consul -advertise=$ip_address`
