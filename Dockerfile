FROM debian:wheezy

MAINTAINER Thomas B Homburg <thomas@homburg.dk>

# Using instructions from https://devopsu.com/guides/ansible-ubuntu-debian.html
RUN apt-get update
RUN apt-get -qy install python-pip python-dev git
RUN pip install PyYAML jinja2 paramiko

# Clone and install ansible
WORKDIR /root/
RUN git clone https://github.com/ansible/ansible.git
WORKDIR /root/ansible
RUN git checkout release1.5.4
RUN make install

# Cleanup
WORKDIR /root/
RUN rm -rf ansible

# RUN mkdir /etc/ansible
# RUN cp ~/ansible/examples/hosts /etc/ansible/

