FROM jupyterhub/jupyterhub:0.7.2

RUN apt-get -qq update && \
    apt-get -q -y upgrade && \
    apt-get install -y sudo && \
    rm -rf /var/lib/apt/lists/*

RUN useradd admin && echo "admin:admin" | chpasswd && chmod -R 777 /root /home
ADD requirements.txt /srv/jupyterhub/requirements.txt
RUN pip install -r /srv/jupyterhub/requirements.txt

COPY jupyterhub_config.py /srv/jupyterhub

CMD ["jupyterhub", "--ip", "0.0.0.0"]
