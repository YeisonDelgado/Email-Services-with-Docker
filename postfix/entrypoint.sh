#!/bin/sh

# Configurar hostname básico
postconf -e "myhostname = mail.innovate.local"
postconf -e "mydomain = innovate.local"

# Configurar red básica
postconf -e "inet_interfaces = all"
postconf -e "inet_protocols = ipv4"

# Generar mapas
newaliases

# Iniciar rsyslog en background
rsyslogd

# Iniciar postfix en foreground
exec postfix start-fg