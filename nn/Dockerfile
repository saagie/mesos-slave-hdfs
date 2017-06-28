FROM saagie.dk/mesos-slave-dind-hdfs

# Install packages
RUN apt-get update &&\
    apt-get install -y --force-yes\
        zookeeper=3.4.5+cdh5.11.1+111-1.cdh5.11.1.p0.6~trusty-cdh5.11.1\
        zookeeper-server\
        hadoop-yarn-resourcemanager\
        hadoop-hdfs-namenode\
        hue &&\
    apt-get autoremove -y --purge &&\
    apt-get clean

# Set owner of zookeeper directory
RUN mkdir -p /var/lib/zookeeper && chown -R zookeeper. /var/lib/zookeeper

# Copy configuration files
COPY ./hdfs-site.xml /root/hdfs-site.xml
COPY ./hue.ini /etc/hue/conf/hue.ini

# Start
COPY ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
ENTRYPOINT ["wrapdocker"]
