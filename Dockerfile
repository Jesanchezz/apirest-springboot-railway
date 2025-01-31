FROM eclipse-temurin:21-jdk as build

COPY . /app
WORKDIR /app

RUN chmod +x mvnw && ./mvnw package -DskipTests

FROM eclipse-temurin:21-jre

ARG PORT
ENV PORT=${PORT}

COPY --from=build /app/target/*.jar app.jar

RUN useradd runtime
USER runtime

EXPOSE ${PORT}

ENTRYPOINT [ "java", "-Dserver.port=${PORT}", "-jar", "app.jar" ]
