FROM rocker/r-ver:3.5.1

# Install Linux system libs
RUN apt-get update && apt-get install -y \
    sudo \
    gdebi-core \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    pandoc \
    pandoc-citeproc \
    wget

# Install renv
ENV RENV_VERSION 0.7.0-131
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# Copy all, use .dockerignore in root to exclude
COPY . /

# Execute R package install through renv
RUN R -e "renv::restore()"

# Expose port
EXPOSE 3838

# Run Shiny App using port assignment in run.R 
CMD ["R", "--no-save", "--gui-none", "-f /app/run.R"]
