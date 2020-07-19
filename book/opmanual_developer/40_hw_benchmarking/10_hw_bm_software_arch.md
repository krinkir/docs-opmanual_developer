# Software Architecture  {#sec:hw_benchmark_sw_arch level=sec status=ready}

This section introduces the hardware benchmark software architecture. *It is not required to read in order to conduct the benchmark.* It generally consists of three small programs communicating with each other:

<figure>
    <figcaption>Hardware benchmark tools </figcaption>
    <img alt="HW BM Tools" style='width:15em' src="/images/big_three.png"/>
</figure>

<minitoc/>

In order to **facilitate and unify** the benchmark procedure the above mentioned tools have been created. The optimal setup would be similar to the dts diagnostic tool. One command that starts the benchmark and then uploads all files and displays the data online. Once the API and frontend are online resp. incorporated in the dashboard, this will almost be possible. Only  the lane following has to be started by hand. 

## Communication

<figure>
    <figcaption>Hardware benchmark software communication diagram </figcaption>
    <img alt="Communication Diagram" style='width:28em' src="/images/communication.png"/>
</figure>

The above diagram summarizes the communication between different services. It is obvious that the API is central for the benchmarking procedure.

## API / Backend

### Endpoints
Once the API is running it offers a Swagger UI which describes all endpoints. It can be accessed at the address of the API (running locally, normally at (localhost:5000)[`localhost:5000`]) 

### Data storage
The API provides two different ways to store data:

* Locally on the machine using SQLite and writing files in the specified directory
* Using S3 and a mySQL Database hosted separately 

### Functionality
The API offers two endpoints where the benchmark files can be uploaded via POST request. Once the files, consisting of:

* `meta`, JSON string containing manually written metadata
* `meta_json`, JSON file containing Metadata
* `sd_card_json`, JSON file containing SD Speeds 
* `latencies_bag`, Bag containing Latencies, recorded on the bot
* evt. `diagnostics_json`, JSON containing the diagnostic data 
* evt. `localization_bag`, Localization bag

are uploaded. The API retrieves all benchmarking measurements from those files, saves them to a file as well as a summary to the Database. If no `diagnostics_json` but the `diagnostics_id` is provided in the request url, the API retrieves the diagnostic data from the dt-diagnostics tool. 

## Frontend
The frontend is used to display the benchmark data. As well as a synthetically calculated score.
### File Upload
The frontend provides an interface to upload data manually, as one may make the benchmark as well "by hand". 
<figure>
    <figcaption>Benchmark Upload</figcaption>
    <img alt="Benchmark Upload" style='width:28em' src="/images/bm_upload.png"/>
</figure>

### Score Display
All scores are displayed on the web interface including the possibility to download the saved data and the 
<figure>
    <figcaption>Score Display</figcaption>
    <img alt="Score Display" style='width:28em' src="/images/score_display.png"/>
</figure>

## CLI
The CLI is part of the Duckietown shell `dts` benchmark command. More explanation can be found in the section  Demo. 