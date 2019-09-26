FROM rocker/r-ver:3.6

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    gdebi-core \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    wget

# Install renv
ENV RENV_VERSION 0.7.0.108
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# Install R packages at image buildtime from renv.lock
WORKDIR /shinyhero
COPY renv.lock ./
RUN R -e 'renv::restore()'

EXPOSE 3838
