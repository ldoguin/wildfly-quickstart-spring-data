Spring Data Couchbase: How to Use Spring Data Couchbase in an Application
====================================================
Author: Madhumita Sadhukhan, Laurent Doguin
Level: Intermediate  
Technologies: Spring Data Couchbase
Summary: The `springDataCouchbase` quickstart demonstrates how to use Spring Data Couchbase, using CDI and Hibernate Bean Validation, and EJB.  
Target Product: WildFly    
Source: <https://github.com/wildfly/quickstart/>  

What is it?
-----------

The `springDataCouchbase` quickstart is based upon the [kitchensink](../kitchensink/README.md) example, but demonstrates how to use Spring Data Object/Document Mapping (ODM) over JPA in Red Hat JBoss Enterprise Application Platform.

This project is setup to allow you to create a compliant Java EE 7 application using JSF, CDI, EJB, Spring Data Couchbase and Hibernate Bean Validation.  It includes a connection to a Couchbase cluster and some sample persistence code to help you with database access in enterprise Java. 

_Note: This quickstart uses does not use an embeded database usually provided by wildfly. Make sure you have a Couchbase Server running locally.

System requirements
-------------------

The application this project produces is designed to be run on Red Hat JBoss Enterprise Application Platform 7 or later. 

All you need to build this project is Java 8.0 (Java SDK 1.8) or later and Maven 3.1.1 or later. See [Configure Maven for WildFly 10](https://github.com/jboss-developer/jboss-developer-shared-resources/blob/master/guides/CONFIGURE_MAVEN_JBOSS_EAP7.md#configure-maven-to-build-and-deploy-the-quickstarts) to make sure you are configured correctly for testing the quickstarts.


Use of WILDFLY_HOME
---------------

In the following instructions, replace `WILDFLY_HOME` with the actual path to your WildFly installation. The installation path is described in detail here: [Use of WILDFLY_HOME and JBOSS_HOME Variables](https://github.com/jboss-developer/jboss-developer-shared-resources/blob/master/guides/USE_OF_EAP7_HOME.md#use-of-eap_home-and-jboss_home-variables).


Add the Correct Dependencies
---------------------------

WildFly does not provide Spring Data support. 

This quickstart demonstrates usage of Spring Data Couchabse and Hibernate Validators.

If you look at the pom.xml file in the root of the springDataCouchbase quickstart directory, you will see that the dependencies for the Hibernate modules have been added with the scope as `provided`.
For example:

      <dependency>
         <groupId>org.hibernate</groupId>
         <artifactId>hibernate-validator</artifactId>
          <scope>provided</scope>
         <exclusions>
            <exclusion>
               <groupId>org.slf4j</groupId>
               <artifactId>slf4j-api</artifactId>
            </exclusion>
         </exclusions>
      </dependency>

Scope is provided because it is provided by Wildfly. Spring Data Couchbase is not on the other hand. You need to add the dependency as follow:

        <dependency>
            <groupId>org.springframework.data</groupId>
            <artifactId>spring-data-couchbase</artifactId>
            <version>${version.spring.data.couchbase}</version>
        </dependency>

You will probably need to also add the right repository to download the Spring dependencies:


      <repositories>
          <repository>
              <id>spring-release</id>
              <name>Spring Releases</name>
              <url>https://repo.spring.io/release</url>
          </repository>
      </repositories>



Start the WildFly Server
-------------------------

1. Open a command prompt and navigate to the root of the WildFly directory.
2. The following shows the command line to start the server:

        For Linux:   WILDFLY_HOME/bin/standalone.sh
        For Windows: WILDFLY_HOME\bin\standalone.bat

 
Build and Deploy the Quickstart
-------------------------

1. Make sure you have started the WildFly server as described above.
2. Open a command prompt and navigate to the root directory of this quickstart.
3. Type this command to build and deploy the archive:

        mvn clean install wildfly:deploy

4. This will deploy `target/wildfly-springdata.war` to the running instance of the server.


Access the application 
---------------------

The application will be running at the following URL: <http://localhost:8080/wildfly-springdata/>.


Undeploy the Archive
--------------------

1. Make sure you have started the WildFly server as described above.
2. Open a command prompt and navigate to the root directory of this quickstart.
3. When you are finished testing, type this command to undeploy the archive:

        mvn wildfly:undeploy


Run the Quickstart in Red Hat JBoss Developer Studio or Eclipse
-------------------------------------
You can also start the server and deploy the quickstarts or run the Arquillian tests from Eclipse using JBoss tools. For general information about how to import a quickstart, add a WildFly server, and build and deploy a quickstart, see [Use JBoss Developer Studio or Eclipse to Run the Quickstarts](https://github.com/jboss-developer/jboss-developer-shared-resources/blob/master/guides/USE_JBDS.md#use-jboss-developer-studio-or-eclipse-to-run-the-quickstarts) 


Debug the Application
------------------------------------

If you want to debug the source code of any library in the project, run the following command to pull the source into your local repository. The IDE should then detect it.

        mvn dependency:sources

You may see the following message when you run the command. It indicates the source is not provided in the third-party `antlr` JAR.

        [INFO] The following files have NOT been resolved:
        [INFO]    antlr:antlr:jar:sources:2.7.7:provided


