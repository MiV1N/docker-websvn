# WebSVN 2.6.1 or later (nginx + php-fpm) on debian:bullseye

This is a very lean docker image for https://websvnphp.github.io/ which is based on debian:bullseye-slim.

You need to provide the SVN repository with the "repository" environment variable or define a custom "config.php" which needs to be placed into the mapped " /var/www/html/include/" directory.

The php-server runs on port 80.

It has the following features...
- Use nkf as character encoding.
- Use nginx + php-fpm as web server . (Working under multi-threading)

Example Docker Compose file:

    version: '2'
    services:
      websvn:
        image: yoshihide1981/websvn
        container_name: websvn
        ports:
            - "8003:80"
        environment:
            - repository=svn://10.0.1.20/main
        restart: always

- GitHUB  
https://github.com/YoshihideShirai/docker-websvn
- dockerhub  
https://hub.docker.com/r/yoshihide1981/websvn
