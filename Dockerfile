FROM alpine:3.11.3

RUN apk add --update \
        python \
        py-pip \
        py-simplejson

RUN pip install zbxsend && pip install paho-mqtt

RUN mkdir /etc/mqtt-zabbix && mkdir /usr/local/mqtt-zabbix

COPY keys.csv.example /etc/mqtt-zabbix/keys.csv
COPY mqtt-zabbix.cfg.docker /etc/mqtt-zabbix/mqtt-zabbix.cfg
COPY mqtt-zabbix.py /usr/local/mqtt-zabbix

VOLUME [ "/etc/mqtt-zabbix" ]

CMD /usr/local/mqtt-zabbix/mqtt-zabbix.py