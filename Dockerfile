FROM registry.access.redhat.com/ubi8/ubi-minimal
RUN groupadd --gid 1001 --system jboss && useradd --uid 1001 --system -g jboss --home-dir /home/jboss jboss
WORKDIR /home/jboss
RUN chmod -R jboss:jboss /home/jboss

USER 1001
CMD ["/bin/bash", "-c", "sleep infinity"]
# CMD ["/bin/bash", "-c", "--", "while true; do sleep 30; done;"]
