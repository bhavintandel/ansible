## Using Ambari blueprints on preset cluster

#### 1. Make sure you have prerequisite installed on all the nodes

#### 2. Ensure that ambari-agent can connect to ambari-server by _heartbeat_

#### 3. To check if ambari-agents are registered::
	`curl -u admin:admin -H  X-Requested-By:ambari http://localhost:8080/api/v1/hosts`

#### 4. To register the blueprint:
	`curl -H "X-Requested-By: ambari" -X POST -u admin:admin http://localhost:8080/api/v1/blueprints/blueprintMulti -d @blueprintMulti.json`

#### 5. To deploy the cluster by mapping hosts:
	`curl -H "X-Requested-By: ambari" -X POST -u admin:admin http://172.16.6.189:8080/api/v1/clusters/blueprintMulti -d @hostMapping.json`

**P.S. Use your ambari-server FQDN in place of localhost if you are running from other machine**


## (Optional)

#### 1. To map HDP & HDP Utils repo with base url or local repo
	`curl -H "X-Requested-By: ambari" -X PUT -u admin:admin http://localhost:8080/api/v1/stacks/HDP/versions/2.4/operating_systems/redhat6/repositories/HDP-2.4 -d @repo.json`
	`curl -H "X-Requested-By: ambari" -X PUT -u admin:admin http://localhost:8080/api/v1/stacks/HDP/versions/2.4/operating_systems/redhat6/repositories/HDP-UTILS-1.1.0.20 -d @hdpUtils.json`

#### 2. To delete blueprint 
	`curl -u admin:admin  -H  X-Requested-By:ambari -X DELETE http://localhost:8080/api/v1/blueprints/blueprintMulti`

#### 3. To add host (node3.hc.com)
	`curl -H "X-Requested-By: ambari" -X POST -u admin:admin http://localhost:8080/api/v1/clusters/blueprintMulti/hosts/node3.hc.com -d @ addHost.json`
