FROM ubuntu:20.04

ARG PACKAGE=http://dl1.technet24.ir/Downloads/Software/Cisco/AnyConnect/anyconnect-linux64-4.8.03052-predeploy-k9.tar.gz

RUN apt-get update && apt-get install -y wget kmod libxml2 iputils-ping dante-server

RUN wget -q --show-progress --progress=bar:force -O anyconnect.tar.gz $PACKAGE

RUN mkdir anyconnect && \
    tar xzf anyconnect.tar.gz -C anyconnect --strip-components 1 && \
    cd anyconnect/vpn && \
    rm license.txt && \
    ./vpn_install.sh && \
    rm -rf /opt/.cisco/certificates/ca && \
    ln -s /etc/ssl/certs /opt/.cisco/certificates/ca && \
    cd ../.. && \
    rm -rf anyconnect anyconnect.tar.gz

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]