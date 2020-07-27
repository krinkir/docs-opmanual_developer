# Settings {#sec:hw_benchmark_settings level=sec status=ready}

Possible Settings for calculating the BM score

<minitoc/>

Remark: In order to edit any function one needs the API in the developer mode, e.g. clone git repo and run from there. Instructions can be found in the repo.

## Weighting Function
In order to adjust the weight function, edit the function `weight_function` in the file `logic/utils/data_collection.py`.

## Weights of single element in benchmark score
Adjustments of weights are made in the dict `averages` in the file `logic/config/config.py`


## New Score Categories 
Add another entry to the dict `averages` in the file `logic/config/config.py`


## New measurements
In order to add another measurement which is calculated during the benchmark file analysis edit the function `measurements` in the file `logic/config/config.py`. If more external data is needed to display, the functions calling measurements need to be edited. For further information consult the `README.md` in the repo.

