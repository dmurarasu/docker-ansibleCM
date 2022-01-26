FROM ubuntu:20.04
RUN addgroup -gid 9999 ansible && \
    adduser --uid 9999 --gid 9999 ansible
LABEL author="DanM loves you" \
  maintainer="dan@tequila.quark"
RUN echo "===> Install packages ..."
COPY apt-install.sh /tmp/apt-install.sh
COPY requirements-apt.txt /tmp/requirements-apt.txt
RUN bash /tmp/apt-install.sh
RUN printf "# Allow members of group ansible to execute any command without password \n%%ansible   ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/ansible
RUN usermod -aG sudo ansible
RUN echo "===> Install Ansible (Core & Collections) & dependency Python packages ..."
COPY requirements.txt /tmp/requirements.txt
COPY requirements.yml /tmp/requirements.yml
RUN pip3 install --upgrade -r /tmp/requirements.txt  && \
     ansible-galaxy collection install -r /tmp/requirements.yml
RUN echo "===> Clean up ..."
RUN apt clean && \
      rm -rf /tmp/*
WORKDIR /ansible
