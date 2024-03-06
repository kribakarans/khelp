# Install Docker Engine on Ubuntu

## 1. Add Docker's official GPG key:
   sudo apt-get update
   sudo apt-get install ca-certificates curl gnupg
   sudo install -m 0755 -d /etc/apt/keyrings
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   sudo chmod a+r /etc/apt/keyrings/docker.gpg

# 2. Add the repository to Apt sources:
   echo \
       "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
       $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
       sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt-get update

## 2. Install the Docker packages:
   sudo apt-get install docker-ce docker-ce-cli containerd.io \
                        docker-buildx-plugin docker-compose-plugin

## 3. Verify that the Docker Engine installation:
   docker --version
   docker buildx verion

## 4. Hello world!
   sudo docker run hello-world

## 5. Docker Engine service:
   sudo service docker start/status

## 6. Uninstall Docker Engine:
   sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
   sudo rm -rf /var/lib/docker
   sudo rm -rf /var/lib/containerd
