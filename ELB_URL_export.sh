# !/bin/bash
# ELB URL export 
## ELB DNS Name
aws elbv2 describe-load-balancers --names ICNVPC-InternetALB1 | jq -r '.LoadBalancers[].DNSName'
export ICNVPC_InternetALB1_URL=$(aws elbv2 describe-load-balancers --names ICNVPC-InternetALB1 | jq -r '.LoadBalancers[].DNSName')
echo "export ICNVPC_InternetALB1_URL=${ICNVPC_InternetALB1_URL}"| tee -a ~/.bash_profile

aws elbv2 describe-load-balancers --names ICNVPC-InternetALB2 | jq -r '.LoadBalancers[].DNSName'
export ICNVPC_InternetALB2_URL=$(aws elbv2 describe-load-balancers --names ICNVPC-InternetALB2 | jq -r '.LoadBalancers[].DNSName')
echo "export ICNVPC_InternetALB2_URL=${ICNVPC_InternetALB2_URL}"| tee -a ~/.bash_profile

aws elbv2 describe-load-balancers --names ICNVPC-InternetNLB1 | jq -r '.LoadBalancers[].DNSName'
export ICNVPC_InternetNLB1_URL=$(aws elbv2 describe-load-balancers --names ICNVPC-InternetNLB1 | jq -r '.LoadBalancers[].DNSName')
echo "export ICNVPC_InternetNLB1_URL=${ICNVPC_InternetALB1_URL}"| tee -a ~/.bash_profile

aws elbv2 describe-load-balancers --names ICNVPC-InternetNLB2 | jq -r '.LoadBalancers[].DNSName'
export ICNVPC_InternetNLB2_URL=$(aws elbv2 describe-load-balancers --names ICNVPC-InternetNLB2 | jq -r '.LoadBalancers[].DNSName')
echo "export ICNVPC_InternetNLB2_URL=${ICNVPC_InternetNLB2_URL}"| tee -a ~/.bash_profile

source ~/.bash_profile



