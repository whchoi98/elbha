# !/bin/bash
# EC2 Public IP export
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.101' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].PublicIpAddress'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.102' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].PublicIpAddress'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.103' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].PublicIpAddress'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.104' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].PublicIpAddress'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.101' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].PublicIpAddress'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.102' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].PublicIpAddress'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.103' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].PublicIpAddress'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.104' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].PublicIpAddress'
export Public_11_101_IP=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.101' 'Name=instance-state-name,Values=running'| jq -r '.Reservations[].Instances[].PublicIpAddress')
export Public_11_102_IP=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.102' 'Name=instance-state-name,Values=running'| jq -r '.Reservations[].Instances[].PublicIpAddress')
export Public_11_103_IP=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.103' 'Name=instance-state-name,Values=running'| jq -r '.Reservations[].Instances[].PublicIpAddress')
export Public_11_104_IP=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.104' 'Name=instance-state-name,Values=running'| jq -r '.Reservations[].Instances[].PublicIpAddress')
export Public_12_101_IP=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.101' 'Name=instance-state-name,Values=running'| jq -r '.Reservations[].Instances[].PublicIpAddress')
export Public_12_102_IP=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.102' 'Name=instance-state-name,Values=running'| jq -r '.Reservations[].Instances[].PublicIpAddress')
export Public_12_103_IP=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.103' 'Name=instance-state-name,Values=running'| jq -r '.Reservations[].Instances[].PublicIpAddress')
export Public_12_104_IP=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.104' 'Name=instance-state-name,Values=running'| jq -r '.Reservations[].Instances[].PublicIpAddress')
echo "export Public_11_101_IP=${Public_11_101_IP}"| tee -a ~/.bash_profile
echo "export Public_11_102_IP=${Public_11_102_IP}"| tee -a ~/.bash_profile
echo "export Public_11_103_IP=${Public_11_103_IP}"| tee -a ~/.bash_profile
echo "export Public_11_104_IP=${Public_11_104_IP}"| tee -a ~/.bash_profile
echo "export Public_12_101_IP=${Public_12_101_IP}"| tee -a ~/.bash_profile
echo "export Public_12_102_IP=${Public_12_102_IP}"| tee -a ~/.bash_profile
echo "export Public_12_103_IP=${Public_12_103_IP}"| tee -a ~/.bash_profile
echo "export Public_12_104_IP=${Public_12_104_IP}"| tee -a ~/.bash_profile
source ~/.bash_profile

