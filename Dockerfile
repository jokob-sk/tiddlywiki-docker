FROM node:alpine

#setup cron
ADD crontab.txt /crontab.txt
ADD script.sh /script.sh
COPY entry.sh /entry.sh
RUN chmod 755 /script.sh /entry.sh
RUN /usr/bin/crontab /crontab.txt

# Setup node for tiddlywiki
RUN npm install -g tiddlywiki@5.2.0

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

# Add init-and-run script
#ADD init-and-run-wiki /usr/local/bin/init-and-run-wiki


CMD ["/entry.sh"]
