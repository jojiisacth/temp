#!/bin/bash 

cd cluster/coreos/
vagrant up 

cd .. 
cd ..

export KUBECONFIG="$(pwd)/cluster/coreos/kubeconfig"
clear
echo 'Waiting for kubernets to ready '
echo '------------------------------:' 
while [ $(./cluster/kubectl get no | grep -c Ready) -lt 1 ]
do
    echo "Please wait"
    sleep 10
done

echo 'Kubernets is ready the following are the nodes'
echo '------------------------------:' 
kubectl get no
echo ''


echo 'Creating redis Master slave nodes'
echo '------------------------------:' 
    ./cluster/kubectl create -f ./redis/masterRs.yaml
    ./cluster/kubectl create -f ./redis/masterSrv.yaml
    ./cluster/kubectl create -f ./redis/slaveRs.yaml
echo ''


while [ $(./cluster/kubectl get po | grep -c Running) -lt 3 ]
do
    echo "Please wait  a bit for redis master slave set up is ready "
    sleep 10
done


echo 'Reading pods'
echo '------------------------------:'
./cluster/kubectl get po
echo ''



export Mater=`./cluster/kubectl  get po | sed -n 2p  | awk -F " " '{print $1}'`
export slaveNode=`./cluster/kubectl  get po | sed -n 3p  | awk -F " " '{print $1}'`
echo ''
echo '------------------------------:'
echo 'Redis Master is : '$Mater
echo 'Redis Slave is  : '$slaveNode

echo ''
echo '------------------------------:'
echo 'Inserting data to redis master'
export data='Redisdata'
export setresut=`./cluster/kubectl exec $Mater   redis-cli set myval  $data `
echo 'master update status: '$setresut

echo ''
echo '------------------------------:'
echo 'Reading  data from  redis slave '


export result=`./cluster/kubectl exec $Mater   redis-cli get myval` 
echo 'Result is:'$result 





if  [ $result == $data ] 
then
    echo 'Congrats redis set up is working :)'
else
    echo 'sorry there is something wrong with redis set up. :( '
fi 












