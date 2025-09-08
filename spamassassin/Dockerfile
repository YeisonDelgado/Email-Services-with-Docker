FROM alpine:latest

RUN apk add --no-cache \
    spamassassin \
    spamassassin-client \
    perl-mail-spamassassin \
    perl-io-string \
    perl-archive-zip \
    curl \
    gnupg

# Crear usuario spamd
RUN addgroup -g 1001 spamd && \
    adduser -D -u 1001 -G spamd spamd

# Crear directorios
RUN mkdir -p /var/lib/spamassassin \
             /etc/spamassassin \
             /var/log/spamassassin

# Cambiar permisos
RUN chown -R spamd:spamd /var/lib/spamassassin /var/log/spamassassin

# Actualizar reglas de SpamAssassin
RUN sa-update || true

USER spamd

EXPOSE 783

ENTRYPOINT ["spamd"]