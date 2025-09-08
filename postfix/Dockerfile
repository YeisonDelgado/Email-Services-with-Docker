FROM alpine:latest

RUN apk add --no-cache postfix rsyslog

# Crear directorios necesarios
RUN mkdir -p /var/spool/postfix \
             /var/log/postfix \
             /run/postfix

# Configurar permisos
RUN addgroup -g 1000 postfix || true
RUN adduser -D -u 1000 -G postfix postfix || true
RUN chown -R postfix:postfix /var/spool/postfix

# Script de inicio
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 25 587

ENTRYPOINT ["/entrypoint.sh"]