# Place in docker container, use jenkins, or jenkins controlled docker container...

# Base image
#FROM jenkins/jenkins:lts-jdk11
FROM jenkins/jenkins:latest

# installing jenkins coniguration as code
#COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
#RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# applying configuration as code
#COPY jenkins.yaml /var/jenkins_home/jenkins.yaml
# this should be personalized per instance.

# Going god-mode
USER root

# Python 3 w/ PyYaml
RUN \
  apt update && \
  apt -y install python3 python3-pip && \
  pip3 install pyyaml

# Mountable Directories
VOLUME ["/var/jenkins_home"]

# drop back to the regular jenkins user - good practice
USER jenkins
