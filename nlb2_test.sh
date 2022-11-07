!/bin/sh
date +"%y%m%d%H" >> ./$(date +"%y%m%d%H").txt
while true

do
STATUS=$(curl -# -o /dev/null -I -w %{http_code} -s -XGET ${ICNVPC_InternetNLB2_URL})

if [ $STATUS -eq 200 ]; then
echo sucess >> ./$(date +"%y%m%d%H").txt
else
count=$(($count+1))
echo fail >> ./$(date +"%y%m%d%H").txt
fi
count=$(($count+1))
echo $count >> $(date +"%y%m%d%H").txt
sleep 1

done