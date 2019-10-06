FROM rocker/r-ver:3.5.1

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
ENV RENV_VERSION 0.7.0-111
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# Copy all, use .dockerignore in root to exclude
COPY . /

# Execute R package install through renv
RUN R -e "renv::restore()"

# Expose port
EXPOSE 3838

# Run Shiny App, enforce host and port
CMD ["R", "-e", "shiny::runApp('app/', host = '0.0.0.0', port = 3838)"]