# Jackett-noauth
# IMPORTANT
### This is a fork of [Jackett/Jackett](https://github.com/Jackett/Jackett) that disables cookie authentication. It is designed to be operated in a container, isolated from any inbound connections beyond its local environment (e.g. an nginx reverse proxy,) so that discrete services can call its APIs and proxy the results to an external consumer. 

## __Do not use it if you do not know what you are doing.__

Linux amd64 docker images can be found [here](https://hub.docker.com/r/abagonhishead/jackett-noauth).

TODO: arm64/armv7/armv6?
