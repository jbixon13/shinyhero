# shinyhero
[![Travis CI Build Status](https://travis-ci.com/jbixon13/shinyhero.svg?branch=master)](https://travis-ci.com/jbixon13/shinyhero)
[![Heroku Build Status](https://heroku-badge.herokuapp.com/?app=shinyhero-test)](https://shinyhero-test.herokuapp.com)

- [Documentation](#documentation)
- [Using this template](#using-this-template)
- [Setup](#setup)
  - [Install](#install)
  - [Build](#build)
- [Testing](#testing)
  - [Test your Shiny Application locally](#test-your-shiny-application-locally)
  - [Test your Docker container locally](#test-your-docker-container-locally)
  - [Test your Heroku deployment](#test-your-heroku-deployment)
- [Automate](#automate)
  - [Heroku](#heroku)
  - [Travis CI](#travis-ci)
- [Sources and Links](#sources-and-links)

## Documentation
We've included a `docs` folder with a template [Tech Spec](/docs/Tech_Spec.md) and [Best Practices](/docs/Best_Practices.md) document, though using Github's Wiki capabilities is also a good idea. This will get you started with documenting your project.  Other documents and relevant information that has no other place can live in the `docs` folder.  Replace this paragraph with a brief breakdown of what you've included in your `docs` folder.

## Using this template
* You want more flexibility than [shinyapps.io](https://www.shinyapps.io/) allows
* You don't know much about CI/CD, PaaS, and other devOps tools
* You want a clear path from building your tool to sharing it with the world without compromises

## Setup

### Install
* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [Docker](https://docs.docker.com/v17.09/engine/installation/)
  + Docker is straightforward to use and install on Linux, OS X, & Windows 10 Pro
  + Please see the `docs` folder for additional instructions on installing and running Docker on Windows 10 Home
* [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
* [R](https://cloud.r-project.org/)
* [RStudio](https://rstudio.com/products/rstudio/download/)
  + Optional
* [renv](https://github.com/rstudio/renv)

### Build
* Click the "Use this Template" button to set up a Github repo for your project
* Copy the link to your new Github repo
* `git clone` your repo to your machine
* Change the name of `shinyhero.Rproj` to `<yourProjectName>.Rproj`
* You should now have the following file structure: 

```
<yourProjectName>
│   .dockerignore
│   .gitignore
|   .Rprofile
|   .travis.yml
|   Dockerfile
|   LICENSE
|   README.md
|   renv.lock
|   <yourProjectName>.Rproj
|
|───.github
|     |   ...
│
└───app
|    │   global.R
|    │   ui.R
|    |   run.R
|    │   server.R
|
|───docs
     |   ...
|
|───renv
     |   ...
```

* Your local project will have no packages installed. Run `renv::restore()` to install packages from renv.lock
* If you have issues installing any packages, run `renv::init()` to re-build renv.lock.
* You should now have all R packages needed to locally run the basic example application in `app/`

## Testing

### Test your Shiny Application locally
It is a good idea to test the application provided before building anything more complicated
* `shiny::RunApp('app/')`

### Test your Docker container locally

Go to your Git Bash terminal
* Make sure Docker is set up correctly on your machine: `docker ps`
* Move to your application's directory
* Build your Docker image locally: `docker build -t <yourProjectName> .`
* Run a docker container from your image: `docker run --rm <yourProjectName>`
* Point your browser to localhost:3838
  + More complicated if running on Windows 10 Home, see `docs`

### Test your Heroku deployment
* Make sure you're logged into Heroku: `heroku login` 
* Login to the Heroku container registry: `heroku container:login`
* Create a Heroku application in your project directory: `heroku create <yourProjectName>`
* Build a Docker image to the container registry: ` heroku container:push web -a <yourProjectName>`
* Release your app to production: `heroku container:release web -a <yourProjectName>`

## Automate
You should now have:
* A functioning app that you can run locally
* The same app deployed to Heroku through the Heroku container registry
* You could keep iterating manually by building locally and deploying through the CLI
* An automated CI/CD pipeline is a more robust solution

### Heroku
* To automate the build pipeline you will need to generate a Heroku API Key
* Run `heroku:auth token` in Git Bash on your local machine
* Go to your [Heroku account settings](https://dashboard.heroku.com/account) and copy your key after revealing

### Travis CI
* Set up Travis CI by connecting your Github account at [travis-ci.com](https://www.travis-ci.com)
* Having a Github repo with a `.travis.yml` file should automatically enable Travis to run on each push
* `.travis.yml` will not need to be changed, but you will need to provide environment variables to build successfully
* Go to the settings of your project's repo on [travis-ci.com](https://www.travis-ci.com) and scroll down to `Environment Variables`
* You will need two variables to build successfully: `HEROKU_API_KEY` and `HEROKU_APP_NAME`
* Paste the Heroku key copied earlier into an environment variable named `HEROKU_API_KEY`
  + **NOTE: Make sure "Display Value in Build Log" is unchecked so you do not expose your key**
* Create a second environment variable named `HEROKU_APP_NAME` which is the name of your app on Heroku, likely `<yourProjectName>`
  + This value can be displayed in the log as it is not a secure credential
* You should now have an end-to-end development pipeline from locally building to hosting on the Heroku PaaS 

## Sources and Links
If referencing any third party service, code, etc, cite it here.
