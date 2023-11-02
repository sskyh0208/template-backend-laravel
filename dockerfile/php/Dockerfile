FROM php:8.2-fpm

WORKDIR /var/www/html

COPY ./src /var/www/html
COPY ./dockerfile/php/bin /usr/local/bin
COPY ./dockerfile/php/config/php.ini /usr/local/etc/php/php.ini

RUN apt update
RUN apt install -y \
    git \
    zip \
    unzip \
    vim && \
    rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo_mysql mysqli
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