FROM alpine:3.8
RUN apk add --update --no-cache git python2 py-pip \
&& pip install --no-cache-dir ply

RUN git clone https://github.com/cesar-rodriguez/terrascan.git /opt/terrascan
WORKDIR /opt/terrascan
RUN python setup.py install
WORKDIR /usr/src
ENTRYPOINT ["/usr/bin/terrascan", "-l", "."]
