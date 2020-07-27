# Future improvements {#sec:hw_benchmark_improvements level=sec status=ready}



The chapter of benchmarking performance of the Duckiebots is by far not over. This thesis sets a baseline for benchmarking the hardware behaviour. Still all used software plus the applied measurements have room for improvement. Some ideas are presented in this chapter. 

<minitoc/>

## Measurements:

- Collect more data
- Include localization system data
- Incorporate Battery measurements
- Run benchmark using \verb+daffy+ as software release
    
## API:

- Incorporate other benchmark procedures e.g. Software Benchmark
- Add authentication via the Duckietown token
- Upload the data to an external host data storage
- Cache overall score in order to reduce response time for resp. endpoint
- Incorporate localization info
- Use \verb+bjoern+ or similar as production \verb+WSGI+ (Web Server Gateway Interface) server, as the Flask development server is technically not save to run in a production environment. 
- Save graphs, further reducing the response time
    
## CLI

- Adjust docker digests for \verb+daffy+, resp. \verb+daffy_new_deal+ container once it is released
- Automated hardware compliance check
- Invoke callbacks in separate threads
- Display link to the new diagnostic result

## Frontend
- Improve frontend, enable direct comparison between average and newly supplied benchmark
- Include frontend into the dashboard
- Frontend make responsive
