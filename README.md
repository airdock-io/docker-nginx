# NGINX [![](https://images.microbadger.com/badges/image/airdock/nginx:latest.svg)](https://microbadger.com/images/airdock/nginx:latest "Get your own image badge on microbadger.com")


[Nginx](http://nginx.org/) [engine x] is an HTTP and reverse proxy server, as well as a mail proxy server, written by Igor Sysoev.

Docker Image for Nginx based on airdock/base:latest.

Purpose of this image is:

- install [nginx](https://packages.debian.org/jessie/nginx-full)
- nginx version: 1.10.2-1~jessie (stable)
- based on airdock/base:jessie
- log nginx to stdout/stderr
- use tini system


> Name: airdock/nginx


***Few links***:

- [Git Nginx](https://github.com/nginxinc)
- [Tianon](https://github.com/tianon/dockerfiles/tree/master/nginx)
- [Official Repository](https://registry.hub.docker.com/_/nginx/)


# Usage

You should have already install [Docker](https://www.docker.com/).

Execute:

		docker run -d -p 80:80 -p 443:443 --name nginx airdock/nginx

Notes:

- to customize configuration add your conf file under /etc/nginx/conf.d
- to enable site add/remove configuration under /etc/nginx/sites-enabled

From official repository, you could retrieve this few example of usage:

### static content from an external volume


	'docker run -v /some/content:/var/www/html:ro -d -p 80:80 -p 443:443 --name nginx  airdock/nginx '


The user www-data (uid 33) in your container should be known into your host. As it is a standard user, it should be erver present.
See :
* [How Managing user in docker container ?](https://github.com/airdock-io/docker-base/wiki/How-Managing-user-in-docker-container)
* [Common User List](https://github.com/airdock-io/docker-base/wiki/Common-User-List)


If 'www-data' user is not present, you should create it with this uid:gid:

```
  sudo groupadd www-data -g 33
  sudo useradd -u 33  --no-create-home --system --no-user-group www-data
  sudo usermod -g www-data www-data
```

And then set owner and permissions on your host directory:

```
	chown -R www-data:www-data /some/content
```
Don't forget to add your current user to this new group.

### static content in image


With a Dockerfile:

```
FROM airdock/nginx:latest
COPY static-html-directory /var/www/html
```

### complex configuration

'docker run  -v /some/nginx.conf:/etc/nginx/nginx.conf:ro -d -p 80:80 -p 443:443 --name nginx  airdock/nginx'

or with a Dockerfile:

```
FROM airdock/nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
```

# Change Log

## 2016/12/21
- remove nginx-full to ngnix
- use ngnix version 1.10.2-1~jessie

## before

- add nginx-full
- declare NGINX_VERSION, NGINX_USER (www-data)
- fix launch deamon process
- expose 80 and 443
- redirect default log to docker collector
- add volume on log folder (/var/log/nginx) and default static html files (/var/www/html)
- MIT license

# Build


- Install "make" utility, and execute: `make build`
- Or execute: 'docker build -t airdock/ngnix:latest --rm .'

See [Docker Project Tree](https://github.com/airdock-io/docker-base/wiki/Docker-Project-Tree) for more details.


# MIT License

```
The MIT License (MIT)

Copyright (c) 2015 Airdock.io

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
