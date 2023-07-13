FROM eclipse-temurin:8-jre-alpine as final

ADD https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar /app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
