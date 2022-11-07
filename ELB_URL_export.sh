# !/bin/bash
# ELB URL export 
## ELB DNS Name
aws elbv2 describe-load-balancers --names ICNVPC-InternetALB1 | jq -r '.LoadBalancers[].DNSName'
export ICNVPC-InternetALB1-URL=$(aws elbv2 describe-load-balancers --names ICNVPC-InternetALB1 | jq -r '.LoadBalancers[].DNSName')
echo "export ICNVPC-InternetALB1-URL=${ICNVPC-InternetALB1-URL}"| tee -a ~/.bash_profile

aws elbv2 describe-load-balancers --names ICNVPC-InternetALB2 | jq -r '.LoadBalancers[].DNSName'
export ICNVPC-InternetALB2-URL=$(aws elbv2 describe-load-balancers --names ICNVPC-InternetALB2 | jq -r '.LoadBalancers[].DNSName')
echo "export ICNVPC-InternetALB2-URL=${ICNVPC-InternetALB2-URL}"| tee -a ~/.bash_profile

aws elbv2 describe-load-balancers --names ICNVPC-InternetNLB1 | jq -r '.LoadBalancers[].DNSName'
export ICNVPC-InternetNLB1-URL=$(aws elbv2 describe-load-balancers --names ICNVPC-InternetNLB1 | jq -r '.LoadBalancers[].DNSName')
echo "export ICNVPC-InternetNLB1-URL=${ICNVPC-InternetALB1-URL}"| tee -a ~/.bash_profile

aws elbv2 describe-load-balancers --names ICNVPC-InternetNLB2 | jq -r '.LoadBalancers[].DNSName'
export ICNVPC-InternetNLB2-URL=$(aws elbv2 describe-load-balancers --names ICNVPC-InternetNLB2 | jq -r '.LoadBalancers[].DNSName')
echo "export ICNVPC-InternetNLB2-URL=${ICNVPC-InternetNLB2-URL}"| tee -a ~/.bash_profile

source ~/.bash_profile



