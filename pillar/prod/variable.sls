{% if grains['id'] == 'node1' %}
server_id: 1
master_ip: 192.168.56.141
{% elif grains['id'] == 'node2' %}
server_id: 2
master_ip: 192.168.56.140
{% endif %}
