sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
	
cat << "EOF"
 _     _______________________     _ 
| |   / / / / / / \ \ \ \ \ \ \   | |
| |  / / / / / / / \ \ \ \ \ \ \  | |
| | / / / /  UPDATE \ \ \ \ \ | |
| |/ / / / / / /     \ \ \ \ \ \ \| |
| /_/_/_/_/_/_/       \_\_\_\_\_\_| |
| |                               | |
|_|                               |_|
EOF
	
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt-get update

cat << "EOF"
 _     _______________________     _ 
| |   / / / / / / \ \ \ \ \ \ \   | |
| |  / / / / / / / \ \ \ \ \ \ \  | |
| | / / / / / INSTALL \ \ \ \ \ \ | |
| |/ / / / / / /     \ \ \ \ \ \ \| |
| /_/_/_/_/_/_/       \_\_\_\_\_\_| |
| |                               | |
|_|                               |_|
EOF

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

docker --help

host="unix:///var/run/docker.sock"

sudo groupadd docker

sudo usermod -aG docker $USER

newgrp docker
