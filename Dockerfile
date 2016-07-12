FROM quay.io/pires/docker-elasticsearch:2.3.3

MAINTAINER pjpires@gmail.com

# Override elasticsearch.yml config, otherwise plug-in install will fail.
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins.
RUN /elasticsearch/bin/plugin install io.fabric8/elasticsearch-cloud-kubernetes/2.3.3 --verbose
RUN /elasticsearch/bin/plugin install lmenezes/elasticsearch-kopf/1.6.2 --verbose

# Override elasticsearch.yml config, otherwise plug-in install will fail.
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Environment.
ENV ES_HEAP_SIZE=4g

# Copy run script
COPY run.sh /
