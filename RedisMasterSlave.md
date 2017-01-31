
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
we were using the prebuilt  docker images for this exeriment, if you want to  build it self please follow the steps
[read](./redis/ms/README.MD)
#### This complete this experiment :)
