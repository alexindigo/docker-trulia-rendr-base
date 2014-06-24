# Rendr app base container
#
# Run container by executing following command:
# $ docker run -t -i -v $(pwd):/www -p 3030:3030 -p 5858:5858 alexindigo/trulia-rendr-base <command>
#
# alexindigo/rendr-base
FROM      alexindigo/node-dev
MAINTAINER Alex Indigo <iam@alexindigo.com>

# Make DEBIAN_FRONTEND less chatty
ENV DEBIAN_FRONTEND noninteractive

# Install external services
# - Sass needs rubygems
RUN       apt-get update && apt-get install -y rubygems

# Install ruby deps
RUN       gem install sass

# Install global npm packages
RUN       npm -q install -g grunt-cli

# Create workspace
# And bind it to the site folder at runtime
VOLUME    ["/www"]
WORKDIR   /www

# Open ports
EXPOSE    3030
EXPOSE    5858

# Reset DEBIAN_FRONTEND
ENV DEBIAN_FRONTEND newt
