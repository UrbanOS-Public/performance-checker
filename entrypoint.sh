#!/bin/bash
input="inputs.txt"
while IFS= read -r line || [ -n "$line" ];
do
    read -r -a inputs <<< $line
    url_to_test="${inputs[0]}"
    num_reqs="${inputs[1]}"
    pushgateway_url="${inputs[2]}"
    app_name="${inputs[3]}"
    label="${inputs[4]}"
    echo "Running check against: $url"
    . run-perf-check.sh $url_to_test $num_reqs $pushgateway_url $job_name $label
    echo ""
done < "$input"