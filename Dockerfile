FROM debian:bullseye-slim

ARG WEBSVN_VERSION
ARG WEBSVN_REFS

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    supervisor curl ca-certificates \
    subversion php php-fpm php-xml php-geshi php-mbstring php-pear \
    nkf \
    nginx-light \
 && apt-get -y clean \
 && pear Archive_Tar \
 && pear Text_Diff \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /var/www/html \
 && curl -L https://github.com/websvnphp/websvn/archive/refs/${WEBSVN_REFS}/${WEBSVN_VERSION}.tar.gz -o /tmp/websvn.tar.gz \
 && tar xzf /tmp/websvn.tar.gz -C /tmp/ \
 && cp -r /tmp/websvn-${WEBSVN_VERSION}/* /var/www/html \
 && rm -rf /tmp/websvn.tar.gz /tmp/websvn-${WEBSVN_VERSION} \
 && mkdir /run/php -p \
 && mkdir /usr/local/bin/websvn \
 && ln -s /usr/bin/svnadmin /usr/local/bin/websvn/ \
 && ln -s /usr/bin/svnauthz /usr/local/bin/websvn/ \
 && ln -s /usr/bin/svnauthz-validate /usr/local/bin/websvn/ \
 && ln -s /usr/bin/svnbench /usr/local/bin/websvn/ \
 && ln -s /usr/bin/svndumpfilter /usr/local/bin/websvn/ \
 && ln -s /usr/bin/svnfsfs /usr/local/bin/websvn/ \
 && ln -s /usr/bin/svnlook /usr/local/bin/websvn/ \
 && ln -s /usr/bin/svnmucc /usr/local/bin/websvn/ \
 && ln -s /usr/bin/svnrdump /usr/local/bin/websvn/ \
 && ln -s /usr/bin/svnserve /usr/local/bin/websvn/ \
 && ln -s /usr/bin/svnsync /usr/local/bin/websvn/ \
 && ln -s /usr/bin/svnversion /usr/local/bin/websvn/

COPY config.php /var/www/html/include/

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/fpm-pool.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY config/php.ini /etc/php/7.4/cli/conf.d/custom.ini
COPY config/php.ini /etc/php/7.4/fpm/conf.d/custom.ini
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY websvn/svn /usr/local/bin/websvn

EXPOSE 80
VOLUME /var/www/html/include

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
