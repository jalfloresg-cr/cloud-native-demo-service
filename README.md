# Cloud Native Demo Service

A simple Java Spring Boot application designed for cloud-native and platform engineering demonstrations.

This repository will be used as a reusable workload for experimenting with technologies and practices such as:

- Docker Hardened Images
- Kubernetes
- CI/CD
- Tekton
- Argo CD
- GitOps
- DevSecOps
- SBOM generation
- Container image signing
- Vulnerability scanning
- Observability

## Tech Stack

- Java 21
- Spring Boot
- Maven
- Docker
- Docker Hardened Images

## Run Locally

Build the application:

```bash
mvn clean package
```

Run it:

```bash
java -jar target/*.jar
```

The service will be available at:

```text
http://localhost:8080
```

## Health Check

Spring Boot Actuator provides a health endpoint:

```text
GET /actuator/health
```

Example:

```json
{
  "status": "UP"
}
```

## Container

The application uses a multi-stage Docker build with Docker Hardened Images.

Build the image:

```bash
docker build -t cloud-native-demo-service:local .
```

Run it:

```bash
docker run --rm \
  -p 8080:8080 \
  cloud-native-demo-service:local
```

Then test:

```bash
curl http://localhost:8080
```

## Project Purpose

The application itself is intentionally simple.

The goal of this repository is to provide a reusable workload for demonstrating cloud-native software delivery patterns while keeping the focus on the surrounding platform, CI/CD and security tooling.

## Roadmap

Future demonstrations may include:

- Tekton CI pipelines
- Trivy vulnerability scanning
- CycloneDX SBOM generation
- Cosign image signing and attestations
- GitOps deployments with Argo CD
- Kubernetes policy enforcement
- Prometheus and OpenTelemetry observability
- Kubernetes autoscaling

## License

This project is intended for educational and demonstration purposes.