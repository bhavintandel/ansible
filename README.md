## Usage

#### 1. Set PasswordLess SSH

#### 2. Set Ansible
`sh setEPEL.sh`

#### 3. If Java not present, install java
`ansible -i hosts installJava.yml`

#### 4. Run the HDP Setup
`ansible -i hosts site.yml`
