# !/bin/bash
# EC2 ID export for access by Session Manager
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.101' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.102' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.103' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.104' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.101' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.102' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.103' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.104' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.21.101' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.21.102' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.21.103' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.21.104' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.22.101' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.22.102' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.22.103' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.22.104' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
export Public_11_101=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.101' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Public_11_102=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.102' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Public_11_103=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.103' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Public_11_104=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.11.104' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Public_12_101=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.101' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Public_12_102=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.102' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Public_12_103=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.103' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Public_12_104=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Public-10.11.12.104' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Prviate_21_101=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.21.101' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Prviate_21_102=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.21.102' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Prviate_21_103=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.21.103' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Prviate_21_104=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.21.104' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Prviate_22_101=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.22.101' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Prviate_22_102=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.22.102' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Prviate_22_103=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.22.103' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
export Prviate_22_104=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=ICNVPC-Private-10.11.22.104' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
echo "export Public_11_101=${Public_11_101}"| tee -a ~/.bash_profile
echo "export Public_11_102=${Public_11_102}"| tee -a ~/.bash_profile
echo "export Public_11_103=${Public_11_103}"| tee -a ~/.bash_profile
echo "export Public_11_104=${Public_11_104}"| tee -a ~/.bash_profile
echo "export Public_12_101=${Public_12_101}"| tee -a ~/.bash_profile
echo "export Public_12_102=${Public_12_102}"| tee -a ~/.bash_profile
echo "export Public_12_103=${Public_12_103}"| tee -a ~/.bash_profile
echo "export Public_12_104=${Public_12_104}"| tee -a ~/.bash_profile
echo "export Private_21_101=${Private_21_101}"| tee -a ~/.bash_profile
echo "export Private_21_102=${Private_21_102}"| tee -a ~/.bash_profile
echo "export Private_21_103=${Private_21_103}"| tee -a ~/.bash_profile
echo "export Private_21_104=${Private_21_104}"| tee -a ~/.bash_profile
echo "export Private_22_101=${Private_22_101}"| tee -a ~/.bash_profile
echo "export Private_22_102=${Private_22_102}"| tee -a ~/.bash_profile
echo "export Private_22_103=${Private_22_103}"| tee -a ~/.bash_profile
echo "export Private_22_104=${Private_22_104}"| tee -a ~/.bash_profile
source ~/.bash_profile
