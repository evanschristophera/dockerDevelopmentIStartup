# dockerDevelopmentIStartup

This is to create an image that allows graalvm image builds.  The images built using dind will be used in the application which, currently, will be run using docker compose.


1. Build with the following:
   ```
   cd docker-dind
   docker build -t ubuntu-dind .
   ```
1. Run the image with: 
   ```
   docker run --privileged -v C:/Users/evansc/.ssh:/root/.ssh --rm --name ubuntu-dind -d ubuntu-dind
   ```


## PROGRESS!!!

Was able to build and run [micronaut's graalvm example](https://guides.micronaut.io/latest/micronaut-creating-first-graal-app-gradle-java.html) and run as a docker container.  

Nest step is to run a distroless container. Smaller and faster.

***Helpful Safety Hint***

Because of WSL and Windows in general, localhost is not really localhost in docker containers.  To find the IP of the docker container running a service use:
```
docker inspect  
```

## git

To use an SSH URL one must inform git as to which identiy file to use.  That is configured with the following command:
```
git config --global core.sshCommand "ssh -i /path/to/your/private_key"
```
or, for a single command:
```
GIT_SSH_COMMAND="ssh -i /path/to/your/private_key" git clone git@github.com:your-username/repo.git
```


- Need to explore the possibiliy of using an alias