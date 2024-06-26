apt-get update -y && apt-get upgrade -y
apt-get install -y git
systemctl enable git
apt-get systemd -y
apt-get install -y apache2
systemctl enable apache2
echo "* Installing Docker ..."
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io
usermod -aG docker vagrant
systemctl enable docker
