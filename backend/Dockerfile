FROM registry.access.redhat.com/ubi9/openjdk-17-runtime

ENV JAVA_APP_DIR=/application
ENV JAVA_MAIN_CLASS=com.example.ApplicationKt
COPY build/libs/backend-all.jar /application/backend-all.jar

EXPOSE 8080
