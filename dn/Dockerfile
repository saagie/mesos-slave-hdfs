FROM saagie/mesos-slave-dind:0.3.0_mesos-1.1.01_docker-17.03.1_ubuntu-14.04.4

ENV NAMENODE_IP 0.0.0.0

# Install tools
RUN apt-get install -y wget

# Install CDH repository
RUN wget\
    -O ~/cdh-repository.deb\
    "http://archive.cloudera.com/cdh5/one-click-install/trusty/amd64/cdh5-repository_1.0_all.deb"
RUN dpkg -i ~/cdh-repository.deb

# Upgrade packages
RUN apt-get update
RUN apt-get autoremove -y --purge
RUN apt-get upgrade -y

# Install YARN
RUN apt-get install -y hadoop-yarn-nodemanager

# Install HDFS
RUN apt-get install -y hadoop-hdfs-datanode

# Copy configuration files
COPY ./hdfs-site.xml /root/hdfs-site.xml
COPY ./mapred-site.xml /root/mapred-site.xml

# Create volumes
VOLUME ["/data"]

# Start
COPY ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
ENTRYPOINT ["wrapdocker"]
