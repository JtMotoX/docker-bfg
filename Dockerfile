ARG BASE_IMAGE="base-$TARGETARCH-$TARGETVARIANT-end"

FROM eclipse-temurin:17-jre-alpine as base-amd64--end
FROM arm64v8/eclipse-temurin:17-jre as base-arm64--end
FROM arm64v8/eclipse-temurin:17-jre as base-arm64-v8-end
FROM arm32v7/eclipse-temurin:17-jre as base-arm-v7-end
FROM ppc64le/eclipse-temurin:17-jre as base-ppc64le--end



FROM alpine as arch-debug
ARG BASE_IMAGE
RUN echo "BASE_IMAGE: $BASE_IMAGE"


FROM $BASE_IMAGE as final

ADD https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar /app.jar

ARG NOCACHE

RUN java -jar /app.jar | grep '^bfg '

ENTRYPOINT ["java","-jar","/app.jar"]
