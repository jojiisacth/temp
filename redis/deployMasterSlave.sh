clear
echo "$(date)   :   deploying the redis master replica set , master service and slave replica set to kubernets "
export KUBECONFIG="./../cluster/coreos/kubeconfig"

echo "$(date)   :   Waiting for kubernets to ready "
echo "------------------------------:" 
while [ $(./../cluster/kubectl get no | grep -c Ready) -lt 1 ]
do
    echo "$(date)   :    Please wait"
    sleep 30
done

echo "$(date)   :   Kubernets is ready the following are the nodes"
echo "------------------------------:" 
./../cluster/kubectl get no
echo ""


echo "$(date)   :   Creating redis Master slave nodes"
echo "------------------------------:" 
    ./../cluster/kubectl create -f masterRs.yaml
    ./../cluster/kubectl create -f masterSrv.yaml
    sleep 5
    ./../cluster/kubectl create -f slaveRs.yaml
echo ""


while [ $(./../cluster/kubectl get po | grep -c Running) -lt 3 ]
do
    echo "$(date) Please wait  a bit for redis master slave set up is ready "
    sleep 20
done

echo "$(date) Reading pods"
echo "------------------------------:"
./../cluster/kubectl get po
echo ""