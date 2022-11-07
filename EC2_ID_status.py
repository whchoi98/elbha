#!/usr/bin/env python3

import boto3
import os

AWS_REGION = os.environ.get("AWS_REGION")
EC2_RESOURCE = boto3.resource('ec2', region_name=AWS_REGION)
INSTANCE_ID = os.envion.get("Public_11_101")

instances = EC2_RESOURCE.instances.filter(
    InstanceIds=[
        INSTANCE_ID,
    ],
)

for instance in instances:
    print(f'Instance {instance.id} state is {instance.state["Name"]}')
