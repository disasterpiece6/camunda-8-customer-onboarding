FROM maven:3.8.3-openjdk-17 AS build
# LABEL authors="klemens"

ARG WORK_DIR=/build

COPY . ${WORK_DIR}/

WORKDIR ${WORK_DIR}

RUN mvn clean install

# RUN cp ${WORK_DIR}/target/customer-onboarding-camunda-8-springboot-0.0.1-SNAPSHOT.jar \
# ${WORK_DIR}/customer-onboarding-camunda-8-springboot-0.0.1-SNAPSHOT.jar

## debug
RUN ls -la /build

# FROM amazoncorretto:17
FROM gcr.io/distroless/java17-debian11

WORKDIR /
COPY --from=build /build/target/process-service.jar .

USER 65534:65534
ENTRYPOINT ["/usr/bin/java", "-Dspring.profiles.active=container", "-jar"]
CMD ["process-service.jar"]