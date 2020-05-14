FROM ubuntu
RUN apt-get update
RUN apt-get install -y borgbackup
RUN apt-get install -y openssh-server
COPY start.sh /start.sh
RUN chmod +x /start.sh
RUN touch /.first-run
ENTRYPOINT /start.sh 
