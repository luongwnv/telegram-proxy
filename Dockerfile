FROM telegrammessenger/proxy:latest
ENV MAX_FILES=1024 WORKERS=2
ENTRYPOINT ["/mtproto-proxy"]
CMD ["--port", "443", "--secret", "${SECRET}"]