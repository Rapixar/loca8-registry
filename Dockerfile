FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
COPY target/registry-0.0.1-SNAPSHOT.jar registry.jar
EXPOSE 7000
ENTRYPOINT exec java $JAVA_OPTS -jar registry.jar
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar registry.jar
