# Place in docker container, use jenkins, or jenkins controlled docker container...

# Base image
FROM jenkins/jenkins:lts
# Going god-mode
USER root

# Dependancies
#  apt -y upgrade && \
RUN \
  apt update && \
  apt -y install python3 python3-pip && \
  pip --yes install pyyaml

# Mountable Directories
VOLUME ["/var/jenkins_home", "/srv/masters", "/srv/plex"]

# Copy script into place
COPY loadplexdata.py /usr/local/bin/loadplexdata.py
COPY convertMovies.yml /etc/loadplexdata/convertMovies.yml
COPY convertTV.yml /etc/loadplexdata/convertTV.yml

# drop back to the regular jenkins user - good practice
USER jenkins
