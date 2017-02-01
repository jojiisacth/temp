
# Redis Master Slave
This is an experimental master slave set up of redis on kubernets

####   Pre-Requisites 

      1. Vagrant 
      2. Oracle virtual box 
      3. git 
      4. Linux/Mac OS 

###  	Steps . 
#### 		1. download  or clone this repository into a linux/Mac OS  

       2. Run the script in terminal 
        
        		./runRedisMsLocal.sh
        		
        	

  Please wait for 10 - 20 - minutes for the cluster to come up, based on your net speed the time taken may vary.
	


3. finally you shuld see the following output on the terminal window  

```
      Tue Jan 31 12:36:46 IST 2017 Reading pods
      ------------------------------:
      NAME                READY     STATUS    RESTARTS   AGE
      redismaster-lwspv   1/1       Running   0          1m
      redisslave-j5wt3    1/1       Running   0          1m
      redisslave-k7r40    1/1       Running   0          1m
      
      
      ------------------------------:
      Redis Master is : redismaster-lwspv
      Redis Slave is  : redisslave-j5wt3
      
      ------------------------------:
      Tue Jan 31 12:36:47 IST 2017 Inserting data to redis master
      Tue Jan 31 12:36:47 IST 2017 master update status: OK
      
      ------------------------------:
      Tue Jan 31 12:36:47 IST 2017 Reading  data from  redis slave 
      Tue Jan 31 12:36:47 IST 2017 Result is:Redisdata
      Tue Jan 31 12:36:47 IST 2017 Congrats redis set up is working :)
```
		
#### Building docker images (Optional)  
we were using the prebuilt  docker images for this exeriment, if you want to  build it self please follow the
[steps in this document](./redis/ms/README.MD)

#### This complete this experiment :)

# Descriprion  

## Virtual machines 
  First we creates 3 CoreOS machines using vagrant and virtual box
###   1. e1
    This machine is used to host etcd service. which kubernets is depending on        
    To ssh into this machine please do the following 
        cd cluster/coreos/
        vagrant ssh e1
###   2. c1
    This machine is used to host kubernets master services     
     To ssh into this machine please do the following 
        cd cluster/coreos/
        vagrant ssh c1
###   3. w1
    This machine is used to host worker/slave nodes     
     To ssh into this machine please do the following 
        cd cluster/coreos/
        vagrant ssh w1
## Kubernetes Cluster  
    In this machies we set up the kubernets cluter
### How to access kubernets cluster after set up  
    Run the following scripts on terminal 
    
    ```
        export KUBECONFIG="$(pwd)/cluster/coreos/kubeconfig"
        ./cluster/kubectl get no  
    ```
    
### 1. Redis master slave  
Here  we created the following 

#### 1.  Replication Set (redismaster)  for  redis master
This replication set will run one the redis master pod. The redis master pod will host a docker instance for redis image, which will run redis service  on port  6379 as master 
#### 2.  Kubernet Service (redis-master) to expose redis master.  
This service will expose the above redis master service, The ip of this service will be on environment variable REDIS_MASTER_SERVICE_HOST, the port is 6379
        
#### 3. One replication set (redisslave) set for  redis slave 
This replication set will run two the redis slave pod. The redis slave pods will host a docker instance for redis image, which will run redis service  on port  6379 as slave 
        
        
 
 
 

