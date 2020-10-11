# Start with a base image containing Java runtime
#FROM java:8
FROM openjdk:8-jre-alpine
# Add Author info
LABEL maintainer="dksxoghl8@gmail.com"

## Add a volume to /tmp
#VOLUME /tmp

## Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=build/libs/test-0.0.1-SNAPSHOT.jar

## Add the application's jar to the container
#ADD ${JAR_FILE} test-springboot.jar
COPY ${JAR_FILE} test-springboot.jar

# Run the jar file
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/test-springboot.jar"]
CMD ["./gradlew", "bootRun"]
#CMD ["./gradlew", "bootRun"] 해보기, postgres이미지 다운 영상참조