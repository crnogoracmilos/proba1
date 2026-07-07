FROM maven:3.9.0-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

#mora na oba java17 zbog springboot-a

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
RUN apk update && apk upgrade
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
