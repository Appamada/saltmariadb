{% set var = pillar['master_ip'] %}
{% set local_ip = grains['fqdn_ip4'][0] %}
test:
  cmd.run:
    - name: a=3; echo "my name is {{ var }}, ip is {{ local_ip }}" ; echo "a"
    
