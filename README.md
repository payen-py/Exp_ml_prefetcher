# TransFetch & Voyager
This repo contains code accompaning the manuscript "Fine-Grained Address Segmentation for Attention-Based Variable-Degree Prefetching"
```
@inproceedings{10.1145/3528416.3530236,
author = {Zhang, Pengmiao and Srivastava, Ajitesh and Nori, Anant V. and Kannan, Rajgopal and Prasanna, Viktor K.},
title = {Fine-Grained Address Segmentation for Attention-Based Variable-Degree Prefetching},
year = {2022},
isbn = {9781450393386},
publisher = {Association for Computing Machinery},
address = {New York, NY, USA},
url = {https://doi.org/10.1145/3528416.3530236},
doi = {10.1145/3528416.3530236},
booktitle = {Proceedings of the 19th ACM International Conference on Computing Frontiers},
pages = {103–112},
numpages = {10},
keywords = {address segmentation, prefetching, machine learning, attention},
location = {Turin, Italy},
series = {CF '22}
}
```

Voyager Data Prefetcher implemented in TensorFlow 2:

> Zhan Shi, Akanksha Jain, Kevin Swersky, Milad Hashemi, Parthasarathy Ranganathan, and Calvin Lin. 2021. A hierarchical neural model of data prefetching. In Proceedings of the 26th ACM International Conference on Architectural Support for Programming Languages and Operating Systems (ASPLOS 2021). Association for Computing Machinery, New York, NY, USA, 861–873. DOI:https://doi.org/10.1145/3445814.3446752

## Dependencies

- python: 3.x
- Pytorch: 0.4+
- Tensorflow: 2.x
- NVIDIA GPU



## Simulator

The simulator is a modification of ChampSim (https://github.com/Quangmire/ChampSim).

## Traces

The traces can be found at [this link](https://utexas.box.com/s/2k54kp8zvrqdfaa8cdhfquvcxwh7yn85). Alternatively, the `download.sh` file can be used to download all of the files to avoid bulk download restrictions from Box. 

`cd ./ChampSim`

`./download.sh`

## Run Model Training

We provide a sample script to run the model training for one application. After downloaded the traces, simply do:

* cd to root directory

* `./run_train_transfetch.sh`

The script will generate reports of training and a prefetching file of `TransFetch` prefetcher and will be generated under directory `./res/train` for simulation.

* `./run_train_voyager.sh`

The script will generate reports of training and a prefetching file of `Voyager` prefetcher and will be generated under directory `./res/train` for simulation.

## Run Simulation

After generating the prefetching file,  simulation can be done through ChampSim through:

* `./run_sim_transfetch.sh`

This script will generate simulation reports of `Transfetch` prefetcher The simulation reports and evaluation results will be generated at directory `./res/sim`.

* `./run_sim_voyager.sh`

This script will generate simulation reports of `Voyager` prefetcher The simulation reports and evaluation results will be generated at directory `./res/sim`.



