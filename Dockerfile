FROM   debian:stretch-slim    
ENV LANG zh_CN.UTF-8
RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone
ADD ./alertmanager-0.20.0.linux-amd64.tar.gz  /opt
RUN mv /opt/alertmanager-0.20.0.linux-amd64 /opt/alertmanager && rm -rf /opt/alertmanager/alertmanager.yml && mkdir /opt/alertmanager/temples
COPY ./alertmanager.yml.temp          /opt/alertmanager/temples
COPY ./start.sh  /start.sh

CMD ["/start.sh", "run" ]
