# Use OpenJDK 21
FROM openjdk:21-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy all project files into the container
COPY . .

# Make mvnw executable
RUN chmod +x mvnw

# Build the Spring Boot project (skip tests)
RUN ./mvnw clean package -DskipTests

# Expose Spring Boot default port
EXPOSE 8080

# Start the Spring Boot app
CMD ["java", "-jar", "target/notes-0.0.1-SNAPSHOT.jar"]
