## Creating a  docker image for redis master slave 


#### Pre-Requisites

  1. Vagrant 
  2. Oracle virtual box 
  3. git 
  4. Linux/Mac OS 
  
###  	Steps . 
#### 	1. Create a linux virtiual machine (if you are running a non-linux machine) 

      1. Install vagrant & virtual box 
      2. Run the script in terminal 
	    
		  vagrant up
		  vagrant ssh
		  cd /vagrant
		
	
#### 		2. Build the redis image 
Prereq: install docker if you are  skipping step 1  
1. Run the script in terminal 
	
	
		docker build -t myredis3.2   .
	
	
2. see whether the image is build as below . 

	
		docker  images
	
	You should see below out put 

		[vagrant@redisimagebuilderv1 vagrant]$ docker  images
		REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
		myredis3            latest              9c58c6fe09bc        About a minute ago   9.399 MB
		alpine              3.5                 88e169ea8f46        2 weeks ago          3.98 MB
	

#### 		3. Test the redis image 
1. Run the script in terminal 
	```sh
		docker run -e MASTER=true  myredis3
	
	```
	You should see below out put 
	```sh
		
					    _.-``    `.  `_.  ''-._           Redis 3.2.5 (c72176ef/0) 64 bit
			  .-`` .-```.  ```\/    _.,_ ''-._                                   
			 (    '      ,       .-`  | `,    )     Running in standalone mode
			 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
			 |    `-._   `._    /     _.-'    |     PID: 6
			  `-._    `-._  `-./  _.-'    _.-'                                   
			 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
			 |    `-._`-._        _.-'_.-'    |           http://redis.io        
			  `-._    `-._`-.__.-'_.-'    _.-'                                                        


	```
	
#### 		4. Push the image to a docker repository .  
1. Run the script in terminal 
	```sh
	
		# tag the image .  
    		docker tag myredis3 jojiisacth/redis . 
		# push the image  
    		docker push   jojiisacth/redis
		
	```
