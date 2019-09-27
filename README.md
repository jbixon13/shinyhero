# shinyhero

## What are we doing here?
`Shiny` is an awesome part of the R ecosystem that allows you to build and deploy web applications. If you don't want to host your application through [shinyapps.io](https://www.shinyapps.io) there is a non-trivial level of effort and understanding of CI/CD, PaaS, and other software engineering practices required that are not familiar to some. I suspect this is applicable to many looking to use the full power of R to share production-grade tools with the world.   

## How are we accomplishing that?
* `Shiny` isn't generally something you can deploy as-is on cloud deployment solutions (that's the appeal of [shinyapps.io](https://www.shinyapps.io), but it comes with restrictions elsewhere). 

* `Docker` allows you to do this in a repeatable, reproducable way.

* As an additional level of reproducability, `renv` is used to manage R package dependencies in the Docker image.

## How can I use this?
Find out next time on Dragon Ball Z
