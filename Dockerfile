FROM hub.woody.vip/library/archlinux-r-bookdown:latest as builder
COPY . .
ARG no_woody
ARG hardware
ARG software

ENV NO_WOODY=$no_woody
ENV HARDWARE=$hardware
ENV SOFTWARE=$software

RUN /bin/sh _build.sh && mv _book /public

FROM hub.woody.vip/library/nginx:1.19.8-alpine
COPY ./nginx.conf /etc/nginx/conf.d/defalt.conf
COPY --from=builder /public /usr/share/nginx/html/
EXPOSE 80