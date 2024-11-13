# Step 1: Build the React Frontend
# ---------------------------------
FROM node:16.16.0 AS frontend-build
WORKDIR /app

# Copy package.json, package-lock.json, and webpack.config.js to install dependencies
COPY package.json package-lock.json webpack.config.js ./

# Install dependencies
RUN npm install

# Install Webpack and http-server globally
RUN npm install -g webpack webpack-cli http-server

# Copy the source files required for building
COPY src/main/js /app/src/main/js

# Build the React frontend using Webpack
RUN webpack --config webpack.config.js



# Step 2: Build the Spring Boot Backend
# -------------------------------------
FROM maven:3.8.4-openjdk-8 AS backend-build
WORKDIR /app

# Copy only the pom.xml to download dependencies (leveraging Docker cache)
COPY package.json package-lock.json webpack.config.js pom.xml ./


# Copy the rest of the backend files
COPY src ./src


# Copy the frontend build output into the static resources folder of Spring Boot
COPY --from=frontend-build /app/src/main/resources/static/built ./src/main/resources/static/built

ENV NODE_OPTIONS=--openssl-legacy-provider

# Build the Spring Boot application
RUN mvn clean package -DskipTests


# Step 3: Create Final Image for Running the Application
# ------------------------------------------------------
FROM openjdk:8-jre-slim
WORKDIR /app

# Copy the JAR file from the previous stage
COPY --from=backend-build /app/target/react-and-spring-data-rest-0.0.1-SNAPSHOT.jar app.jar

# Expose the port Spring Boot runs on
EXPOSE 8080


# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]








