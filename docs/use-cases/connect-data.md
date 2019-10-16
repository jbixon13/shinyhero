# Connect Data

Reading local data into the Shiny application should be avoided whenever possible in order to keep the Docker image as small as possible (it's already pretty large due to package installations). This comes with some additional considerations:

* Data can be read in from an API endpoint or url on the internet.
	+ This is low-maintenance but implies a reliance on the API/url's stability.
* A SQL database can be hosted and connected to through a standard interface like `DBI`.
	+ This is low-maintenance but implies your data is structured and amenable to SQL.
* A hosted storage system (S3, GCP Cloud Storage, Dropbox) can be accessed through assorted packages.
	+ This is high-flexibility but implies your reliance on a cloud service provider.

## Sources 
* [R Database Documentation](https://db.rstudio.com/getting-started/)
* [Shiny Persistent Storage Documentation](https://shiny.rstudio.com/articles/persistent-data-storage.html)
