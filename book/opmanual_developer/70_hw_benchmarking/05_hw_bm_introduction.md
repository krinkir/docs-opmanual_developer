# Introduction {#sec:hw_benchmark_intro level=sec status=ready}

In this section the Hardware Benchmark used in my Bachelor Thesis will be introduced. The associated repos are the following: 

* [Duckietown shell](https://github.com/duckietown/duckietown-shell-commands) used for the Benchmark CLI tool
* [Benchmark Backend](https://github.com/duckietown/dt-hardware-benchmark-backend), REST API to process data
* [Benchmark Frontend](https://github.com/duckietown/dt-hardware-benchmark-frontend), display results

Unless developing, the repos aren't needed as everything is installed via a docker container or the dts.

<minitoc/>


## Motivation
In order to assess performance of different software and hardware configurations a standardized benchmarking procedure is needed. 
Such a benchmark helps do detect inefficiencies as well potential defects in the hardware and will help to troubleshoot nonfunctional Duckiebots. In the development of new software it is crucial to have performance metrics in order to compare the new release against the status quo.

## Experiment
The benchmark uses a standardized sequence of commands and docker images in order to benchmark the performance of the Duckiebot. 

### Material
In order to perform a benchmark the following material is needed:

* Duckiebot to be tested
* A 3x3 Loop (4 Curves, 4 straights)
* optionally 4 Watchtowers and apriltags

### General procedure

1. start diagnostics
2. start lane following
3. record a bag containing latency information
4. process data and compare against an overall average
