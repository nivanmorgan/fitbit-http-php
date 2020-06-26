FROM php:7.4

# Install dependencies
RUN apt-get update && apt-get install -y \
    git

# Copy composer.lock and composer.json
# COPY composer.lock composer.json /app
COPY composer.json /app

# Set working directory
WORKDIR /usr/src/app

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy existing application directory contents
COPY . /usr/src/app

# Install dependencies
RUN ["composer", "install"]
