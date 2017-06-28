FROM saagie.dk/mesos-slave-dind-hdfs

ENV NAMENODE_IP 0.0.0.0

# Install packages
RUN apt-get update &&\
    apt-get install -y hadoop-yarn-nodemanager hadoop-hdfs-datanode &&\
    apt-get autoremove -y --purge &&\
    apt-get clean

# Copy configuration files
COPY ./hdfs-site.xml /root/hdfs-site.xml

# Start
COPY ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
ENTRYPOINT ["wrapdocker"]
