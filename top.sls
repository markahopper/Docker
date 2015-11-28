base:

  'G@roles:coolsite':
    - pip
    - sites.coolsite
    - docker
    - nginx.docker-nojinja
#    - slack.test

  'G@roles:coolsite-ha':
    - haproxy.config

  'dockerhost3':
    - pip
    - sites.coolsite
    - docker
    - nginx.docker-nojinja
#    - slack.test
