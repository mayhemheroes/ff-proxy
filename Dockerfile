FROM ubuntu:18.04 as base
COPY . .
RUN apt-get update -y && apt install -y libssl-dev && DEBIAN_FRONTEND=noninteractive apt-get install -y openssl && apt-get -y install gcc && apt-get install -y clang && apt-get install make

RUN make
RUN make install
RUN make fuzz
# Set to fuzz!
ENTRYPOINT []
CMD ["fuzzer"]
