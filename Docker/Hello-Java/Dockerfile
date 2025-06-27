# Stage 1
FROM eclipse-temurin:21-jdk AS builder
WORKDIR /app
COPY HelloWorld.java .
RUN javac HelloWorld.java
# Stage 2
# FROM gcr.io/distroless/java21
FROM bellsoft/liberica-runtime-container
WORKDIR /app
COPY --from=builder /app/HelloWorld.class .
CMD ["java", "HelloWorld"]
