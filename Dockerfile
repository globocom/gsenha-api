FROM tsuru/python

COPY . /home/application/

WORKDIR /home/application/

RUN sudo apt-get update -y && sudo apt-get install -y $(awk '{print $1'} requirements.apt)

RUN pip install -r requirements.txt

CMD [ "gunicorn","-b 0.0.0.0:8888", "-t 90","gsenhaapi:app"]