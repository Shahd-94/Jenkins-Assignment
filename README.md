# Jenkins Assignment


## Docker Compose setup of a Jenkins - Distributed Builds 

Under this project, you can find a Jenkins server configurations, using Docker Compose, that is able to trigger jobs by launching container agents to perform tasks/jobs.
Agent containers images are customized with the relevant dependencies via the Dockerfile provided in the source code.
This setup is already configured in AWS. If you are an eligible user, then you can inspect & use this setup by following the Prerequisites below (Check your email to find if you are an eligible user ;) ).


### Prerequisites to access the Cloud hosted project (For Eligible Users Only): 

* Install VPN - Pritunl Client, installation files can be found here --> https://client.pritunl.com/
* Configure VPN Profile (Credentials have been sent via email). Note that you need to import the provided profile as is, and scan the barcode provided in you Google Authentication app, in order to provide OTP.
* Download and Configure any SSH Client (Credentials have been sent via email).
* You can ssh to the Jenkins server through the VPN only (Credentials have been sent via email).
* You can navigate to the Jenkins UI/Console through the VPN only (Credentials have been sent via email).


## Usage on Cloud (For Eligible Users Only):

* Clone the repository to any machine, per your choice.
* Commit, Push and merge any changes that you need.
* When any branch get merged to the Master branch, Jenkins will launch a new agent container and the Job will trigger automatically.
* The full setup can be found under /opt/assignment



### Prerequisites to run this code locally: 

* Docker and Docker Compose Setup (Docker Compose 3.8 syntax version) - Older versions can be installed with aligning the relevant properties in the configuration files.
* Port 4243: Docker Remote API port. 
* Ports 32768 to 60999: used by Docker to assign a host port for Jenkins to connect to the container.
* Update the docker service file /lib/systemd/system/docker.service. Search for ExecStart and replace that line with the following:

'''

ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock

'''

* Create a public Github Repo, and configure a Webhook with Merge/PullRequest filters to your Jenkins machine (Provide Jenkins Host URL).
* Add to your payload url a token query string --> YourJenkinsURL/generic-webhook-trigger/invoke?token=123456  where 123456 is your token that you should use in the jenkins job.

## Usage for a fresh setup / locally:

* Run Docker-Compose up -d or Docker Compose up -d (If you are using the Compose Plugin)
* If you are running this locally, then you might need to change Jenkins Host URL in the Configuration to localhost.
* Configure the Jenkins job and change its token field according to the token you set in the Github webhook, Save and Apply.
* Clone the repository to any machine, per your choice.
* Commit, Push and merge any changes that you need.
* When any branch get merged to the Master branch, Jenkins will launch a new agent container and the Job will trigger automatically.
