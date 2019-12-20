apache:
  pkg.installed:
    - name: httpd
  service.running:
    - name: httpd
    - enable: True
  file.managed:
    - name: /etc/httpd/conf/httpd.conf
    - source: salt://apache/files/httpd.conf
    - user: root
    - group: root
    - mode: 644
