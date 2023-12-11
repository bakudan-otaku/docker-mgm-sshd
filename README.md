# docker-mgm-sshd
A simple docker container to manage docker via sshd

## WARNING:
you will set a root password via env var, to my knowlage this is not save!
Also only use that if you somewhat know what you are doing.

## how to run:
```bash
docker build -t docker-mgm-sshd:latest .
docker run -v /var/run/docker.sock:/var/run/docker.sock -p 2222:22 -e "root_pw=blub123" docker-mgm-sshd
```

## how to use:
connect to the host with any ssh client, on port 2222 and now you can use the docker cli.
