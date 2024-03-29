# Fermilab Rucio Deployment Automatic Transfer Testing Docker Image Specification
#
# Author:
# - Brandon White, <bjwhite@fnal.gov>, 2021

FROM rucio/rucio-clients

ADD ./run_test.sh /run_test.sh
ADD ./run_transfer_test.py /run_transfer_test.py
ADD ./rucio.cfg /opt/rucio/etc/rucio.cfg
RUN pip3 install stomp.py remote-pdb

USER 1000
# Make sure this isn't a VOMS proxy. RabbitMQ can't do TLS termination of VOMS proxies as it doesn't have a
#   mod_gridsite equivalent.
ADD ./x509up_u51660 /opt/rucio/etc/proxy

ENTRYPOINT ["/run_test.sh"]
