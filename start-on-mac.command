#!/bin/bash

# http-server başlatılıyor
http-server -p 8000 &

# Sunucunun başlatılması için 2 saniye bekle
sleep 2

# Varsayılan tarayıcıda localhost:8000 adresini aç
open http://localhost:8000
