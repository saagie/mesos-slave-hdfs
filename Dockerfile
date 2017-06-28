FROM saagie/mesos-slave-dind:0.3.0_mesos-1.1.01_docker-17.03.1_ubuntu-14.04.4

# Install CDH repository
RUN curl "http://archive.cloudera.com/cdh5/one-click-install/trusty/amd64/cdh5-repository_1.0_all.deb" > ~/cdh5-repository.deb &&\
    dpkg -i ~/cdh5-repository.deb &&\
    rm ~/cdh5-repository.deb

# Install packages
RUN apt-get update &&\
    apt-get install -y\
        avro-libs\
        bigtop-jsvc\
        bigtop-utils\
        hadoop\
        hadoop-0.20-mapreduce\
        hadoop-client\
        hadoop-hdfs\
        hadoop-mapreduce\
        hadoop-yarn\
        parquet\
        parquet-format\
        psmisc &&\
    apt-get autoremove -y --purge

# Create volumes
VOLUME ["/data"]
