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
 Please follow the [instructions](RedisMasterSlave.md) to run a redis master slave.
