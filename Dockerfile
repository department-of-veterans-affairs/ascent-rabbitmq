FROM rabbitmq:3.7


# Change ownership and permissions
USER root



ENV TCP_PORTS "15672, 5672"
ENV RABBITMQ_ERLANG_COOKIE "ascentcookie"
ENV RABBITMQ_CONFIG_FILE /etc/rabbitmq/conf/rabbitmq
#ENV AUTOCLUSTER_TYPE consul
#ENV AUTOCLUSTER_DELAY 60
#ENV CONSUL_HOST consul
#ENV CONSUL_SVC_ADDR_AUTO true
#ENV AUTOCLUSTER_CLEANUP true
#ENV CLEANUP_WARN_ONLY false
#ENV CONSUL_DEREGISTER_AFTER 60 



WORKDIR /tmp


RUN apt-get -qq -y update

RUN apt-get -qq -y install curl

# Install consul-template to populate secret data into files on disk
RUN curl -sL -o consul-template_0.19.0_linux_amd64.tgz https://releases.hashicorp.com/consul-template/0.19.0/consul-template_0.19.0_linux_amd64.tgz; \
    tar -xzf consul-template_0.19.0_linux_amd64.tgz; \
    mv consul-template /usr/local/bin/consul-template; \
    chmod +x /usr/local/bin/consul-template; \
    rm -f consul-template_0.19.0_linux_amd64.tgz

WORKDIR /etc/rabbitmq

COPY template/ template/
COPY run-wrapper.sh run-wrapper.sh
COPY mirror-queues.sh mirror-queues.sh
COPY enabled_plugins enabled_plugins
RUN chmod 755 run-wrapper.sh mirror-queues.sh

ENTRYPOINT ["/etc/rabbitmq/run-wrapper.sh"]
EXPOSE 15672 5672 5671 15671
