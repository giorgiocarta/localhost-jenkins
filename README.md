# Run Jenkins in localhost 

This project allow you to setup a docker instance running Jenkins and
test Jenkins pipeline on project stored locally on your computer.

With this setup, you can also use the docker plugin and docker agents in your pipeline.

You can find the relevant docker commands to build and run Jenkins in the Makefile.

## Build and run the image:

You can use `make` for these basic ops:

```bash
# build the image
make build_jenkins

# run the image
make run_jenkins
```
Once the container is running, you can access Jenkins [here](http://localhost:8080)

## Persist the data

All the jenkins plugins, settings, users etc are stored in the host system via a 
mounted volume, `jenkins_home`.

## Docker docket

To work properly, you need to bind the host docker.socket via a volume. The location
of the docker.socket file may varies from system to system. In this example it is set
at `/var/run/docker.sock`, the standard location for Mac and Linux systems 

This is not intended for any production environment.

## Plugins used

To run the example, in addition to the basic plugin recommended by Jenkins during setup, the following 
are required:

- Docker
- Docker pipeline
- File System SCM Plugin

## Create a python sample pipeline

Create a new Item of type `Pipeline`. 

In the configuration page, scroll down to the Pipeline section fill with the following properties:

Definition: `Pipeline script from SCM`
SCM: `File System`
Path: `/var/projects/python_project`
Script path: `Jenkinsfile`

