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

You should have already install [Docker](https://www.docker.com/) and [Fig](http://www.fig.sh/) for more complex usage.
Download [automated build](https://registry.hub.docker.com/u/airdock/) from public [Docker Hub Registry](https://registry.hub.docker.com/):
`docker search airdock`.

Execute:

		docker run -d -p 80:80 -p 443:443 --name nginx airdock/nginx



Notes:

- to customize configuration add your conf file under /etc/nginx/conf.d
- to enable site add/remove configuration under /etc/nginx/sites-enabled

From official repository, you could retrieve this few example of usage:

### static content from an external volume


	'docker run -v /some/content:/var/www/html:ro -d -p 80:80 -p 443:443 --name nginx  airdock/nginx '


The user www-data (uid 33) in your container should be known into your host. As it is a standard user, it should be erver present.
See [How Managing user in docker container](https://github.com/airdock-io/docker-base/blob/master/README.md#how-managing-user-in-docker-container) and  [Common User List](https://github.com/airdock-io/docker-base/blob/master/CommonUserList.md).

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

## Tag latest (current)

- add nginx-full
- declare NGINX_VERSION, NGINX_USER (www-data)
- fix launch deamon process
- expose 80 and 443
- redirect default log to docker collector
- add volume on log folder (/var/log/nginx) and default static html files (/var/www/html)

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
