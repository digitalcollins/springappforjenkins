# First stage: Build the application
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app

# Copy pom.xml and source code
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
# Package the Spring Boot application
RUN mvn clean package -DskipTests

# Second stage: Run the application
FROM openjdk:17-jdk-alpine
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the application port
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
