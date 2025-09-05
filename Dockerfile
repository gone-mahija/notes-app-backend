# Use OpenJDK 21
FROM openjdk:21-jdk-slim

# Set working directory inside container
WORKDIR /app

# Copy only the built JAR
COPY target/notes-0.0.1-SNAPSHOT.jar app.jar

# Expose port (use Render's PORT env variable)
ENV PORT 10000
EXPOSE 10000

# Start the Spring Boot app
CMD ["java", "-jar", "app.jar"]
