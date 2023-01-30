FROM debian:bullseye-slim
CMD ["bash"]
LABEL maintainer=shangaijun@aliyun.com
ENV DEBUG=false 
ENV DOCKER_HOST=unix:///var/run/docker.sock
ENV CAROOT=/app/ca
WORKDIR /
COPY ["docker-gen", "/usr/local/bin/docker-gen"]
COPY ["mkcert", "/usr/local/bin/mkcert"]
COPY ["app", "/app"]
VOLUME ["/app/certs/","/app/ca/"]
WORKDIR /app/certs
RUN  apt-get update -qqy \
	&& apt-get install -qy openssl libnss3-tools ca-certificates procps jq curl --no-install-recommends \
	&& chmod +x /usr/local/bin/docker-gen /usr/local/bin/mkcert /app/* \
	&& mkdir -p /traefik \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /var/tmp/* /usr/share/doc/* /tmp/* \
	&& rm /var/log/lastlog /var/log/faillog
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/app/start.sh"]
