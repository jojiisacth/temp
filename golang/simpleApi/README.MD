## Simple golang (based on gorilla/mux) api on kubernets 



### 1. How to build the  docker image 

1. spin up a vagrant machine  run script  
[optional: if you are not running a linux box ] 
        vagrant up  
        vagrant ssh 
        cd /vagrant 

2.  build the image 
    docker build -t mygolangapi .
3. Tag and upload the image to docker hub       
    docker tag  mygolangapi jojiisacth/mygolangapi
    docker push jojiisacth/mygolangapi
    Note : if you getting accees denied error  log into docker hub via command 
            docker login  
### 2. How to deploy into kubernets 
 1. create a replica set of the above image by running below script  
            kubectl create -f kub/apiRs.yaml
 2. create a service to expose the pods  by running below script  
              kubectl create -f kub/apisrv.yaml
    you will be able to acces the service via http://goapiservice:8081 inside the cluster 
    
 3. If yu are running the cluster on on cloud provider use the following script to  expose it on a loadbalancer 
           kubectl create -f kub/apiCloudsrv.yaml



