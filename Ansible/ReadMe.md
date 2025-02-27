
Objective
This section automates the configuration of the server by installing Docker and ensuring that it is set up to start automatically on boot. Ansible, an automation tool, was used to achieve this. The tasks completed include the installation of Docker and the necessary configurations.

Tasks Completed
Automated Docker Installation: Docker was installed on the Linux server using an Ansible playbook.
Docker Service Management: Ensured that the Docker service starts automatically on boot.
User Configuration: Added the current user to the Docker group, allowing them to execute Docker commands without needing sudo.

Ansible Playbook Details
1. Playbook: install_docker.yml
The playbook install_docker.yml contains the tasks required to install Docker and configure it to run on boot. The tasks in the playbook include:

Updating the package list: Ensures the package manager has the most recent list of available packages.
Installing Docker: Installs the Docker package on the server.
Starting Docker service: Ensures the Docker service is started and set to automatically start on system boot.
Adding the current user to the Docker group: Allows the user to execute Docker commands without using sudo.

- name: Install Docker on Linux Server
  hosts: all
  become: yes
  tasks:
    - name: Update package list
      apt:
        update_cache: yes
      when: ansible_os_family == 'Debian'
    
    - name: Install Docker
      apt:
        name: docker.io
        state: present
      when: ansible_os_family == 'Debian'

    - name: Start Docker service
      service:
        name: docker
        state: started
        enabled: yes

    - name: Add current user to Docker group
      user:
        name: "{{ ansible_ssh_user }}"
        group: docker
        append: yes

2. Inventory File: hosts.ini
The hosts.ini file defines the server(s) where Docker needs to be installed. In this case, it points to the EC2 instance running the Linux server. The ansible_ssh_user specifies the username (in this case, linux) for SSH access, and ansible_ssh_private_key_file specifies the private key file for authentication.

[servers]
54.195.171.73 ansible_ssh_user=linux ansible_ssh_private_key_file=../key-pair-111/Terraform-Test-Project-key-pair-111.pem
3. Ansible Commands
To run the playbook, use the following commands:

Ping the server to verify connection:

ansible -i hosts.ini all -m ping
Execute the playbook to install Docker:

ansible-playbook -i hosts.ini install_docker.yml
4. Verification
After running the playbook, verify the installation of Docker by SSHing into the server and running:

docker --version
This command will return the Docker version installed on the server, confirming that Docker was successfully installed.

Conclusion
By using Ansible to automate the Docker installation, we have simplified the process of configuring the server. This approach ensures consistency and can be replicated easily across multiple servers. The playbook can be extended for further automation tasks as needed.

