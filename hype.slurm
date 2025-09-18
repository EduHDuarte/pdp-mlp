#!/bin/bash
#SBATCH --job-name=mlp
#SBATCH --partition=hype
#SBATCH --nodes=1
#SBATCH --ntasks=20
#SBATCH --time=00:5:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err

main