#!/usr/bin/env bash

logdir="data"
algo=$1
envs=("Hopper-v3" "Walker2d-v3")

for ((i=0;i<2;i+=1)); do
    for env in ${envs[@]}; do
        python $1.py \
            --env $env \
            --seed $i \
            --epochs 5 \
            --obs_norm \
            --use_clipped_value_loss
    done
done

for env in ${envs[@]}; do
    python utils/plot.py \
        --logdir $logdir'/'$algo'_'$env'/' \
        -y 'Performance' \
        -s 1
done