#cloud-config
package_update: true
package_upgrade: true
packages:
- openssh-server
- cifs-utils
groups:
 - sftpusers
groups:
  - sftp_users
users:
  - name: sftp_user
    primary_group: sftp_users
    groups: sftp_users
    no_create_home: true
    no_user_group: true
  - name: devops
    ssh-authorized-keys:
      - ssh-rsa <rsa-key-here>
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    groups: sudo
    shell: /bin/bash
chpasswd:
  list: |
    sftp_user:W3lcome!@
  expire: False
write_files:
  - path: /etc/ssh/sshd_config
    content: |
         Port 22
         Protocol 2
         HostKey /etc/ssh/ssh_host_rsa_key
         HostKey /etc/ssh/ssh_host_dsa_key
         HostKey /etc/ssh/ssh_host_ecdsa_key
         HostKey /etc/ssh/ssh_host_ed25519_key
         UsePrivilegeSeparation yes
         KeyRegenerationInterval 3600
         ServerKeyBits 1024
         SyslogFacility AUTH
         LogLevel INFO
         LoginGraceTime 120
         PermitRootLogin no
         StrictModes yes
         RSAAuthentication yes
         PubkeyAuthentication yes
         IgnoreRhosts yes
         RhostsRSAAuthentication no
         HostbasedAuthentication no
         PermitEmptyPasswords no
         ChallengeResponseAuthentication no
         X11Forwarding yes
         X11DisplayOffset 10
         PrintMotd no
         PrintLastLog yes
         TCPKeepAlive yes
         AcceptEnv LANG LC_*
         Subsystem sftp internal-sftp
         UsePAM yes
         ClientAliveInterval 120
         Match Group sftp_users
         PasswordAuthentication yes
         X11Forwarding no
         AllowTcpForwarding no
         ChrootDirectory /home/%u
         ForceCommand internal-sftp
######
# ADD CODE HERE TO TACKLE STORAGE BEING ON AZURE FILE SHARE
######
runcmd:
 - echo "Created by Azure terraform-vmss-cloudinit module." | sudo dd of=/tmp/terraformtest &> /dev/
 - sudo systemctl start ssh.service
 - sudo systemctl enable ssh.service