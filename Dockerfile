FROM jenkins/jenkins:lts

# switch to root user to install docker
USER root

RUN apt-get update && apt-get install -y apt-transport-https \
       ca-certificates curl gnupg2 \
       software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN apt-key fingerprint 0EBFCD88

RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli

#ensures that /var/run/docker.sock exists
RUN touch /var/run/docker.sock

#changes the ownership of /var/run/docker.sock
RUN chown jenkins:jenkins /var/run/docker.sock

# switch back to jenkins
USER jenkins
