# shinyhero

## Documentation
We've included a `docs` folder with a template [Tech Spec](/docs/Tech_Spec.md) and [Best Practices](/docs/Best_Practices.md) document, though using Github's Wiki capabilities is also a good idea. This will get you started with documenting your project.  Other documents and relevant information that has no other place can live in the `docs` folder.  Replace this paragraph with a brief breakdown of what you've included in your `docs` folder.

## Using this template
* You want more flexibility than [shinyapps.io](https://www.shinyapps.io/) allows.
* You don't know much about CI/CD, PaaS, and other software engineering tools. 
* You want a clear path from building your tool to sharing it with the world without compromises.

## Setup

### Install
* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [Docker](https://docs.docker.com/v17.09/engine/installation/)
  + Docker is straightforward to use and install on Linux, OS X, & Windows 10 Pro.
  + Please see the `docs` folder for additional instructions on installing and running Docker on Windows 10 Home. 
* [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
* [R](https://cloud.r-project.org/)
* [RStudio](https://rstudio.com/products/rstudio/download/)
  + Optional
* [renv](https://github.com/rstudio/renv)

### Build
* Click the "Use this Template" button to set up a Github repo for your project.
* Create a new folder for your project on your machine.
* Set up an Rstudio Project in your new folder.
* `git clone` the repo to the folder on your machine.
* You should now have the following file structure: 

```
yourProjectName/
│   yourProjectName.Rproj    
│
└───yourProjectName/
   │   .dockerignore
   │   .gitignore
   |   .Rprofile
   |   Dockerfile
   |   LICENSE
   |   README.md
   |   renv.lock
   |   shinyhero.Rproj
   |
   |───.github/
   |     |   ...
   │
   └───app/
   |    │   global.R
   |    │   ui.R
   |    │   server.R
   |
   |───docs/
        |   ...
   |
   |───renv/
        |   ...
```

## Testing

### Test your Shiny Application locally
It is a good idea to test the Hello World application provided with the template before building anything more complicated.
* `shiny::RunApp('app/')`

### Test your Docker container locally
Go to your Git Bash terminal.
* Make sure Docker is set up correctly on your machine.
  + `docker ps`
* Move to your application's directory
* Build your Docker image locally with `docker build -t yourProjectName .`
* Run a docker container from your image with `docker run --rm yourProjectName`
* Point your browser to localhost:3838
  + More complicated if running on Windows 10 Home, see `docs`

### Test your Heroku deployment
* a
* b
* c

## Sources and Links
If referencing any third party service, code, etc, cite it here.
