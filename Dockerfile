FROM hub.woody.vip/library/archlinux-r-bookdown:latest as builder
COPY . .
ARG no_woody
ENV NO_WOODY=$no_woody
RUN /bin/sh _build.sh && mv _book /public

FROM hub.woody.vip/library/nginx:1.19.8-alpine
COPY --from=builder /public /usr/share/nginx/html/
EXPOSE 80