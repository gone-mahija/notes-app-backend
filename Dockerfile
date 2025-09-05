# Use OpenJDK 21
FROM openjdk:21-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy Maven wrapper first for faster caching
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Make mvnw executable
RUN chmod +x mvnw

# Build the Spring Boot project (skip tests)
RUN ./mvnw clean package -DskipTests

# Copy the jar into the working directory
COPY target/notes-0.0.1-SNAPSHOT.jar app.jar

# Expose default port
EXPOSE 8080

# Run the app using Render's PORT environment variable
CMD ["sh", "-c", "java -jar -Dserver.port=${PORT:-8080} app.jar"]
