# performance-checker
Docker image that uses curl to collect an average response time of each URL within a list and pushes the metric to a prometheus push gateway.

##Inputs
Requires a file to be mounted to `/inputs.txt` that contains the following information:
* Full URL to test
* Number of requests to perform
* Prometheus push gateway URL
* Application Name (job name)
* Path in URL (label value)

NOTE: None of these values can contain spaces

##Example `inputs.txt`

`https://example.com/api/v1/user/view 5 https://pushgateway.example.com my_app /api/v1/user/view`

##To run locally
```bash
docker build . -t perf-test
docker run -it --rm -v $(pwd)/inputs.txt:/inputs.txt perf-test
```