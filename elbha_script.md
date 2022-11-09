### 0. environment setup

1. git clone & awscli version upgrade

```
git clone https://github.com/whchoi98/elbha.git
./awscli_upgrade.sh

```

2. Install SSM Plugin on the terminal (Cloud9 or Others Terminals). 

```
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm"
sudo sudo yum install -y session-manager-plugin.rpm

```

3. Install other utilities in the terminal.

```
sudo yum -y install jq gettext bash-completion moreutils

```

4. Create an ssh key in the terminal.

```
## Set the ssh key to "mykey".
ssh-keygen

```

5. Send the public key to the region and store the key value in a shell variable.

```
aws ec2 import-key-pair --key-name "mykey" --public-key-material fileb://./mykey.pub --region ap-northeast-2
export mykey=mykey
echo "export mykey=${mykey}" | tee -a ~/.bash_profile
source ~/.bash_profile

```

6. Option - Applicable only when assigning Assume Role to Cloud9/terminal.

```
aws iam create-instance-profile \
    --instance-profile-name cloud9admin &&\
aws iam create-role \
    --role-name cloud9admin \
    --assume-role-policy-document file://./AssumeRole.json && \
aws iam add-role-to-instance-profile \
    --instance-profile-name cloud9admin \
    --role-name cloud9admin && \
aws iam attach-role-policy \
    --role-name cloud9admin \
    --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

```

```
aws ec2 describe-instances --filters 'Name=tag:Name,Values=*cloud9*' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
export cloud9_id=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=*cloud9*' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
aws ec2 associate-iam-instance-profile --iam-instance-profile Name=cloud9admin --instance-id $cloud9_id

```

### 1. VPC depoloyment
Deploy a GWLB VPC and a test VPC.

```
### GWLB VPC
aws cloudformation deploy \
  --region ap-northeast-2 \
  --stack-name "GWLBVPC" \
  --template-file "/home/ec2-user/environment/elbha/gwlb.yaml" \
  --parameter-overrides "KeyPair=$mykey" \
  --capabilities CAPABILITY_NAMED_IAM
  
```
 
```
### Export vpc endpoint service name to shell variable
export VPCEndpointServiceName=$(aws ec2 describe-vpc-endpoint-services --filter "Name=service-type,Values=GatewayLoadBalancer" | jq -r '.ServiceNames[]')
echo $VPCEndpointServiceName

```

```
## Export Linux firewall based appliance to shell variable
./appliance_export.sh

```

```
### Workload VPC
### Create S3 bucket
export bucket_name="whchoi110801"
echo "export bucket_name=${bucket_name}" | tee -a ~/.bash_profile
aws s3 mb s3://${bucket_name}

aws cloudformation deploy \
  --region ap-northeast-2 \
  --stack-name "ICNVPC" \
  --template-file "/home/ec2-user/environment/elbha/ICNVPC.yaml" \
  --parameter-overrides "KeyPair=$mykey" "VPCEndpointServiceName=$VPCEndpointServiceName" \
  --capabilities CAPABILITY_NAMED_IAM \
  --s3-bucket ${bucket_name}

```
### 2. Configuring the environment for testing

1. Export the public IP of Cloud9 instance
```
### Cloud9 or Others EC2 IP address
aws ec2 describe-instances --filters 'Name=tag:Name,Values=*cloud9*' | jq -r '.Reservations[].Instances[].PublicIpAddress'
export cloud9_public_ip=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=*cloud9*' | jq -r '.Reservations[].Instances[].PublicIpAddress')
echo "export cloud9_public_ip=${cloud9_public_ip}"| tee -a ~/.bash_profile
source ~/.bash_profile

```

2. Export the EC2 ID of Public/Private EC2 Instances

```
./ec2_id_export.sh

```

```
./ec2_public_ip.sh

```

3. Export the ELB URL of ALB/NLB

```
./ELB_URL_export.sh
   
```

4. SChange PEM key permission for SCP Test.
   
```
mv ./mykey ./mykey.pem
chmod 400 ./mykey.pem

```

### Connect to the Linux Firewall and EC2

1. Connect to the Linux firewall by ssm

```
aws ssm start-session --target $Appliance_11_101
aws ssm start-session --target $Appliance_11_102
aws ssm start-session --target $Appliance_12_101
aws ssm start-session --target $Appliance_12_102

```

```
sudo su ec2-user
export cloud9_public_ip="$cloud9_public_ip"
echo "export cloud9_public_ip=${cloud9_public_ip}"| tee -a ~/.bash_profile

sudo tcpdump -nvv 'port 6081'| grep ${cloud9_public_ip}
tcpdump -i eth0 source ${cloud9_public_ip}
#XFF Filter / HTTP GET
sudo tcpdump -i enp0s8 -s 0 -A 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420' | grep ${cloud9_public_ip}
##XFF Filter / HTTP NGINX,Apach
sudo tcpdump -i enp0s8 -s 0 -A 'tcp dst port 80 and tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420' | grep ${cloud9_public_ip}

```

2. conntect to EC2 Instance

```
aws ssm start-session --target $Public_11_101
aws ssm start-session --target $Public_11_102
aws ssm start-session --target $Public_11_103
aws ssm start-session --target $Public_11_104
aws ssm start-session --target $Public_12_101
aws ssm start-session --target $Public_12_102
aws ssm start-session --target $Public_12_103
aws ssm start-session --target $Public_12_104
aws ssm start-session --target $Private_11_101
aws ssm start-session --target $Private_11_102
aws ssm start-session --target $Private_11_103
aws ssm start-session --target $Private_11_104
aws ssm start-session --target $Private_12_101
aws ssm start-session --target $Private_12_102
aws ssm start-session --target $Private_12_103
aws ssm start-session --target $Private_12_104

```

3. Testing of SCP transfer in Cloud9.

```
scp -i ./mykey.pem ec2-user@3.36.76.21:/home/ec2-user/10G.dummy ./
script -c "scp -i ./mykey.pem ec2-user@Public_11_101:/home/ec2-user/10G.dummy ./" scplog.txt
```

curl format 1

```
while true; do echo -n "$(date) - " ; curl -w @curl-time-format.txt -o /dev/null -s $Public_11_101_IP; sleep 1; done >> result1.txt

curl-time-format.txt
t_nslookup: %{time_namelookup} t_connect: %{time_connect} t_pretransfer:%{time_pretransfer} t_redirect:%{time_redirect} t_starttransfer:%{time_starttransfer} t_total:%{time_total}
\n

```

curl format2
```
curl-format.txt
  \n
  time_namelookup:     %{time_namelookup}s\n
  time_connect:        %{time_connect}s\n
  time_appconnect:     %{time_appconnect}s\n
  time_pretransfer:    %{time_pretransfer}s\n
  time_redirect:       %{time_redirect}s\n
  time_starttransfer:  %{time_starttransfer}s\n
  -----------------------------------------\n
  \n
          time_total:  %{time_total}s\n
  \n
while true; do curl -w "@curl-format.txt" -o /dev/null -s $Public_11_101_IP ; sleep 1 ; done
```

EC2 Stop & Start & reboot
```
aws ec2 stop-instances --instance-ids $instance-id
aws ec2 start-instances --instance-ids $instance-id
aws ec2 reboot-instances --instance-ids $instance-id
```



