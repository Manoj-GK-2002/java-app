# Use an official OpenJDK runtime as the base image
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from your local machine into the container
COPY target/my-app-1.0-SNAPSHOT.jar /app/my-app-1.0-SNAPSHOT.jar

# Expose the port the app runs on (if your app listens on a specific port)
EXPOSE 8080

# Command to run the JAR file
CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
