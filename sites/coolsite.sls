# Cool site pulls from
# https://github.com/trebortech/ACME.git

include:
  - git

{% set workingdir = "/demo/web/site1" %}
{% set sshkey = "ssh-key-acme" %}
{% set env = grains.get('branch', 'dev') %}

####### STAGE KEYS #####################

"Push ssh keys for github":
  file.managed:
    - name: /root/.ssh/{{ sshkey }}.priv
    - source: salt://files/{{ sshkey }}.priv
    - makedirs: True
    - mode: 600
    - user: root
    - group: root

####### PULL IN ACME DEV CODE ##########

"Pull in ACME site code":
  git.latest:
    - name: git@github.com:trebortech/ACME.git
    - target: {{ workingdir }}
    - rev: {{ env }}
    - branch: {{ env }}
    - identity: /root/.ssh/{{ sshkey }}.priv
    - force_checkout: True
    - require:
        - pkg: 'GIT software'

####### UPDATE GIT CONFIG  #############
"Setup {{ env }} email config":
  git.config_set:
    - name: user.email
    - value: rbooth@saltstack.com
    - repo: {{ workingdir }}
    - require:
        - git: "Pull in ACME site code"

"Setup {{ env }} name config":
  git.config_set:
    - name: user.name
    - value: trebortech
    - repo: {{ workingdir }}
    - require:
        - git: "Pull in ACME site code"

"Setup core editor":
  git.config_set:
    - name: core.editor
    - value: vim
    - repo: {{ workingdir }}
    - require:
        - git: "Pull in ACME site code"

