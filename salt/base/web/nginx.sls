nginx-install:
  pkg.installed:
    - name: nginx


nginx-service:
  service.running:
    - name: nginx
    - enable: False
