FROM jenkins/inbound-agent:jdk11

USER root

# Install Python 3 and pip
RUN apt-get update \
    && apt-get install -y python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip3 install --upgrade pip

# Install any additional Python packages as needed
#RUN pip3 install <package1>

USER jenkins

