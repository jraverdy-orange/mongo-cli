FROM alpine:latest
RUN  apk add --no-cache --update  jq mongodb python py-pip openssh iptables
RUN  pip install sshuttle
RUN  find / -name 'mongo*' ! -name 'mongo' -print | xargs -i rm -rf {} 
RUN apk --purge -v del py-pip
