#!/bin/bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out $CERTS_ -subj "/C=MO/L=KH/O=1337/OU=student/CN=rdoukali.42heilbronn.de"

{
    echo "server {"
    echo "    listen 443 ssl;"
    echo "    listen [::]:443 ssl;"
    echo "    ssl_certificate $CERTS_;"
    echo "    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;"
    echo "    ssl_protocols TLSv1.3;"
    echo "    index index.php;"
    echo "    root /var/www/html;"
    echo "    location ~ [^/]\.php(/|$) {"
    echo "        try_files \$uri =404;"
    echo "        fastcgi_pass wordpress:9000;"
    echo "        include fastcgi_params;"
    echo "        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;"
    echo "    }"
    echo "}" 
} > /etc/nginx/sites-available/default

nginx -g "daemon off;"
