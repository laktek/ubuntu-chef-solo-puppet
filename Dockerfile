FROM nitrousio/ubuntu:trusty
MAINTAINER Nitrous.IO <hello@nitrous.io>

RUN wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb -O /tmp/puppetlabs-release-trusty.deb && \
  dpkg -i /tmp/puppetlabs-release-trusty.deb && \
  apt-get -y update && \
  apt-get -y install puppet

RUN curl -L https://www.opscode.com/chef/install.sh | bash && \
    echo 'gem: --no-ri --no-rdoc' > ~/.gemrc

# Install berkshelf
RUN /opt/chef/embedded/bin/gem install berkshelf

# Clean up
RUN rm -rf /tmp/* /var/tmp/*
