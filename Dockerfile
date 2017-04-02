FROM quay.io/pires/docker-elasticsearch:5.2.2_2

MAINTAINER team@frontapp.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery

# Plugins to install on launch
ENV ES_PLUGINS_INSTALL "repository-azure,analysis-icu,analysis-kuromoji,lmenezes/elasticsearch-kopf/2.1.2"