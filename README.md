# dockerDevelopmentIStartup

1. Build with the following:
   ```
   cd dockerCompose 
   docker build -t ubuntu-dind .
   ```
1. Run the image with: 
   ```
   docker run --privileged -v C:/Users/evansc/.ssh:/root/.ssh --rm --name ubuntu-dind -d ubuntu-dind
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


- Need to explor the possibiliy of using an alias