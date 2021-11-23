#bin/bash

# Source Download
touch ./logs/access.log
touch ./logs/error.log

# Container Build & Run
docker build -t infra-laravel ./
docker-compose up -d

# Copy Enviornment Settings
#aws s3 cp s3://dotenv/laravel8/.env.dev ../.env

# Composer Package Install
containerID=$(docker-compose ps -q web)
docker exec $containerID bash -c "cd /var/www/default; php /bin/composer.phar install"
