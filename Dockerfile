# Newrelic in a busybox container, what a lovely small service mode container.

FROM progrium/busybox

# Newrelic daemon in the foreground, logging to stdout using the config file in etc/newrelic - put this in a start.sh
CMD '/start.sh'

ADD http://download.newrelic.com/server_monitor/archive/2.0.2.111/newrelic-sysmond-2.0.2.111-linux.tar.gz /tmp/newrelic-sysmond.tar.gz
RUN gunzip /tmp/newrelic-sysmond.tar.gz && \
    mkdir /tmp/newrelic && \
    tar xf /tmp/newrelic-sysmond.tar -C /tmp/newrelic && \ 
    /bin/ash -c '[ ! -d /etc/newrelic ] && mkdir -p /etc/newrelic' && \
    /bin/ash -c '[ ! -d /usr/local/sbin ] && mkdir -p /usr/local/sbin' && \
    cp /tmp/newrelic/*/daemon/nrsysmond.x64 /usr/local/sbin/nrsysmond && \
    cp /tmp/newrelic/*/scripts/nrsysmond-config /usr/local/sbin/nrsysmond-config && \
    cp /tmp/newrelic/*/nrsysmond.cfg /etc/newrelic/nrsysmond.cfg
ADD start.sh /start.sh
RUN chmod +x /start.sh
