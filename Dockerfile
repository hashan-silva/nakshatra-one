# Stage 1: build the application
FROM maven:3.9.5-eclipse-temurin-21 AS build
WORKDIR /app
COPY backend/pom.xml backend/pom.xml
COPY backend/src backend/src
RUN mvn -f backend/pom.xml package -DskipTests

# Stage 2: create the runtime image
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/backend/target/astrology-backend-0.0.1-SNAPSHOT.jar app.jar
CMD ["java","-jar","app.jar"]

