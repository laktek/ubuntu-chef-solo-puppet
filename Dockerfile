FROM nitrousio/ubuntu:trusty
MAINTAINER Nitrous.IO <hello@nitrous.io>

RUN curl -L https://www.opscode.com/chef/install.sh | bash && \
    echo 'gem: --no-ri --no-rdoc' > ~/.gemrc

# Install berkshelf
# See https://github.com/opscode/dep-selector-libgecode/issues/15
RUN USE_SYSTEM_GECODE=1 /opt/chef/embedded/bin/gem install berkshelf

# Clean up
RUN rm -rf /tmp/* /var/tmp/*
