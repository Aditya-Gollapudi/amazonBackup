FROM golang
COPY opentelemetry-collector-contrib opentelemetry-collector-contrib
RUN cd opentelemetry-collector-contrib
RUN apt-get update && apt-get install make
WORKDIR opentelemetry-collector-contrib
RUN echo Makefile
RUN make otel-from-tree
RUN go env -w GOPROXY=direct 
RUN make otelcontribcol