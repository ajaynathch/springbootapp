# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine


# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8000

# The application's jar file
ARG JAR_FILE=target/auth-1.3.5.RELEASE.war

# Add the application's jar to the container
ADD ${JAR_FILE} auth-1.3.5.RELEASE.war

# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/auth-1.3.5.RELEASE.war"]