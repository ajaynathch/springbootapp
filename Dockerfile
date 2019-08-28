# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine


# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Make port 80 available to the world outside this container
EXPOSE 80

# Run the jar file 
CMD ["java","-jar","target/auth-1.3.5.RELEASE.war"]