
{% set workingdir = "/demo/web/site1" %}
# {% set sshkey = "ssh-key-acme" %}
# {% set env = grains.get('branch', 'dev') %}

"Pull in ACME site code":
  git.latest:
    - name: https://github.com/markahopper/ACME.git
    - target: {{ workingdir }}
#    - rev: {{ env }}
    - branch: master
#    - identity: /root/.ssh/{{ sshkey }}.priv
    - force_checkout: True

"Website Update":
  slack.post_message:
    - name: slack-message
    - channel: '#{{ pillar['slack']['channel'] }}'
    - from_name: {{ pillar['slack']['from_name'] }}
    - api_key: {{ pillar['slack']['api_key'] }}
    - message: 'The website has been updated from env={{ env }}'
