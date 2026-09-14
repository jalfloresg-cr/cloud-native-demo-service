# syntax=docker/dockerfile:1

# ------------------------------------------------
# Build stage
# ------------------------------------------------
    FROM dhi.io/maven:3-jdk21-alpine3.22-dev AS builder

    WORKDIR /workspace
    
    COPY pom.xml .
    
    RUN mvn -B dependency:go-offline
    
    COPY src ./src
    
    RUN mvn -B clean package
    
    
    # ------------------------------------------------
    # Hardened runtime
    # ------------------------------------------------
    FROM dhi.io/eclipse-temurin:21-alpine3.22
    
    WORKDIR /app
    
    COPY --from=builder \
        /workspace/target/cloud-native-demo-services-0.0.1-SNAPSHOT.jar \
        /app/app.jar
    
    EXPOSE 8080
    
    ENTRYPOINT ["java", "-jar", "/app/app.jar"]