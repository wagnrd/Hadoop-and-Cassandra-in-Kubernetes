FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    curl \
 && echo "deb http://www.apache.org/dist/cassandra/debian 36x main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list \
 && curl https://www.apache.org/dist/cassandra/KEYS | apt-key add - \
 && apt-get update \
 && apt-get install -y cassandra \
 && rm -rf /var/lib/apt/lists/*

ENV CASSANDRA_CONFIG /etc/cassandra

# 7000:	cluster communication
# 7001:	cluster communication (SSL)
# 7199: JMX
# 9042: native protocol clients (CQL)
EXPOSE 7000 7001 7199 9042

ADD start.sh /usr/bin/start.sh

ENTRYPOINT ["sh", "/usr/bin/start.sh"]
