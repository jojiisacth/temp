 ##  Kubernets cluster on  Vagrant/virtual box 
 we creates  a Kubernets cluster on 3 virtual machines provisioned by vagrant & virtual box. The OS used is Core OS   . 
 These achines are used for 
    1. For hosting etcd  ( e1)
    2. For hosting the kubernets controller (c1)
    3. for hosting the kubernets worker  (w1)
     
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


Please use the script below to  access a pod in the cluster    
      
            cd cluster/coreos
            export KUBECONFIG="$(pwd)/kubeconfig"
            # To run some command on instance   
             ./../kubectl  exec -it  <podname>   bash
            # To see the log of an instance  
             ./../kubectl  logs   <podname> 