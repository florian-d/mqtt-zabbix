SUMMARY
=======

A small daemon to listen for particular MQTT messages, and relay them to a Zabbix server

INSTALL DEPENDENCES
=======

```
sudo apt-get install python-mosquitto git python-pip python-simplejson
sudo pip install zbxsend
```
# Alternatively this...
```
git clone https://github.com/pistolero/zbxsend /tmp/zbxsend
cd /tmp/zbxsend
sudo python setup.py install
```

# Install MQTT Zabbix
```
mkdir /etc/mqtt-zabbix/
git clone git://github.com/lfsousa/mqtt-zabbix.git /usr/local/mqtt-zabbix/
cp /usr/local/mqtt-zabbix/mqtt-zabbix.cfg.example /etc/mqtt-zabbix/mqtt-zabbix.cfg
cp /usr/local/mqtt-zabbix/mqtt-zabbix.init /etc/init.d/mqtt-zabbix
update-rc.d mqtt-zabbix defaults
cp /usr/local/mqtt-zabbix/mqtt-zabbix.default /etc/default/mqtt-zabbix
## Edit /etc/default/mqtt-zabbix, /etc/mqtt-zabbix/mqtt-zabbix.cfg to suit
cp /usr/local/mqtt-zabbix/keys.csv.example /etc/mqtt-zabbix/keys.csv
## Edit /etc/mqtt-zabbix/keys.csv to suit. Be sure to avoid spaces, and keep it as one key per topic
/etc/init.d/mqtt-zabbix start
```

CONFIGURE
=========

Configuration is stored in /etc/mqtt-zabbix/mqtt-zabbix.cfg

Message topics are mapped to Zabbix key names, and are stored in /etc/mqtt-zabbix/keys.csv
When setting up a Zabbix item, ensure you use item type of Zabbix trapper, and check the "Type of information" field is defined correctly. MQTT can transport all sorts of information, and will happily try to deliver a string to your integer data type!
zbx_mqtt_template.xml is an example Zabbix template

# Docker

You can run mqtt-zabbix via docker:

Place your own config files (```mqtt-zabbix.cfg```, ```keys.csv```) into _yourconfigfolder_ 
before running this container. 

Start mqtt-zabbix via: 
```
docker run -v <yourconfigfolder>:/etc/mqtt-zabbix flodinet/mqtt-zabbix
```
