DEPRECATED - Use the official newrelic docker image with appropriate volume maps.
THIS WAS A PRETTY SWEET WORK AROUND FOR A WHILE THO! ;)

Usage:

* Update the Dockerfile to point at the latest newrelic instance
* Update newrelic-coreos-monitor.service with your newrelic licence key.
* Run build.sh as root - builds the docker image and unpacks it to /opt/newrelic-coreos-monitor
* Run run.sh as root - starts the service in systemd.

#Spurious change
