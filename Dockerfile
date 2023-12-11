FROM docker:cli

RUN apk add --no-cache \
    openssh-client \
    openssh-server \
    tini \
    ca-certificates

COPY etc/ /etc/
COPY usr/ /usr/
COPY run.sh /

ENV root_pw=test123

RUN mkdir -p /etc/ssh /root/.ssh && chmod 0700 /root/.ssh

CMD ["/run.sh"]

    