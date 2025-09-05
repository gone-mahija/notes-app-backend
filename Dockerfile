# Use OpenJDK 21 slim image
FROM openjdk:21-jdk-slim

# Set working directory inside container
WORKDIR /app

# Copy only the built JAR
COPY target/notes-0.0.1-SNAPSHOT.jar app.jar

# Expose port from Render's PORT env variable
ENV PORT 8080
EXPOSE $PORT

# Run the Spring Boot app using the Render port
CMD ["sh", "-c", "java -jar app.jar --server.port=$PORT"]

