#!/bin/bash
#SBATCH --job-name=mlp
#SBATCH --partition=hype
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=00:30:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err

module load vtune

for threads in 1 2 4 8 16 20; do
    export OMP_NUM_THREADS=$threads
    # vtune -collect hotspots -result-dir vtune_results_$threads ./mlp
done