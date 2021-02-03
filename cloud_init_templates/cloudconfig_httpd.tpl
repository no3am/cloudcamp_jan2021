#cloud-config
package_upgrade: true
packages:
  - apache2
  - aptitude
write_files:
- content: |
      <!DOCTYPE html>
      <html>
      <head>
          <title>Hello CloudCamp 2021</title>
      </head>
      <body>
          <h1>Hello CloudCamp 2021</h1>
      </body>
      </html>
  path: /var/www/html/index.html
runcmd:
  - sudo systemctl enable apache2
final_message: "The system is finally up, after $UPTIME seconds"