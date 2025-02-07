#!/bin/bash
#SBATCH --job-name=llama3_pileoflaw
#SBATCH --nodes=2                 # Number of nodes
#SBATCH --ntasks-per-node=8        # Number of processes per node (adjust to GPUs)
#SBATCH --gpus-per-node=8          # GPUs per node
#SBATCH --cpus-per-task=8          # CPUs per task
#SBATCH --mem=128G                 # Memory per node
#SBATCH --time=48:00:00            # Max time
#SBATCH --output=logs/%j.out        # Save output logs
#SBATCH --error=logs/%j.err         # Save error logs

# Activate Python environment
apt-get update
apt install python3.10-venv
python3 -m venv venv
source venv/bin/activate

pip install torch lightning

# Run fine-tuning with torchrun
srun python3 /main.py