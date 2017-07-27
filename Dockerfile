FROM maven as build
WORKDIR /opt/demo
COPY . /opt/demo/
RUN mvn clean package

FROM tomcat
WORKDIR /usr/local/tomcat
COPY --from=build /opt/demo/target/sysfoo.war /usr/local/tomcat/webapps/
CMD ["catalina.sh","run"]