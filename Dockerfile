#FROM openjdk:8-jdk-alpine as builder
FROM java:8 as builder

COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src
RUN chmod +x ./gradlew
RUN ./gradlew bootjar
#소스랑 빌드할 실행프로그램 copy -> bootjar 파일 생성 후 -> 다른 도커image에 복사 -> 복사한거 실행

# Start with a base image containing Java runtime
FROM java:8
#FROM openjdk:8-jre-alpine
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
COPY  --from=builder ${JAR_FILE} test-springboot.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/test-springboot.jar"]

#CMD ["./gradlew", "bootRun"] 해보기, postgres이미지 다운 영상참조

#https://velog.io/@skygl/Docker-%EC%8A%A4%ED%94%84%EB%A7%81-%EB%B6%80%ED%8A%B8-%EC%82%AC%EC%9D%B4%ED%8A%B8-%EA%B0%80%EC%9D%B4%EB%93%9C%EC%9D%98-Docker-%EC%97%B0%EB%8F%99%ED%95%98%EB%8A%94-%EB%AA%85%EB%A0%B9%EC%96%B4-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0