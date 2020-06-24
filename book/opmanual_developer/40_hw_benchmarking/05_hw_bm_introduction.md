# Introduction {#sec:hw_benchmark_intro level=sec sta

In this section the Hardware Benchmark used in my Bachelor Thesis will be introduced. The associated repos are the following: 

* [Duckietown shell](https://github.com/duckietown/duckietown-shell-commands) used for the Benchmark CLI tool
* [Benchmark Backend](https://github.com/duckietown/dt-hardware-benchmark-backend), REST API to process data
* [Benchmark Frontend](https://github.com/duckietown/dt-hardware-benchmark-frontend), display results

Unless developing, the repos aren't needed as everything is installed via a docker container or the dts.

<minitoc/>

## Experiment
The benchmark uses a standardized sequence of commands and docker images in order to benchmark the performance of the Duckiebot. 

### 
In order to perform a benchmark the following material is needed:

* Duckiebot to be tested
* A 3x3 Loop (4 Curves, 4 straights)
* optionally 4 Watchtowers and apriltags
## Motivation
TODO