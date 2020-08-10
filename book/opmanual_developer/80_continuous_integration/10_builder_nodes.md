# CI Builder Nodes {#sec:ci-builder-nodes level=sec status=ready}

A builder node is simply a Docker endpoint accessible through the TCP port `2375`.

<minitoc/>


## Setup a new Ci Builder Node

CI Builder nodes are implemented on AWS EC2 instances.
To setup a new builder node, you need to:


### Create a new EC2 instance on AWS
You can create a new instance by visiting the
[AWS EC2 Dashboard](https://console.aws.amazon.com/ec2/).

We suggest the following AMIs:

- **arm32/64**: 
    `ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-arm64-server-20181120 (ami-01ac7d9c1179d7b74)`
- **amd64**:
    `ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20191113 (ami-00a208c7cdba991ea)`


### Setup passwordless SSH using the `ci-nodes` RSA keypair
On the Duckietown AWS account, a key-pair called `ci-nodes` holds the 
public key used to login into any CI-related node.

The private key is neither shared here nor stored on AWS for obvious
reasons. If you need it, ask Duckietown administrators.


### Assign an Elastic IP to your instance.
By assigning an AWS Elastic IP to your instance, you make sure that the
IP never changes, so that we can configure other tools with static IPs
pointing at each builder node.


### SSH in and install Docker
SSH into your newly created node and install Docker.

```bash
sudo apt install docker.io
```


### Setup crontab
Builder nodes will build many Docker images over the course of a few days.
If we don't have a way to keep them clean, they will run out of space in 
less than a week.

For this reason, we setup two cron jobs. The first one runs every day at 2AM
and removes all stopped containers and frees any unused resources 
(e.g. volumes). The second kicks in 1 hour later, at 3AM and removes all
unused images. In both jobs, only resources that are not used for more than
24 hours are freed.

You can setup the two cronjobs by running `crontab -e` and pasting the
following lines at the end of the file.

```cron
00 02 * * *     docker system prune --filter until=24h --force
00 03 * * *     docker image prune --filter dangling=true --filter until=24h --force
```


### Add the user `ubuntu` to the group `docker`
Use the following command to add the user `ubuntu` to the group `docker`.
This will give your user access to the local Docker engine.

```bash
sudo usermod -aG docker ubuntu
```

NOTE: You need to log out and back in for the changes to have an effect.


### Setup Docker TCP socket
The Master node is the one triggering builds on builder nodes.
For this to happen, each builder node has to make the Docker engine available
on a TCP port. 

In order to enable the Docker TCP socket, open the Docker service configuration
file.

```bash
sudo nano /lib/systemd/system/docker.service
```

Navigate to the `[Service]` section of the file and find the line

```
ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
```

and replace it with the following

```
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375 --containerd=/run/containerd/containerd.sock
```

This will give anybody access to your Docker engine over the internet.
Do not worry about possible intruders, we will configure the EC2 instance to
only accept connections on the port `2375` from the master node.

Save the file and reload (then restart) the Docker service with the following
commands:

```bash
sudo systemctl daemon-reload
sudo service docker restart
```

Test that your change had an effect by executing the command

```bash
curl http://localhost:2375/version
```

You should get a JSON string with info about the Docker engine.
If you get an error, redo this step.


### Configure EC2 instance to accept connections from the Master node only

Navigate to the AWS EC2 Dashboard page. Then click on `Instances` to the left.
Select the newly created builder node and select 
`Networking -> Change Security Groups` from the `Actions` menu at the top of
the list.
Add the group `[in]-Docker-API` to the security groups of your instance.
This allows your instance to accept connections from the Master node.