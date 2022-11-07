### 0. environment setup

1. git clone

```
git clone https://github.com/whchoi98/elbha.git

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
aws ec2 import-key-pair --key-name "eksworkshop" --public-key-material fileb://./mykey.pub --region ap-northeast-2
export mykey=mykey

```

6. Option - Applicable only when assigning Assume Role to Cloud9/terminal.

```
cat << EOF > ./AssumeRole.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
}
EOF

```

```
aws iam create-instance-profile \
    --instance-profile-name cloud9admin & \
aws iam create-role \
    --role-name cloud9admin \
    --assume-role-policy-document file://./AssumeRole.json &
aws iam add-role-to-instance-profile \
    --instance-profile-name cloud9admin \
    --role-name cloud9admin & \
aws iam attach-role-policy \
    --role-name cloud9admin \
    --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

```

```
aws ec2 describe-instances --filters 'Name=tag:Name,Values=*cloud9*' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId'
export cloud9_id=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values=*cloud9*' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[].InstanceId')
aws ec2 associate-iam-instance-profile --iam-instance-profile Name=test-role --instance-id $cloud9_id

```



