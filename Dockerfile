FROM gcr.io/distroless/java17-debian11
# FROM amazoncorretto:17

WORKDIR /
COPY target/*.jar /process-service.jar

# USER 65534:65534
ENTRYPOINT ["/usr/bin/java", "-Dspring.profiles.active=container", "-jar"]
CMD ["process-service.jar"]