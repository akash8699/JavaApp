# Stage 1: Build the application using Maven and Java 21
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Run the application using a minimal JDK image
FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=build /app/target/hello-world.war app.jar

# Set the entrypoint
ENTRYPOINT ["java", "-jar", "app.jar"]
