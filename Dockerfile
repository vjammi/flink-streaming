FROM apache/flink:1.14.3-scala_2.12-java8
COPY flink-reactive-app/target/flink-reactive-app-1.0.jar /opt/flink/usrlib/flink-reactive-app-1.0.jar
