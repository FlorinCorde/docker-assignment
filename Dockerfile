FROM openjdk:11-jre-slim

LABEL maintainer="Y"

ARG JAR_FILE=target/*.jar

EXPOSE 8080
COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
