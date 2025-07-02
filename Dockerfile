
# Use a lightweight Java base image
FROM openjdk:17-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy built jar to the container
COPY target/*.jar app.jar

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]





