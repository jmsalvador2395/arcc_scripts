#!/bin/bash

#SBATCH --nodes=1
#SBATCH --time=03:00:00
#SBATCH --job-name=NAON
#SBATCH --constraint=h100
#SBATCH --cpus-per-gpu=12
#SBATCH --gpus=1

function main() {
    module load anaconda
    module load cuda

    conda activate naon

    # vars
    task_name="roc"
    data_dir="${HOME}/data/ROCStories/tsv"

    #TOKENIZERS_PARALLELISM=false mltk -c "${HOME}/projects/mltk/cfg/sent_embed_reorder.yaml"
    cd ${HOME}/clones/nonautoregressive-sentence-ordering/
    python main.py --task_name ${task_name} --do_train False

}


main $@
