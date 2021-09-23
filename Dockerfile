# Example of Rucio Event Monitoring
#
# Author:
# - Brandon White, <bjwhite@fnal.gov>, 2021

FROM rucio/rucio-clients

ADD ./run_transfer_test.sh /run_transfer_test.sh
ADD ./listen_for_event.py /listen_for_event.py
ADD ./rucio.cfg /opt/rucio/etc/rucio.cfg
RUN pip3 install stomp.py

USER 1000
ADD ./x509up_u51660 /opt/rucio/etc/proxy

ENTRYPOINT ["/run_transfer_test.sh"]