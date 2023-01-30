This dockerfile is used to generate the arm32 version of docker image.
If you encountere the "W: GPG error: http//deb.debian.org/debian bullseye InRelease: At least on invalid signature was encountered" error, please refer to https://github.com/debuerreotype/docker-debian-artifacts/issues/101

If you want other version of image, please make sure to replace docker-gen file and mkcert file to related version

docker-gen is https://github.com/nginx-proxy/docker-gen
mkcert is https://github.com/FiloSottile/mkcert
