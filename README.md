I would normally make a detailed readme, but time is a constraint here, and so this is just a collection of commands for reference.

follow instructions here

https://github.com/nebius/nebius-solution-library/tree/main/soperator

export SLURM_IP=$(terraform state show module.login_script.terraform_data.connection_ip | grep 'input' | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -n 1
)
scp -i ~/.ssh/nebius sjob.sh root@$SLURM_IP:/sjob.sh 
scp -i ~/.ssh/nebius main.py root@$SLURM_IP:/main.py
ssh root@$SLURM_IP -i ~/.ssh/nebius

sbatch /sjob.sh

squeue

add nebius cli docker helper

docker build -t <image-name> .
docker push <image-name>

kubectl apply -f kubernetes/chat.yaml





