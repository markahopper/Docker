base:

  'G@roles:coolsite':
    - pip.install
#    - sites.coolsite
    - docker
    - nginx.docker-nojinja
#    - slack.test

  'G@roles:coolsite-ha':
    - haproxy.config
