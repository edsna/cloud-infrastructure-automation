#Udacity DevOps Engineer Course Project-2

Deploy a high-availability web app using CloudFormation


This source code deploys the Udagram application, along with the necessary supporting software into its matching infrastructure.
The project is split into two parts:
    1 - Develop a diagram that can be presented as part of my portfolio and as a visual aid to understand the CloudFormation script. And
    2 - Interpret the instructions as well as my own diagram and create a matching CloudFormation script.

Execute Instructions
This application was designed with a shell executable script (shell-Exec.sh) that creates and updates the stack checking for minor procedures such as existance of stack and others.

If you wish to execute this project,
clone the repository, 
Create the Udagram infrastructure
    chmod +x shell-Exec.sh    
    ./shell-Exec.sh udagram udagram-Configurations.yml udagram-Params.JSON

And create the compute resources 
    ./shell-Exec.sh srvs servers-Configurations.yml servers-Params.json

To check its functionality
   copy its DNS from the load balancer's list under EC2 and execute it in any browser# udagramFinal
# udagramFinal
# udagramFinal
