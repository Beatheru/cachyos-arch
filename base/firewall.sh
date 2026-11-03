# LocalSend
sudo ufw allow 53317/udp comment 'localsend'
sudo ufw allow 53317/tcp comment 'localsend'

# Docker
sudo ufw-docker install
sudo ufw reload
