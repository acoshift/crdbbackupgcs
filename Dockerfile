FROM cockroachdb/cockroach

RUN apt update && apt install -y curl bash python && \
	curl https://sdk.cloud.google.com | bash && \
	rm -rf /root/.config

ADD backup.sh /
RUN chmod +x /backup.sh

ENTRYPOINT ["/backup.sh"]
