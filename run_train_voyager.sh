#!/bin/bash

VERSION=voyager

ROOT="./"
#LoadTrace_ROOT="./SampleData/LoadTraces"
LoadTrace_ROOT="XXX" # 改为自己LoadTraces的目录
OUTPUT_ROOT="./res"

Python_ROOT=$ROOT"/voyager"

#app_list=(410.bwaves-s0.txt.xz)
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
mkdir $OUTPUT_ROOT/$VERSION
mkdir $OUTPUT_ROOT/$VERSION/train

#for app1 in `ls $LoadTrace_ROOT`; do
for app1 in ${app_list[*]}; do
	echo $app1
	file_path=$LoadTrace_ROOT/${app1}
    model_path=$OUTPUT_ROOT/$VERSION/train/${app1}.model.pth
	log_path=$OUTPUT_ROOT/$VERSION/tb_dir
    csv_file=${model_path}.prefetch_file.csv

    python $Python_ROOT/online.py --benchmark $file_path --model-path $model_path --config $Python_ROOT/configs/base.yaml --tb-dir $log_path --prefetch-file $csv_file
    
	echo "done for app "$app1
done

