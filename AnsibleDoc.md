# Ansible

Nodes for ansible:

10.2.2.140 172.16.6.189 node1
10.2.2.135 172.16.6.190 node2
10.2.2.139 172.16.6.191 node3
10.2.2.134 172.16.6.192 node4


It doesn't have any agents, It uses YAML language in form of Ansible Playbooks,


## Introduction
#### Efficient Architecture

  * Ansible works by connecting to node and pushing out small programs "Ansible Modules". It executes these modules(over SSH) and remove when finished.

#### SSH keys are friends

  * Ansible's "authorized_key" module can be used to control what machine can access ehat hosts.
  ```sh
  ssh-agent bash
  ssh-add ~/.ssh/id_rsa
  ```

#### Inventory management

  * Inventory can be managed using simple text file. For instance:
  ```sh 
  [webservers]
  www1.example.com
  www2.example.com

  [dbservers]
  db0.example.com
  db1.example.com
  ```

#### Playbooks

  * It can handle multiple slices of your infrastructure topology. 

Ansible is decentralized-it relies on existing OS credentials to control access to remote machines. It can be connected with kerberos,LDAP.


## Installation

#### Download and Set EPEL
  * `cd /opt/ && wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm` 
  * `rpm -ivh epel-release-latest-6.noarch.rpm`

#### Install Ansible
  * `yum install ansible -y`


## Adding SSH keys to every node for main server

  * `ssh-keygen -t rsa`
  * `ssh-copy-id -i ~/.ssh/id_rsa.pub root@<host>`

## First Command

#### Edit /etc/ansible/hosts file
  * Add `node[1:5]` which means node1, node2 ...

#### Pinging all nodes
  * `ansible all -m ping`

#### Hello on every node
  * `ansible all -a "/bin/echo hello"`

_If nodes are connecting for the first time the user has to authenticate if it would like to add it to known_hosts. This can be avoided by adding following line in __/etc/ansible/ansible.cfg__ :
`host_key_checking = False`_


## Different definition of hosts

  * Non-standard port: `badwolf.example.com:5309`
  * If we just have static ip: `jumper ansible_port=5555 ansible_host=192.168.1.50`
  * If lots of hosts: 
  `[webservers]
  www[01:50].example.com`

#### Running command on specific hosts (servers)

`ansible -m shell -a "hostname" servers`
  

## Few Ad-hoc commands

  * Changing mode: `ansible -m file -a "dest=~/testAnsible.txt mode=600"` servers
  * Deleting directory: `ansible all -m file -a "dest=~/testAnsible.txt state=absent"`
  * Adding user: ` ansible servers -m file -a "dest=/usr/bhavin mode=755 owner=bhavin group=bhavin state=directory"`
  * Adding user with __user__ module: `ansible all -m user -a "name=horton state=present"`
  * Creating director: `ansible servers -m file -a "dest=/usr/bhavin mode=755 owner=bhavin group=bhavin state=directory"`
  * To start a service: ` ansible servers -m service -a "name=ntpd state=started"` & state=restart to restart, state=stopped to stop
  * To gather fact about the machines: `ansible all -m setup`


## First Playbook

```json
- hosts: node1 
  remote_user: root
  tasks:
    - name: test connection using ping
      ping:
```