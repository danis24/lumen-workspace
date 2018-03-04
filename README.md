# Lumen Workspace Running On Docker Container

## Simple Examples

Assuming you have your app code at /home/danis24/myapp/, the below will be sufficient to serve it. Note that many Docker users encourage mounting data from a storage container, rather than directly from the filesyetem.

^ Default Lumen splash page: `docker run -p 80:80 -p 443:443 -d danis24/lumen-workspace` and browse to the host's IP address using http or https

* Serving your own app, with SSL support: `docker run -p 80:80 -p 443:443 -v /home/danis24/myapp/app/:/var/www/lumen/app/ -v /home/danis24/myapp/public/:/var/www/lumen/public/ -d danis24/lumen-workspace`
* ... without SSL support: `docker run -p 80:80 -v /home/danis24/myapp/app/:/var/www/lumen/app/ -v \ /home/danis24/myapp/public/:/var/www/lumen/public/ -d danis24/lumen-workspace`
* ... using non-standard ports: `docker run -p 8080:80 -p 8443:443 -v /home/danis24/myapp/app/:/var/www/lumen/app/ -v /home/danis24/myapp/public/:/var/www/lumen/public/ -d danis24/lumen-workspace`
