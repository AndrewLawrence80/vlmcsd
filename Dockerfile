FROM debian

RUN mkdir /app

WORKDIR /app

COPY . /app

RUN apt update && apt install gcc make -y && \
    cd vlmcsd && \
    make && \
    mv bin/vlmcsd /usr/local/bin && \
    mv bin/vlmcs /usr/local/bin && \
    apt autoremove gcc make -y && apt purge gcc make -y && apt clean && \
    rm -rf /tmp/* && \
    rm -rf /app/*

EXPOSE 1688

CMD ["/usr/local/bin/vlmcsd", "-D","-d"]
