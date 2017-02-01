

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
