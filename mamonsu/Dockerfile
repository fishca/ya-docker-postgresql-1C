FROM python:3

RUN pip install mamonsu

ADD agent.conf /etc/mamonsu/

RUN ls -al /etc/mamonsu/

COPY mamonsu-entrypoint.sh /

COPY init-start.sh /

ENTRYPOINT ["/mamonsu-entrypoint.sh"]


# CMD ["mamonsu", "-c /etc/mamonsu/agent.conf"]
# CMD ["mamonsu"]
# ENTRYPOINT ["mamonsu"]

# CMD ["-c /etc/mamonsu/agent.conf"]