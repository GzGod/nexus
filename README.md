linux和wsl指令
   ```bash
wget -O nexus.sh https://raw.githubusercontent.com/GzGod/nexus/refs/heads/main/nexus.sh && sed -i 's/\r$//' nexus.sh && chmod +x nexus.sh && ./nexus.sh
   ```
Mac指令
   ```bash
sudo wget -O nexusformac.sh https://raw.githubusercontent.com/GzGod/nexus/refs/heads/main/nexusformac.sh && sudo sed -i '' 's/\r$//' nexusformac.sh && sudo chmod +x nexusformac.sh && sudo -H -u "$SUDO_USER" bash -c './nexusformac.sh'
   ```
