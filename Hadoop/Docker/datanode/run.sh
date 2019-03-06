#!/bin/bash

datadir=`echo $HDFS_CONF_dfs_datanode_data_dir | perl -pe 's#file://##'`

$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR datanode
