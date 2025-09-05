# Use OpenJDK 21
FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Make mvnw executable
RUN chmod +x mvnw

# Build the Spring Boot project (skip tests)
RUN ./mvnw clean package -DskipTests

# Copy the generated JAR to a standard name
RUN cp target/notes-0.0.1-SNAPSHOT.jar app.jar

# Expose port from Render's PORT env variable
EXPOSE 8080

# Start the Spring Boot app
CMD ["java", "-jar", "app.jar"]
