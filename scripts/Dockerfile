# Use Maven + Java to build the app
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app
# copy the project folder content into /app
COPY LibraryProject2/ .   
RUN mvn clean package -DskipTests

# Run stage (lighter image)
FROM eclipse-temurin:17-jre

WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

EXPOSE 5000

ENTRYPOINT ["java", "-jar", "app.jar"]

