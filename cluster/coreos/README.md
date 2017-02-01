
*  On Vagrant 
 we creates  a Kubernets cluster on 3 machines.  
    1. For hosting etcd  
    2. For hosting the kubernets controller  
    3. for hosting the kubernets worker  
     
    Please use the script below to bring the  cluster up and running  
        
            cd cluster/coreos
            ./clusterSetup.sh  

 Please use the script below to  access the cluster  
      
            cd cluster/coreos
            export KUBECONFIG="$(pwd)/kubeconfig"
            # To see the nods  
            ./../kubectl get no 
            #To see the pods  
            ./../kubectl get po
             # To see the  replica set   
            ./../kubectl get rs 
            #To see the deplyment  
            ./../kubectl get  deplo 
