FROM openjdk:17-jdk-slim

WORKDIR /app

COPY . .

RUN ./mvnw package -DskipTests

EXPOSE 8080

CMD ["java", "-jar", "target/nakshatra-one-1.0.0.jar"]