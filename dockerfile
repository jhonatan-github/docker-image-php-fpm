# Imagem base do Alpine 3.14
FROM alpine:3.14

# Atualizar os repositórios e instalar o PHP-FPM
RUN apk update && apk add \
    php8-fpm \
    php8-zip \
    php8-pdo \
    php8-pdo_mysql \
    && rm -rf /var/cache/apk/*

# Criar o diretório de trabalho
WORKDIR /var/www/html

# Copiar arquivos PHP para o contêiner
COPY projeto/ .

# Expor a porta 9000 para o Nginx ou outros servidores web
EXPOSE 9000

# Iniciar o PHP-FPM
CMD ["php-fpm8", "-F"]
