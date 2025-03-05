FROM registry.access.redhat.com/ubi9/openjdk-17-runtime:latest

# Set the working directory
WORKDIR /app

# Copy the fat JAR
COPY build/docker/counter-server.jar /app/counter-server.jar

# Copy any external resources (if needed)
COPY build/docker/resources/ /app/resources/

# Set environment variables
ENV JAVA_OPTS="-Xms128m -Xmx256m"

# Expose the port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "counter-server.jar"]
