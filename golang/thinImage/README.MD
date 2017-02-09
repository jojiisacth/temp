
## Light weight simple golang (based on gorilla/mux) api on kubernets 


Pre requisits : 
            1.  Any linux / Mac OS 

### 1. How to build the  docker image 
Run the script in terminal  

     
      ./buildImage.sh
      
###. Tag and upload the image to docker hub       
    docker tag  mythingolangapi jojiisacth/mythingolangapi
    docker push jojiisacth/mythingolangapi
    Note : if you getting accees denied error  log into docker hub via command 
            docker login  


### 2. How to deploy into kubernets 
   
 1. set the kubernets configuration  
    export KUBECONFIG="./../../cluster/coreos/kubeconfig" 
 2. create a replica set of the above image by running below script  
  
            kubectl create -f kub/apiRs.yaml
 3. create a service to expose the pods  by running below script  
              kubectl create -f kub/apisrv.yaml
    you will be able to acces the service via http://goapiservice:8081 inside the cluster 
    
 4. If yu are running the cluster on on cloud provider use the following script to  expose it on a loadbalancer 
           kubectl create -f kub/apiCloudsrv.yaml
5. To see the api working  
  


    export server=`kubectl  get po | sed -n 2p  | awk -F " " '{print $1}'`

    kubectl port-forward $server  8081:8081   &  
    curl http://localhost:8081
    curl http://localhost:8081/articles

You will out put as follows
    ````
                Jojis-MacBook-Pro:thinImage joji$ Forwarding from 127.0.0.1:8081 -> 8081
                Forwarding from [::1]:8081 -> 8081
                
                Jojis-MacBook-Pro:thinImage joji$ curl http://localhost:8081
                Handling connection for 8081
                wellcome to home page: 
                Jojis-MacBook-Pro:thinImage joji$ curl http://localhost:8081/articles
                Handling connection for 8081
                YOur articles: 
                Jojis-MacBook-Pro:thinImage joji$ curl http://localhost:8081/articles
                Handling connection for 8081
                YOur articles: 
                Jojis-MacBook-Pro:thinImage joji$ 
```


@END