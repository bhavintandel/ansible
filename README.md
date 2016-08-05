## Ambari-Deployment
This repository aims at automating the cluster deployment by using configuration management tool ansible. We have writted this for RedHat distribution machine _centos 6.5_.


## Usage

#### 1. Set PasswordLess SSH

#### 2. Download the git
```
git clone https://github.com/CloudwickShared/ansible
cd ansible
```

#### 2. Set Ansible
`sh setEPEL.sh`

#### 3. If Java not present, install java
`ansible-playbook -i hosts installJava.yml`

#### 4. Run the HDP Setup
`ansible-playbook -i hosts site.yml`



## Optional

#### 1. To delete the services 
`ansible-playbook -i hosts cleanUp.yml`


** P.S. By default Ambari uses postgres, so while cleaning one need to drop database from psql to avoid ambari to reuse it. **
```
su - postgres
psql
drop database ambari
```

To check existing connection in psql
`Select * from pg_stat_activity;`



