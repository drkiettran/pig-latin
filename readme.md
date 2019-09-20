# Instruction

Sample pig scripts for CISC 525 @ Harrisburg U.

Make sure you copy shakespeare files into this folder `/user/student/shakespeare`

To get inside the namenode container:

```sh

docker exec -it namenode bash
```

When run inside namenode container, make sure to run these commands:

```bash
./mr-jobhistory-daemon.sh start historyserver
cd /cisc525/pig-latin/
/cisc525/pig-0.17.0/bin/pig word_count.pig

```

## cat the result

```bash

hdfs dfs -cat /tmp/flights_by_carriers/part-r-00000

```

## delete output folder

```bash

hdfs dfs -rm -R /tmp/flights_by_carriers
hdfs dfs -rm -R /tmp/toalmiles
```
