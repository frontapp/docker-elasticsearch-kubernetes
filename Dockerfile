FROM quay.io/pires/docker-elasticsearch:2.3.4

MAINTAINER team@frontapp.com

# Override elasticsearch.yml config, otherwise plug-in install will fail.
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins.
RUN /elasticsearch/bin/plugin install cloud-azure --verbose
RUN /elasticsearch/bin/plugin install analysis-icu --verbose
RUN /elasticsearch/bin/plugin install analysis-kuromoji --verbose
RUN /elasticsearch/bin/plugin install io.fabric8/elasticsearch-cloud-kubernetes/2.3.4 --verbose
RUN /elasticsearch/bin/plugin install lmenezes/elasticsearch-kopf/2.1.2 --verbose

# Override elasticsearch.yml config, otherwise plug-in install will fail.
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Copy run script
COPY run.sh /
