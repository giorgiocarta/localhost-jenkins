
TOP := $(shell pwd)

build_jenkins:
	docker build . --tag jenkins:local

run_jenkins:
	docker run --rm -p 8080:8080 -p 50000:50000 --privileged -v /var/run/docker.sock:/var/run/docker.sock -v $(TOP)/sample_projects:/var/projects -v $(TOP)/jenkins_home:/var/jenkins_home --name jk jenkins:local

current_directory:
	echo $(TOP)