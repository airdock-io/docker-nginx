# NGINX

[Nginx](http://nginx.org/) [engine x] is an HTTP and reverse proxy server, as well as a mail proxy server, written by Igor Sysoev.

Docker Image for Nginx based on airdock/base:latest.

Purpose of this image is:

- install [nginx full package](https://packages.debian.org/jessie/nginx-full)
- nginx version: 1.6.2-5 (stable)
- based on airdock/base:latest (debian)
- log nginx to stdout/stderr


> Name: airdock/nginx

***Dependencies***: airdock/base:latest

***Few links***:

- [Git Nginx](https://github.com/nginxinc)
- [Tianon](https://github.com/tianon/dockerfiles/tree/master/nginx)
- [Official Repository](https://registry.hub.docker.com/_/nginx/)


# Usage

1. You should have already install [Docker](https://www.docker.com/) and [Fig](http://www.fig.sh/) for more complex usage.
2. Download [automated build](https://registry.hub.docker.com/u/airdock/) from public [Docker Hub Registry](https://registry.hub.docker.com/):
`docker search airdock` or go directly in 3.
3. Execute:
	'docker run -t -i  airdock/nginx '


From official repository, you could retrieve this few example of usage:

### static content

'docker run --name airdock/nginx -v /some/content:/usr/share/nginx/html:ro -d nginx'

or with a Dockerfile:

```
FROM airdock/nginx:latest
COPY static-html-directory /usr/share/nginx/html
```

### complex configuration

'docker run --name airdock/nginx -v /some/nginx.conf:/etc/nginx/nginx.conf:ro -d nginx'

or with a Dockerfile:

```
FROM airdock/nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
```

# Change Log

## Tag latest (current)

- add nginx-full
- declare NGINX_VERSION

# Build

You can build an image from [Dockerfile](https://github.com/airdock-io/docker-nginx).
Install "make" utility, and execute: `make build`

In Makefile, you could retreive this *variables*:

- NAME: declare a full image name (aka airdock/nginx)
- VERSION: declare image version

And *tasks*:

- ***all***: alias to 'build'
- ***clean***: remove all container which depends on this image, and remove image previously builded
- ***build***: clean and build the current version
- ***tag_latest***: build and tag current version with ":latest"
- ***release***: execute tag_latest, push image onto registry, and tag git repository
- ***debug***: launch default command with builded image in interactive mode
- ***run***: run image as daemon and print IP address.



# License

```
 Copyright (c) 1998, 1999, 2000 Thai Open Source Software Center Ltd

 Permission is hereby granted, free of charge, to any person obtaining
 a copy of this software and associated documentation files (the
 "Software"), to deal in the Software without restriction, including
 without limitation the rights to use, copy, modify, merge, publish,
 distribute, sublicense, and/or sell copies of the Software, and to
 permit persons to whom the Software is furnished to do so, subject to
 the following conditions:

 The above copyright notice and this permission notice shall be included
 in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 ``
