FROM fronepi/hadoop

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]

EXPOSE 50010 50020 50075
