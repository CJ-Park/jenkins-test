FROM openjdk:17-jdk-alpine AS build
WORKDIR /tmp
COPY . /tmp
RUN chmod +x ./gradlew && ./gradlew clean bootJar

FROM openjdk:17-jdk-alpine
WORKDIR /tmp
COPY --from=build /tmp/build/libs/test-0.1.jar /tmp/Test.jar
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /tmp/Test.jar"]