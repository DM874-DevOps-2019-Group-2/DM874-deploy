FROM alpine:3.7 as kubectl

RUN apk update && apk add --no-cache --upgrade curl ca-certificates

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

RUN apk del curl

RUN adduser kubectl -D

USER kubectl


WORKDIR /home/kubectl
COPY --chown=kubectl:kubectl make_credentials.sh make_credentials.sh
COPY --chown=kubectl:kubectl set_container.sh set_container.sh

RUN chmod +x make_credentials.sh
RUN chmod +x set_container.sh

CMD ["sh", "-c", "./make_credentials.sh && ./set_container.sh"]
