FROM openjdk:17
WORKDIR /app
COPY ./app .
RUN javac App.java
CMD ["java","App"]


