# PHP 8.3.36 fixes CVE-2026-109618 and CVE-2026-109619 (php2shell). Pinned by
# digest so a stale cached tag can't bring back an unfixed build.
FROM php:8.3.36-apache@sha256:756c2884677bedea30afaa95811b42cd3ff251203291c5820c1ad209e86c9fb4

# Session upload progress is one known route to CVE-2026-109619; this app
# doesn't use it. Set in php.ini so it applies before a request is parsed.
COPY php/zz-hardening.ini /usr/local/etc/php/conf.d/zz-hardening.ini

COPY /src /var/www/html/

EXPOSE 80
