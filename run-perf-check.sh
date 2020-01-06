#!/bin/bash
url_to_test=$1
num_reqs=$2
pushgateway_url=$3
job_name=$4
label=$5

total_time=0
for i in $(seq $num_reqs)
do
    ret=$(curl -o /dev/null -s -w '%{time_total}' $url_to_test)
    total_time=$total_time+$ret
done
avg=$(echo "($total_time)/$num_reqs" | bc -l)

# push to prometheus
echo "avg_request_time{label=\"$label\"} $avg" | curl -s --data-binary @- $pushgateway_url/metrics/job/$job_name/
echo "avg_request_time{label=\"$label\"} $avg" 
 