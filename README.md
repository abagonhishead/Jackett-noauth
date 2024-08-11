# Jackett-noauth
# IMPORTANT
### This is a fork of [Jackett/Jackett](https://github.com/Jackett/Jackett) that disables cookie authentication. 

### It is designed to be operated in a container without any UI access and with no inbound connections from the Internet, e.g. as an API to be called by other APIs.

## __Do not use it if you do not know what you are doing. Opening it up to the Internet is insecure.__

# Why
By default, calling the non-Torznab APIs from an external consumer is difficult because of the way Microsoft's cookie authentication works. This container fixes that by disabling cookie authentication. This means the UI has no authentication by default.

Torznab APIs should be unaffected and will still require an API key.

___

# Using it

This fork only supports Docker on Linux. Docker images can be found [here](https://hub.docker.com/r/abagonhishead/jackett-noauth) or by running `docker pull abagonhishead/jackett-noauth:latest`.

Currently only an amd64 build is provided, but arm64/armv7 support will be added in the near future (if .NET 8 supports building Jackett against them.)

If you want to build & run the image yourself, basic scripts are provided at `docker-run.sh` and `docker-run.ps1` in the repo, depending on your shell of choice.
