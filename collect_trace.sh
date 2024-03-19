#!/bin/bash

VERSION=voyager

cd ./ChampSim

# build no_pref llc prefetcher
#./build_champsim.sh hashed_perceptron no no no no lru 1

ROOT="../"
OUTPUT_ROOT="../LoadTraces"
ChampSimTrace_ROOT="XXX" # 改成自己的trance文件目录

app_list=(
bfs-10.txt.xz          sssp-10.txt.xz          410.bwaves-s0.txt.xz   471.omnetpp-s0.txt.xz
433.milc-s0.txt.xz     459.GemsFDTD-s1.txt.xz  473.astar-s1.txt.xz    462.libquantum-s0.txt.xz
482.sphinx3-s0.txt.xz  437.leslie3d-s0.txt.xz  470.lbm-s0.txt.xz      602.gcc-s0.txt.xz
619.lbm-s1.txt.xz      649.fotonik3d-s3.txt.xz 620.omnetpp-s0.txt.xz  654.roms-s3.txt.xz
621.wrf-s1.txt.xz      623.xalancbmk-s0.txt.xz 607.cactuBSSN-s0.txt.xz
bc-0.txt.xz            cc-13.txt.xz            pr-10.txt.xz
450.soplex-s0.txt.xz   429.mcf-s0.txt.xz       605.mcf-s0.txt.xz
)

mkdir $OUTPUT_ROOT

#cd $ChampSim_path
#python ./$ChampSim_path/ml_prefetch_sim.py build
#./ml_prefetch_sim.py build

WARM=51
SIM=50
#./ml_prefetch_sim.py build
seed_file=$(cat ./scripts/seeds.txt)
#for app1 in `ls $ChampSimTrace_ROOT`; do
for app1 in ${app_list[*]}; do
	if [[ ${app1:0:1} -eq 6 ]]
	then
    	app2=${app1%%.txt*}.trace.xz
    else
    	app2=${app1%%.txt*}.trace.gz
    fi
    echo ${app2}

    seed_line=$(echo "$seed_file" | grep "${app1%%.txt*}")
    seed=$(echo "$seed_line" | awk '{print $2}')
    ./bin/hashed_perceptron-no-no-no-no-lru-1core -prefetch_warmup_instructions ${WARM}000000 -simulation_instructions ${SIM}000000 -seed $seed -traces $ChampSimTrace_ROOT/$app2

    mv ./no_pref.txt $OUTPUT_ROOT/${app1%%.xz}
    # compress trace file
    cd $OUTPUT_ROOT
    xz -z -k ${app1%%.xz}
    cd ../ChampSim

    echo "Done for "${app1}

done
