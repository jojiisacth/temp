# Kubernets  experiments 
This repository is for experimenting with kubernets cluster  and application that are deployed in kubernets  clusters 

## Kubernets  
*  On Vagrant 
 we creates  a Kubernets cluster on 3 machines.  
    1. For hosting etcd  
    2. For hosting the kubernets controller  
    3. for hosting the kubernets worker  
     
    Please use the script below to bring the  cluster up and running  
        
            cd cluster/coreos
            ./clusterSetup.sh  


   Please see the [document](cluster/coreos/README.md) for details
*  On AWS
    TODO


## Redis 

### 1. Redis master slave  
Here we create a redis master and 2 slave instances. For that we creates 

     1. Replica set to run a container with redis running as master mode
     2. A service which will expose the redis master  so that redis slaves and other clients can acces it
     3. Resplica set to run  two container with redis running as slave to the above master. 
    
Please use the following scripts to  create the redis  deployment  
            
            cd redis/
            ./deployMasterSlave.sh

Please follow the [document](RedisMasterSlave.md) for details.
