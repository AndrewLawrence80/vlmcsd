FROM alpine

RUN mkdir /app

WORKDIR /app

COPY . /app

RUN apk add --no-cache build-base make && \
    cd vlmcsd && \
    make && \
    mv bin/vlmcsd /usr/local/bin && \
    mv bin/vlmcs /usr/local/bin && \
    apk del build-base make && \
    rm -rf /tmp/* && \
    rm -rf /app/*

EXPOSE 1688

CMD ["/usr/local/bin/vlmcsd", "-D","-d"]
