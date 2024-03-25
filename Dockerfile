FROM adoptopenjdk/openjdk14
WORKDIR /app
RUN apt-get update && apt-get install -y vim
COPY ./target/kafka-coursera-1.0-SNAPSHOT-jar-with-dependencies.jar .
CMD ["java", "-jar", "./target/kafka-coursera-1.0-SNAPSHOT-jar-with-dependencies.jar"]
EXPOSE 8080