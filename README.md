# About

This project automates the process of building, testing, and deploying a Dockerized application using **Jenkins** and **Docker**. The Jenkins pipeline is configured to build a Docker image of the application by running the docker build command, which is OS-specific for Unix and Windows environments. It uses environment variables like **IMAGE_NAME** to dynamically set the Docker image name during the build. Once the image is built, Jenkins logs in to Docker Hub using stored credentials and pushes the image to the repository. Finally, the pipeline runs the container, ensuring a smooth, automated workflow from code to deployment.

*Make sure that **Docker** is installed on your local machine or server before running this pipeline.*

