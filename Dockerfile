ARG JDK_VERSION=25
ARG BFG_VERSION=1.15.0


FROM amazoncorretto:${JDK_VERSION}-alpine-jdk AS packager
ARG BFG_VERSION
ADD https://repo1.maven.org/maven2/com/madgag/bfg/${BFG_VERSION}/bfg-${BFG_VERSION}.jar /app.jar
RUN jdeps \
        -q \
        --multi-release 25 \
        --print-module-deps \
        --class-path build/lib/* \
        /app.jar > jre-deps.info
RUN jlink \
        --verbose \
        --strip-java-debug-attributes \
        --no-header-files \
        --no-man-pages \
        --output /build/jre \
        --add-modules $(cat jre-deps.info)


FROM alpine:latest AS final
ENV JAVA_HOME=/opt/java-minimal
ENV PATH="$PATH:$JAVA_HOME/bin"
COPY --from=packager /build/jre "$JAVA_HOME"
COPY --from=packager --chmod=644 /app.jar /app.jar
ARG WORKDIR="/work"
WORKDIR "${WORKDIR}"
RUN printf '%s\n%s\n' '#!/bin/sh' 'exec java -jar /app.jar "$@"' >/usr/local/bin/bfg && chmod 755 /usr/local/bin/bfg
RUN bfg --version
ENTRYPOINT ["bfg"]
