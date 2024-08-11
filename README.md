# Jackett-noauth
# IMPORTANT
### This is a fork of [Jackett/Jackett](https://github.com/Jackett/Jackett) that disables cookie authentication. 

### It is designed to be operated in a container with no inbound connections from the Internet, e.g. as an API to be called by other APIs.

## __Do not use it if you do not know what you are doing. Opening it up to the Internet is insecure.__

Linux amd64 docker images can be found [here](https://hub.docker.com/r/abagonhishead/jackett-noauth) or by running `docker pull abagonhishead/jackett-noauth:latest`.

TODO: arm64/armv7/armv6?
