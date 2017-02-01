
clear

echo "$(date)   :   Starting to  bring virtual machines up :)"

vagrant up 

clear

echo "$(date)   : 3 virtual machines running now :) they are listed below"
vagrant status

echo "$(date)   :   connecting to kubernets, this may take some time for first time  please be patient :)"


export KUBECONFIG="$(pwd)/kubeconfig"

echo "$(date)   :   Waiting for kubernets to ready "
echo "------------------------------:" 

while [ $(./../kubectl get no | grep -c Ready) -lt 1 ]
do
   echo "$(date)   :   Please wait, we are retrying "
    sleep 30
done
clear

echo "$(date)   :   Kubernets is ready the following are the nodes"
echo "------------------------------:" 
./../kubectl get no
echo ""
