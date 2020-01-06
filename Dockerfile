FROM alpine:3.11

RUN apk add --no-cache curl
COPY run-perf-check.sh /
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN chmod +x /run-perf-check.sh

CMD . entrypoint.sh 
#CMD . run-perf-checks.sh https://data.dev.internal.smartcolumbusos.com/api/v1/dataset/search 5 https://pushgateway.dev.internal.smartcolumbusos.com discovery_api /api/v1/dataset/search
# RUN . run-perf-checks.sh https://data.dev.internal.smartcolumbusos.com/api/v1/dataset/search 5 https://pushgateway.dev.internal.smartcolumbusos.com discovery_api /api/v1/dataset/search
