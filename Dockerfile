# Use the official PHP image with FPM and Alpine Linux
FROM php:8.2-fpm-alpine

# Install system dependencies
RUN apk add --no-cache \
    git \
    curl \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    zlib-dev \
    zip \
    libzip-dev \
    postgresql-dev 

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_pgsql gd zip exif pcntl

# Configure PHP settings
RUN echo "upload_max_filesize = 50M" > /usr/local/etc/php/conf.d/uploads.ini && \
    echo "post_max_size = 50M" >> /usr/local/etc/php/conf.d/uploads.ini

# Get latest Composer and make it executable
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy application code and set ownership
COPY . .

# Install dependencies
RUN composer install --no-dev --no-interaction --no-progress --no-suggest

# Expose port 9000 and start PHP-FPM
EXPOSE 9000
CMD ["php-fpm"]
