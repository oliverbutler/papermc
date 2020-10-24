# JRE base
FROM openjdk:11.0-jre-slim

# Environment variables
ENV MC_VERSION="1.16.3" \
  PAPER_BUILD="latest" \
  MC_RAM="2G" \
  JAVA_OPTS=""

ADD setup.sh .
RUN apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

# Start script
CMD ["sh", "./setup.sh"]

# Container setup
EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME /papermc