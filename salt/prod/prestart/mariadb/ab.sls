include:
  - /prestart/mariadb/init

{% set master_ip = pillar['master_ip'] %}
{% set local_ip = grains['fqdn_ip4'][0] %}

mariadb-grant:
  cmd.run:
    - name: |
         mysql -h{{ local_ip }} -e "grant replication slave,replication client on *.* to repl_user@'192.168.56.%' identified by 'repl_user'"
    - unless: mysql -e "show grants for repl_user@'192.168.56.%';"
    - require:
      - service: mariadb-start

set-master-script:
  file.managed:
    - name: /tmp/set-master.sh
    - source: salt://prestart/mariadb/files/set-master.sh
    - user: root
    - group: root
    - mode: 755
    - template: jinja
    - defaults:
        local_ip: {{ grains['fqdn_ip4'][0] }}
        master_ip: {{ pillar['master_ip'] }}
    - require:
      - cmd: mariadb-grant
