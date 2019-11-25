FROM alpine:3.7 as base

RUN apk add --no-cache --upgrade curl


RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

RUN adduser kubectl -D

USER kubectl


WORKDIR /home/kubectl
COPY --chown=kubectl:777 make_credentials.sh make_credentials.sh
RUN chmod +x make_credentials.sh

CMD [ "sh", "make_credentials.sh" ]