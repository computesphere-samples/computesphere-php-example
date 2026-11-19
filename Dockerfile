# PHP 8.3.37 carries the 2026-11-19 security release (8.3.36 already fixed
# CVE-2026-109618 and CVE-2026-109619, php2shell). Pinned by digest so a stale
# cached tag can't bring back an unfixed build.
FROM php:8.3.37-apache@sha256:d4f00722506a635884245b042cf6f8d54e065a9fc73aa0f59e9126b628166ed5

# Session upload progress is one known route to CVE-2026-109619; this app
# doesn't use it. Set in php.ini so it applies before a request is parsed.
COPY php/zz-hardening.ini /usr/local/etc/php/conf.d/zz-hardening.ini

COPY /src /var/www/html/

EXPOSE 80
