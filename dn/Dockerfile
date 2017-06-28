FROM saagie/mesos-slave-dind:0.3.0_mesos-1.1.01_docker-17.03.1_ubuntu-14.04.4

ENV NAMENODE_IP 0.0.0.0

# Install CDH repository
RUN curl "http://archive.cloudera.com/cdh5/one-click-install/trusty/amd64/cdh5-repository_1.0_all.deb" > ~/cdh5-repository.deb &&\
    dpkg -i ~/cdh5-repository.deb &&\
    rm ~/cdh5-repository.deb

# Install packages
RUN apt-get update &&\
    apt-get install -y hadoop-yarn-nodemanager hadoop-hdfs-datanode &&\
    apt-get autoremove -y --purge

# Copy configuration files
COPY ./hdfs-site.xml /root/hdfs-site.xml
COPY ./mapred-site.xml /root/mapred-site.xml

# Create volumes
VOLUME ["/data"]

# Start
COPY ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
ENTRYPOINT ["wrapdocker"]
