"Spin up container1":
  dockerng.running:
    - name: Container1
    - image: markahopper/minion:v0.6
    - hostname: web1
    - tty: True
    - interactive: True
    - ports:
      - 80/tcp
    - port_bindings:
      - 8000:80/tcp
    - dns:
      - 8.8.8.8
      - 8.8.4.4
    - cmd:
      - salt-minion

mine_flush:
  cmd.run:
    - name: salt-call mine.flush
  require:
    - "Spin up container1"
