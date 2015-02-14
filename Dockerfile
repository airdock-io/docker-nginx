# VERSION 1.0
# AUTHOR:         Jerome Guibert <jguibert@gmail.com>
# DESCRIPTION:    Ngnix docker Image
# TO_BUILD:       docker build --rm -t airdock/nginx .
# SOURCE:         https://github.com/airdock-io/docker-nginx

# Pull base image.
FROM airdock/base:latest

MAINTAINER Jerome Guibert <jguibert@gmail.com>

# Version
ENV NGINX_VERSION=1.6.2

# install nginx full
# forward request and error logs to docker log collector
# prevent backgrounding for Docker
RUN curl http://nginx.org/keys/nginx_signing.key | apt-key add - && \
	echo 'deb http://nginx.org/packages/debian/ wheezy nginx' > /etc/apt/sources.list.d/nginx.list && \
	apt-get update -qq && \
	apt-get install -y nginx-full && \
	apt-get clean -qq && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
	echo '\n# prevent backgrounding (for Docker)\ndaemon off;' >> /etc/nginx/nginx.conf && \
	rm -rf /var/lib/apt/lists/* /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# declare volume
VOLUME ["/var/cache/nginx"]

# expose standard port
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
