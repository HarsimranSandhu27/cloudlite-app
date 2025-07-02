# Use a base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy built jar to the container
COPY target/*.jar app.jar

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]

