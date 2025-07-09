FROM openjdk:17-jdk-slim

RUN groupadd --system appgroup && useradd --system --gid appgroup appuser

WORKDIR /home/appuser/app

COPY --chown=appuser:appgroup . .

RUN ./mvnw package -DskipTests

EXPOSE 8080

USER appuser

CMD ["java", "-jar", "target/nakshatra-one-1.0.0.jar"]