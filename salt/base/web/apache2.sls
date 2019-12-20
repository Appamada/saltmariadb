apache-install:  
  pkg.installed:  
#    - name: apahce
    - name: {{ pillar['apache'] }}

apache-service:
  service.running:
#    - name: httpd
    - name: {{ pillar['apache'] }}
    - enable: True


