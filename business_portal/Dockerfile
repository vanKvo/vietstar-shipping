FROM php:8.3.3-apache

# Update packages and install required extensions
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
  && docker-php-ext-install pdo_mysql mysqli zip \
  && docker-php-ext-enable mysqli \
  && a2enmod rewrite

# Rationale for PHP extensions:
# - pdo_mysql: The modern standard for accessing MySQL databases in PHP through PDO (PHP Data Objects). It provides a secure way to use prepared statements to prevent SQL injection.
# - mysqli: Provided for backward compatibility with older code that hasn't been migrated to PDO yet.
# - zip / libzip-dev: While not strictly required for DB access, it's a very common requirement for Composer and Excel/PDF export libraries used in modern enterprise apps.
# - a2enmod rewrite: Essential for implementing a front-controller routing pattern (like forcing all traffic through index.php) which is a core industry standard for clean URLs and MVC setups.

# Copy codebase into the container
COPY . /var/www/html/

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html/
