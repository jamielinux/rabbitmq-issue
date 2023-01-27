# Steps to reproduce

Create a 1GB RAM Digital Ocean droplet with Ubuntu 22.04, then run the
following as root:

```shell
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y && reboot
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
curl -sSL https://github.com/docker/compose/releases/download/v2.15.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
cd /root
git clone https://github.com/jamielinux/rabbitmq-issue7068.git
cd rabbitmq-issue7068
chmod 0600 erlang.cookie
docker-compose up -d
docker-compose logs -f
```
