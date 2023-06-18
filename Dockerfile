FROM openjdk:11
EXPOSE 61000
ADD target/XYZtechnologies-1.0.war XYZtechnologies-1.0.war
ENTRYPOINT ["java","-war","XYZtechnologies-1.0.war"]