#!/bin/bash
#SBATCH --job-name=mlp
#SBATCH --partition=hype
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:30:00
#SBATCH --output=out/%x_%j.out
#SBATCH --error=out/%x_%j.err

source /home/intel/oneapi/vtune/2021.1.1/vtune-vars.sh

export OMP_PROC_BIND=close

for threads in 1 2 5 10 20 40; do
    export OMP_NUM_THREADS=$threads
    vtune -collect hpc-performance -result-dir results/vtune_results_$threads ./main
done