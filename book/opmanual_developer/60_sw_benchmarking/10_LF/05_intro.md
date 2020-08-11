# Lane Following Benchmark Introduction {#sec:benchmarking_lf_intro level=sec status=ready}

## Environment Definition
* 1 Duckiebot
* No natural light, just be white light coming from the ceiling
* Map: 'linus_loop'

## Experiment Definition
* Run lane following for 50 seconds
* Termination criteria:
    * Out of sight: 5 sec
    * Crash / Too slow: 15 sec per tile
* Repetition criteria:
    * Consistency in data
* Metrics:
    * Behaviour
    * Engineering data


  Type of experiment is pretty obvious and is simply running lane following for 50 seconds. The termination criteria’s, next to just when the bag recording is done, are out of sight of the Duckiebot and crashes. This means that the Benchmark is stopped/shortened to the time where the Duckiebot was last seen if the Duckiebot was out of sight of all the Watchtowers for more than 3 seconds or if the Duckiebot took more than 15 seconds to cross an entire Tile. This is only the case if the Duckiebot crashes or if Lane Following really screws up. In the case of a crash the user is allowed to stop lane following to prevent any damages but he is not allowed to actually move the Duckiebot until the bag has finished its recording.


## Mathematical Metrics Definitions
  Below you can see the formulas applied to actually calculate the results.

  Arithmetic mean:
  $$\bar{x}=\frac{1}{n} \sum_{i=1}^n x_i $$

  Standard deviation (std):
  $$s=\sqrt{\frac{1}{N}\sum_{i=1}^N(x_i-\bar{x})^2}$$

  Coefficient of variation (CV):
  $$ CV = std/mean*100[\%] $$


