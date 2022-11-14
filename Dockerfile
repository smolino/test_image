FROM registry.access.redhat.com/ubi8/ubi-minimal
USER 1001
CMD ["/bin/bash", "-c", "sleep infinity"]
# CMD ["/bin/bash", "-c", "--", "while true; do sleep 30; done;"]
