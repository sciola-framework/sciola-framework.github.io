#!/bin/bash
# Block direct access through port 8080 - Bloquear acesso direto pela porta 8080
iptables -A INPUT -p tcp -s localhost --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp --dport 8080 -j DROP
