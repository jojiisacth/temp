#!/bin/bash 
export KUBECONFIG="${KUBECONFIG}:$(pwd)/kubeconfig"
clear
echo 'Getting nodes'
echo '------------------------------:'
kubectl get no
echo ''

echo 'Reading pods'
echo '------------------------------:'
kubectl get po
echo ''


export Mater=`kubectl  get po | sed -n 2p  | awk -F " " '{print $1}'`
export slaveNode=`kubectl  get po | sed -n 3p  | awk -F " " '{print $1}'`
echo ''
echo '------------------------------:'
echo 'Redis Master is : '$Mater
echo 'Redis Slave is  : '$slaveNode

echo ''
echo '------------------------------:'
echo 'Inserting data to redis master'
export data='Redisdata'
export setresut=`kubectl exec $Mater   redis-cli set myval  $data `
echo 'master update status: '$setresut

echo ''
echo '------------------------------:'
echo 'Reading  data from  redis slave '


export result=`kubectl exec $Mater   redis-cli get myval` 
echo 'Result is:'$result 





if  [ $result == $data ] 
then
    echo 'Congrats redis set up is working :)'
else
    echo 'sorry there is something wrong with redis set up. :( '
fi 












