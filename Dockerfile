# Usando a imagem oficial do PHP 8.3 com Apache
FROM php:8.3-apache

# Define o diretório de trabalho dentro do container
WORKDIR /var/www/html

# Atualiza os pacotes e instala as dependências necessárias, incluindo o libmariadb-dev para compatibilidade com o MySQL/MariaDB
RUN apt-get update -y && apt-get install -y \
    libmariadb-dev \
    && docker-php-ext-install pdo mysqli pdo_mysql \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Habilitar o módulo rewrite do Apache (necessário para rotas amigáveis, caso use)
RUN a2enmod rewrite

# Expor a porta 80 (caso você queira rodar apenas a aplicação PHP)
EXPOSE 8000
