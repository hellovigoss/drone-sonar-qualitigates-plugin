FROM alpine:3.8
COPY drone-sonar-qualitygate /bin/drone-sonar-qualitygate
CMD ["/bin/drone-sonar-qualitygate"]
