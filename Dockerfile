FROM ubuntu:18.04

EXPOSE 18334

RUN apt-get update

RUN apt-get -y install wget

WORKDIR /usr/src

RUN wget https://github.com/Bitcoin-ABC/bitcoin-abc/releases/download/v0.21.0/bitcoin-abc-0.21.0-x86_64-linux-gnu.tar.gz
RUN tar -xzvf bitcoin-abc-0.21.0-x86_64-linux-gnu.tar.gz
RUN chmod +x bitcoin-abc-0.21.0/bin/bitcoind bitcoin-abc-0.21.0/bin/bitcoin-cli
RUN ln -s /usr/src/bitcoin-abc-0.21.0/bin/bitcoind /usr/bin/bitcoind
RUN ln -s /usr/src/bitcoin-abc-0.21.0/bin/bitcoin-cli /usr/bin/bitcoin-cli

ADD init-node.sh /tmp
RUN chmod 777 /tmp/init-node.sh

CMD /tmp/init-node.sh
