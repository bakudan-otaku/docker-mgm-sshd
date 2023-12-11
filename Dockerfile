FROM docker:cli

RUN apk add --no-cache \
    openssh-client \
    openssh-server \
    tini \
    ca-certificates \
    bash \
    bash-completion

COPY etc/ /etc/
COPY usr/ /usr/
COPY run.sh /

ADD --chown=root:root --chmod=644 https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker /usr/share/bash-completion/completions/docker

ENV root_pw=test123

RUN mkdir -p /etc/ssh /root/.ssh && \
    chmod 0700 /root/.ssh && \
    mv /etc/profile.d/color_prompt.sh.disabled /etc/profile.d/color_prompt.sh && \
    sed -i "s:/bin/ash:/bin/bash:g" /etc/passwd

CMD ["/run.sh"]

    