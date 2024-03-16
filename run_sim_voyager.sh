#!/bin/bash

#VERSION=1_trans_3_trans_context_f1_64_16

VERSION=voyager

cd ./ChampSim

ROOT="../"
ChampSimTrace_ROOT="XXX" # 改成自己的trance文件目录
OUTPUT_ROOT="../res"


OUTPUT_PATH=$OUTPUT_ROOT/$VERSION/sim
Gen_reports_path=$OUTPUT_ROOT/$VERSION/sim/reports
PrefFile_ROOT=$OUTPUT_ROOT/$VERSION/train
Gen_eval_path=$OUTPUT_PATH

app_list=(
bfs-10.txt.xz          sssp-10.txt.xz          410.bwaves-s0.txt.xz   471.omnetpp-s0.txt.xz
433.milc-s0.txt.xz     459.GemsFDTD-s1.txt.xz  473.astar-s1.txt.xz    462.libquantum-s0.txt.xz
482.sphinx3-s0.txt.xz  437.leslie3d-s0.txt.xz  470.lbm-s0.txt.xz      602.gcc-s0.txt.xz
619.lbm-s1.txt.xz      649.fotonik3d-s3.txt.xz 620.omnetpp-s0.txt.xz  654.roms-s3.txt.xz
621.wrf-s1.txt.xz      623.xalancbmk-s0.txt.xz 607.cactuBSSN-s0.txt.xz
bc-0.txt.xz            cc-13.txt.xz            pr-10.txt.xz
450.soplex-s0.txt.xz   429.mcf-s0.txt.xz       605.mcf-s0.txt.xz
)

mkdir $OUTPUT_PATH
mkdir $Gen_reports_path

#cd $ChampSim_path
#python ./$ChampSim_path/ml_prefetch_sim.py build
#./ml_prefetch_sim.py build

WARM=51
SIM=50
#./ml_prefetch_sim.py build

#for app1 in `ls $ChampSimTrace_ROOT`; do
for app1 in ${app_list[*]}; do
	if [[ ${app1:0:1} -eq 6 ]]
	then
    	app2=${app1%%.txt*}.trace.xz
    else
    	app2=${app1%%.txt*}.trace.gz
    fi
    echo ${app2}

    ./ml_prefetch_sim.py run $ChampSimTrace_ROOT/$app2 --num-prefetch-warmup-instructions $WARM --num-instructions $SIM --results-dir $Gen_reports_path --prefetch $PrefFile_ROOT/${app1}.model.pth.prefetch_file.csv
    #--no-base
    echo "Done for "${app1}

done

./ml_prefetch_sim.py eval --results-dir $Gen_reports_path --output-file $Gen_eval_path/eval.csv
