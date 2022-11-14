FROM registry.access.redhat.com/ubi8/ubi-minimal
RUN microdnf install tar curl jq git shadow-utils && microdnf clean all
RUN groupadd --gid 1001 --system jboss && useradd --uid 1001 --system -g jboss --home-dir /home/jboss jboss
WORKDIR /home/jboss
RUN chown -R jboss:jboss /home/jboss \
    && chmod 664 /etc/passwd \
    && chmod 777 -R /home/jboss/
COPY uid_entrypoint /home/jboss/
RUN chmod g=u /etc/passwd && chmod 775 /home/jboss/uid_entrypoint
RUN chown -R 1001:1001 /home/jboss/ && chmod 777 -R /home/

USER jboss
WORKDIR /home/jboss
ENTRYPOINT ["/home/jboss/uid_entrypoint"]
CMD ["/bin/bash", "-c", "sleep infinity"]
# CMD ["/bin/bash", "-c", "--", "while true; do sleep 30; done;"]
