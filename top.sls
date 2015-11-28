base:

  'G@roles:coolsite':
    - pip
    - git
    - sites.coolsite
    - docker
    - nginx.docker-nojinja
#    - slack.test

  'G@roles:coolsite-ha':
    - haproxy.config

  'G@roles:dockerhost':
    - pip
    - git
    - sites.coolsite
    - docker
    - nginx.docker-nojinja
#    - slack.test
