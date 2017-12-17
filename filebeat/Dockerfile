FROM docker.elastic.co/beats/filebeat:6.1.0

# COPY filebeat.yml /usr/share/filebeat/filebeat.yml
COPY config /usr/share/filebeat/

USER root

RUN chown filebeat /usr/share/filebeat/filebeat.yml
RUN chmod go-w /usr/share/filebeat/filebeat.yml

USER filebeat

ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]
CMD ["-e"]