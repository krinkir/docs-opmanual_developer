# Demo {#sec:hw_benchmark_demo level=sec status=ready}

This section presents a demo of the hardware benchmark where all is run on your own machine.

<minitoc/>

## Start the API 
### Saving data locally
In order to start the API which saves data on your local machine use the following command: 

    laptop $ docker run -dit -p 5000:5000 -e LOCAL=true -v/data:[!path/to/local/dir] bm_backend

### Saving data online
In order to start the API which saves data on s3 and a MySQL database use the following command: 

    laptop $ docker run -dit -p 5000:5000 -e MYSQL_USER=[!DB_USER] -e MYSQL_PW=[!DB_PW] -e MYSQL_URL=[!DB_URL] -e MYSQL_DB=[!DB_NAME] -e AWS_SECRET_ACCESS_KEY=[!AWS_SECRET_ACCESS_KEY] -e AWS_ACCESS_KEY_ID=[!AWS_ACCESS_KEY_ID] bm_backend

TODO: add correct image
## Start the Frontend
TODO:  
## Run the benchmark
TODO: 