## Repetition Criteria

  To be able to do a proper analysis of the performance, one has to be sure that the data is reliable. The different data measured was analyzed over a bunch of experiments, and it was concluded that the only data that needs be verified that it is stable is the one coming from the localization system.
  As you can see [here](https://docs.google.com/presentation/d/1dcxJplfdvVpvFbF09yYH5Q-3zDIEU238BIdIZWKq5P8/edit?usp=sharing), the data measured on the Duckiebot concerning the update frequency the lag etc. do not change significantly between different experiments of the same code. The same applies for the data measured on the diagnostic toolbox (CPU usage or memory usage etc). Of course the stability of the data is increased the more data there is, but one can clearly see that one gets a good idea of the performance computational wise from one measurement.
  On the other hand as one can see on the very last slide of the link above, the measurement coming from the localization system can show some weird behaviour. This means, that it can happen, that the trajectory measured by the localization system does not at all correspond to the actual performance of the Duckiebot. To avoid that such falsified data influences the scoring of the actual performance the standard deviation of the measurements of the localization system is checked to assure stable and reliable measurements.

  A CV in the range of 20% normally stands for an acceptable standard deviation, this means that the std deviation compared to the mean does not very too much
  However in this Benchmarking, the purpose of looking at the CV factor is only to be sure that the experiment recorded was not a lucky or unlucky run, therefore, a CV below 100% is already acceptable.

  Therefore, the repetition criteria of the lane following Benchmark is, that all the CV of the measurements that are based on the localization system are below 1.0 (=100 %).

  To be more precise this means the following:
  For measurements like the mean of the absolute lane offset (distance and angle to center line) calculated of the localization system is not allowed to vary too much over the different experiment runs. Also properties like Speed, number of tiles covered etc should not have a too large standard deviation over all the experiment runs.  

  If one of these properties vary too significantly the user is tolled to run another experiment to stabilize the measurements and verify them. Also the user is asked to check for weird trajectory localization done by the localization system and sort this data out.

  Like this it is avoided that the results are falsified by measurements that do not at all correspond to the actual performance of the users software.

## Termination Criteria

  The Benchmark is officially terminated after the 50 seconds are up. However when the Duckiebot is out of sight for more then 3 seconds or if the Duckiebot takes more then 30 seconds
  to get across 1 tile the Benchmark will be terminated early. This will be taken into account into the final Benchmark score.
  An early termination will not be considered as a failure but will just lead to a lower score.

## Scoring

  In the Benchmark we consider on one hand the actual performance of the code, which means the actual behaving, and on the other hand we consider the engineering data performance. The engineering data that was recorded during the Benchmark gives you an insight on the CPU usage, update frequency of the different nodes, the latency etc.

  The metrics used here to generate a score are the following (please not that in brackets the priorities are noted, H = High priority, M = Medium priority and L = low priority):

  1. Behaviour performance
      * Mean absolute distance of the Duckiebot to the center of the lane [m] (H)
      * Mean absolute heading offset of the Duckiebot compared to the reference heading [deg] (H)
      * Mean absolute difference between the calculated/estimated offset by the Duckiebot and the actual offset calculated/measured by the Watchtowers [m] (M)
      * Mean absolute difference between the calculated heading error by the Duckiebot and the actual heading error calculated by the Watchtowers. [deg] (M)
      * Number of crashes (number of early stops due to slow driving or crashes devided by the number of experiments ran) (H)
      * Mean time until termination [seconds] (L)
      * Mean time needed per tile [seconds/tile] (L)

  2. Engineering data performance:
      * Mean latency (lag up to and including the detector node) [ms] (H)
      * Mean of the update frequency of the different nodes [Hz] (H)
      * Mean of the CPU usage of the different nodes in the dt-core container [%] (H)
      * Mean of the Memory usage of the different nodes in the dt-core container [%] (L)
      * Mean of the nr of Threads of the different nodes in the dt-core container (L)
      * Overall CPU usage [%] (H)
      * Overall Memory usage [%] (M)
      * Overall SWAP usage [%] (M)

  The score then is calculated separately for the Behaviour performance and the Enginieering data performane, where the score is increased by +5 if the property has high priority, +3 if the property has medium priority and +1 if the property has low priority. The overall score is then simply the sum of the behaviour score and the engineering data score.

  Please note that the localization of the Duckiebot that is measured by the watchtowers is with respect to the center of the April Tag that is placed on your Duckiebot. This means that all kind of measurements and results that talk about the position of the Duckiebot are refering to the center of the April Tag on top of the Duckiebot. This means that if this Apriltag is not placed very accurately, your results will be false.    

  Also note that during the final report produced at the very end you will see many different kind of results, also some of it which is not taken into account for the actual scoring. You can easily add a property to the scoring condition or change the priority of the property if you want to focus your score on something specific. This is simply done by changing the lists called: high_prio_beh, low_prio_beh, medium_prio_beh, high_prio_eng, low_prio_eng respectively medium_prio_eng.


## General information
  The Benchmarking is set up in a way such that up to to point 6 the procedure stays the same no matter what you are Benchmarking. Starting at point 6 there will be slight changes in the processing and analysis of the data depending on the Benchmark. However these changes are very small and the main changes are within the metrics etc.
  The goal of every Benchmark is to produce a final report that reports the results and compares them to another Benchmark of your choice. Ideally this benchmark it is compared to is the mean of all the Benchmarks ran all over the world of this type ran with the standard Duckietown software (for example the stable daffy commit of the containers `dt-core`, `dt-car-interface`, `dt-duckiebot-interface`, `dt-ros-commons`).
  However to be able to compare your Software with another one in any type of Benchmark, you first need to run at least 2 experiments. For each experiment there will be some recorded bags etc which then will be processed, analyzed and evaluated.
  The resulting evaluations of each experiment you run will then be again analyzed and for all the meaningful measurements, the means, medians and standard deviations are calculated. For each meaningful measurement the [coefficient of variation](https://www.researchgate.net/post/What_do_you_consider_a_good_standard_deviation) is calculated and if this value is below 1 you get a green light to compute the final Benchmarking report. This means that you have to run at least to experiments and then start running the notebook that calculates the variation of your computed results after each new experiment. So the amount of experiments that need to be run depend on the stability of your results. As soon as you get a green light of all the important results, compute the mean of all the results over all the experiments you ran (at least two).
  With this .yaml file including all the means, you are finally ready to run the comparison/analysis of your results. This will then generate a nice report that analysis your solution as well as compares it to the results of another Benchmark you selected(can be any Benchmark ran of the same type). Based on the final report file you get at the end you can easily tell if your Software solution did improve the overall Performance or not and where your solution is better and where it is worse.

  Note: The procedure explained below runs the diagnostic toolbox, records a bag from the localization system, records a bag directly on the Duckiebot and at the same time the acquisition bridge. Running for example lane_following or indefinite_navigation whilst collecting all that data might not work well as there is not enough CPU. This is because the localization system is at the moment not very efficient. However, this will change in the near future and this issue will be solved.

  Nevertheless, at the moment if your Duckiebot does whatever it wants when all is running and you are sure it is not because of your code, try to reduce the data recording to the essential. This means, first just don't run the diagnostic toolbox as this information is not the most crucial. If this still does not help, just record the bag from the localization system as this will give you at least some information about the actual performance of the behaving.
  In the case where you cannot record all the data, just ignore the according steps in the data analysis and complete the ones based on the bags you actually have.
  Experiment have shown that the data collected of the diagnostic toolbox do not really change from experiment to experiment, you can also run one experiment just running the diagnostic toolbox and then run this analysis on the data collected there.
  The same can be done with the bag that is collected on the Duckiebot.

  So a possible procedure as long as the localization system is not very efficient to first run some experiments recording just a bag from the localization system, run one experiment running the diagnostic toolbox next to it and then one experiments recording the bag directly on the Duckiebot.
  The Notebooks analyzing the data can handle all kind of different data recording configurations. However, it is important to say that the more experiments that were run with your code the more reliable the data and therefore, the more accurate the performance scoring.

For each Notebook there is an Example notebook that shows the results/outputs achieved by the notebooks when running them with actual data.

Please note that if you don't have a localization system available, just ignore everything related to the localization system. Then within the notebooks, just upload the Duckiebot relative pose estimation .json file called `BAGNAME_duckiebot_lane_pose.json` created by the analyze_rosbag package and take these measurements as ground truth of the relative Duckiebot pose. In this case all the measurements about the speed, tiles covered per second etc won't be calculated. However you can still get a nice idea about your performance based on the estimations and the engineering data recorded.
