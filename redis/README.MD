## Redis 
### 1. Redis master slave  
Here we create a redis master and 2 slave instances. For that we creates 

        1. Replica set to run a container with redis running as master mode
        2. A service which will expose the redis master  so that redis slaves and other clients can acces it
        3. Resplica set to run  two container with redis running as slave to the above master. 
 
#### Single touch deployment    
Please use the following scripts to  create the redis  deployment  in one step. 
            
            cd redis/
            ./deployMasterSlave.sh

#### Step by steps deployment  
            
            cd redis/
            export KUBECONFIG="./../cluster/coreos/kubeconfig"
            # To deploy master  
            ./../cluster/kubectl create -f masterRs.yaml
            
            #To deploy service
            ./../cluster/kubectl create -f masterSrv.yaml
            
            #To deploy slave 
            ./../cluster/kubectl create -f slaveRs.yaml
#### Accessing the Redsis 
    #connect to master via  
        ./../cluster/kubectl exec -it <masterPodId>    bash  
        # start redis client  
        redis-cli  
        # set some value  
        set mykey myvalue 
        # Read the value 
        get mykey 
    #connect to slave via  
        ./../cluster/kubectl exec -it <slavePodId>    bash  
        # start redis client  
        redis-cli  
        # set some value  
        set mykey myvalue 
        # the above comamnd will not work as the slave cannot write , so you will get an error
        # Read the value 
        get mykey 
                
#### Accesssing the deplyment             
            #To see  status of deployments ( both master & redis)    
            ./../cluster/kubectl get po
            
            #To see all services 
            ./../cluster/kubectl get services 
            
            #To delete the master  
            ./../cluster/kubectl delete -f masterRs.yaml
            
            
             #To delete the  service
            ./../cluster/kubectl delete -f masterSrv.yaml
            
            #To delete the slave 
            ./../cluster/kubectl delete -f slaveRs.yaml
           
            #To increse the slave count to 5 
            ./../cluster/kubectl scale --replicas=5  rs/redisslave 
            
            
            
            
        
            
            
