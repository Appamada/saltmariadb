mariadb-install:
  pkg.installed:
    - pkgs:
      - mariadb-server
      - mariadb


mariadb-config:
  file.managed:
    - name: /etc/my.cnf
    - source: salt://prestart/mariadb/files/my.cnf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
      server_id: {{ pillar['server_id'] }}
      master_ip: {{ pillar['master_ip'] }}
    - require:
      - pkg: mariadb-install

mariadb-start:
  service.running:
    - name: mariadb
    - enable: mariadb
    - require:
      - pkg: mariadb-install
      - file: mariadb-config
