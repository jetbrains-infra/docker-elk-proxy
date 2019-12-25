FROM nginx:stable-alpine

LABEL maintainer="Andrey Sizov, andrey.sizov@jetbrains.com"
LABEL image.Version="dev"

ARG CONTAINER_VERSION=dev

ENV CONTAINER_VERSION ${CONTAINER_VERSION}
ENV ROUTE_RULES ""

ADD entrypoint.sh /entrypoint.sh
ADD nginx /etc/nginx

EXPOSE 80

CMD ["nginx"]
ENTRYPOINT ["/entrypoint.sh"]