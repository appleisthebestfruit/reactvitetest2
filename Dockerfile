FROM jenkins/jenkins:lts

USER root

# Install Docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

RUN apt-get update && apt-get install -y nodejs npm

# # Install Node.js
# RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs


RUN node -v && npm -v

# Install desired Jenkins plugins
RUN jenkins-plugin-cli --plugins docker-workflow:1.26 job-dsl:1.77 git

# Ensure the docker group exists and add Jenkins user to it
RUN if getent group docker; then echo "Group docker exists"; else groupadd -g 999 docker; fi && \
    usermod -aG docker jenkins

USER jenkins
RUN chown -R jenkins:jenkins /app