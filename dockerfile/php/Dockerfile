FROM php:8.2-fpm-bullseye

ENV TZ Asia/Tokyo

WORKDIR /var/www/html

RUN groupadd -r nginx && useradd -r -g nginx nginx

COPY ./src /var/www/html
COPY ./dockerfile/php/bin /usr/local/bin
COPY ./dockerfile/php/config/php.ini /usr/local/etc/php/php.ini
COPY ./dockerfile/php/config/zzz-docker.conf /usr/local/etc/php-fpm.d/zzz-docker.conf

RUN apt-get update && \
	apt-get install -y git unzip libzip-dev libicu-dev libonig-dev && \
    rm -rf /var/lib/apt/lists/* 

RUN docker-php-ext-install intl pdo_mysql zip bcmath mysqli
RUN curl -sS http://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV NODE_VERSION=20.9.0
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

RUN chmod +x /usr/local/bin/*

CMD [ "sh", "/usr/local/bin/init.sh"]