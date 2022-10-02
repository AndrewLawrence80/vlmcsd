# Linux KMS Server

## Run with docker

``` bash
docker build -t vlmcsd .
docker run --name vlmcsd -idt -p 1688:1688 --restart=always vlmcsd
```
