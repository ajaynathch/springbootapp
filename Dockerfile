# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Add the application's jar to the container
ADD target/auth-1.3.5.RELEASE.war auth-1.3.5.RELEASE.war

# Run the jar file 
ENTRYPOINT ["java","-jar","/auth-1.3.5.RELEASE.war"]