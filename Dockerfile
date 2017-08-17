FROM quay.io/pires/docker-elasticsearch:5.5.1

MAINTAINER team@frontapp.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery

# Plugins to install on launch
ENV ES_PLUGINS_INSTALL "repository-azure,analysis-icu,analysis-kuromoji"