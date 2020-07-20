# Demo {#sec:hw_benchmark_demo level=sec status=ready}

This section presents a demo of the hardware benchmark where all is run on your own machine.

<minitoc/>

## Start the API 
### Saving data locally
In order to start the API which saves data on your local machine use the following command: 

    laptop $ docker run -v ![/PATH/TO/DATA/DIR/]:/data/ -it -e LOCAL=True -p 5000:5000 -e APP_SECRET=![DT_APP_SECRET] -e APP_ID=![APP_ID] --rm duckietown/dt-hardware-benchmark-backend:daffy-amd64

### Saving data online
**Careful the API address in the frontend is hardcoded and thus needs to be adjusted**

In order to start the API which saves data on s3 and a MySQL database use the following command: 

    laptop $ docker run -dit -p 5000:5000 -e MYSQL_USER=![DB_USER] -e MYSQL_PW=![DB_PW] -e MYSQL_URL=![DB_URL] -e MYSQL_DB=![DB_NAME] -e AWS_SECRET_ACCESS_KEY=![AWS_SECRET_ACCESS_KEY] -e AWS_ACCESS_KEY_ID=![AWS_ACCESS_KEY_ID] -e APP_SECRET=![DT_APP_SECRET] -e APP_ID=![APP_ID]--rm duckietown/dt-hardware-benchmark-backend:daffy-amd64

## Start the Frontend
**Adjust the API address if wanted to run online** 

    laptop $ docker run -it -p 3000:80 --rm duckietown/dt-hardware-benchmark-frontend:daffy-amd64

It then is reachable under `localhost:3000`
## Run the benchmark
You need two terminals, another one to prepare the start of lane following as described in the output of the CLI.

Now it is time to run the benchmark you can use the `dts`:

    laptop $ dts benchmark ![BOTNAME] -a ![YOUR_LOCAL_IP_ADDRESS]:5000

If your API is running online, enter the `API_URL` including the . 
