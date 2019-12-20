include:
  - /prestart/mariadb/ab 


mariadb-ab-start:
  cmd.run:
    - name: /bin/bash /tmp/set-master.sh

    - require:
      - cmd: mariadb-grant
      - file: set-master-script
    
    - unless: test -f /var/lib/mysql/mysql.lock
