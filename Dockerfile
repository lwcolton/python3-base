FROM ubuntu:14.04

RUN apt-get update && apt-get -y install python3-dev build-essential curl git libssl-dev libffi-dev vim && sudo update-alternatives --set editor /usr/bin/vim.basic

RUN curl -LO https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py && rm -f get-pip.py

COPY requirements.txt /tmp/requirements.txt

RUN pip3 install -r /tmp/requirements.txt && rm -f /tmp/requirements.txt

RUN rm -f /usr/local/lib/python3.4/dist-packages/requests/cacert.pem && ln -s /etc/ssl/certs/ca-certificates.crt /usr/local/lib/python3.4/dist-packages/requests/cacert.pem

RUN useradd -d /home/app -m -u 1001 -s /bin/false app

USER app

WORKDIR /home/app
