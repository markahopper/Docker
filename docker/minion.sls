"Spin up container1":
  dockerng.running:
    - name: Container1
    - image: minion:v0.5
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