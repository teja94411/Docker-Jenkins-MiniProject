FROM openjdk:17
WORKDIR /app
COPY . /app 
RUN javac Docker_Jenkins/App.java
CMD ["java","App"]


