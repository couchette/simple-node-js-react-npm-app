sudo apt-get update
for pkg in docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin containerd runc; do sudo apt-get remove $pkg <<< $'Y\n'; done
sudo apt-get update