#!/bin/bash

#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --job-name=SentEmbReorderSearch
#SBATCH --constraint=h100
#SBATCH --cpus-per-gpu=12
#SBATCH --gpus=1

function main() {
    module load anaconda
    module load cuda

    conda activate mltk

    TOKENIZERS_PARALLELISM=false mltk -c "${HOME}/projects/mltk/cfg/sent_embed_reorder.yaml" -p search
}


main $@
