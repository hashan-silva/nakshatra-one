FROM amazoncorretto:17

RUN addgroup -S appgroup && adduser -S -G appgroup appuser

WORKDIR /home/appuser/app

COPY --chown=appuser:appgroup . .

RUN chmod -R go-w .

RUN ./mvnw package -DskipTests

EXPOSE 8080

USER appuser

CMD ["java", "-jar", "target/nakshatra-one-1.0.0.jar"]