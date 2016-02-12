set -e

apt-get update 
apt-get -y install python3-dev build-essential curl git libssl-dev libffi-dev vim
update-alternatives --set editor /usr/bin/vim.basic

curl -L https://bootstrap.pypa.io/get-pip.py |python3 

#COPY requirements.txt /tmp/requirements.txt

pip3 install -r /tmp/requirements.txt && rm -f /tmp/requirements.txt

rm -f /usr/local/lib/python3.4/dist-packages/requests/cacert.pem && ln -s /etc/ssl/certs/ca-certificates.crt /usr/local/lib/python3.4/dist-packages/requests/cacert.pem

useradd -d /home/app -m -u 1001 -s /bin/false app

#WORKDIR /home/app