FROM quay.io/pires/docker-elasticsearch:5.2.2_2

MAINTAINER team@frontapp.com

# Install Elasticsearch plug-ins.
RUN /elasticsearch/bin/elasticsearch-plugin install cloud-azure --verbose
RUN /elasticsearch/bin/elasticsearch-plugin install analysis-icu --verbose
RUN /elasticsearch/bin/elasticsearch-plugin install analysis-kuromoji --verbose
RUN /elasticsearch/bin/elasticsearch-plugin install lmenezes/elasticsearch-kopf/2.1.2 --verbose

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery
