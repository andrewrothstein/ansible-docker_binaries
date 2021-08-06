andrewrothstein.docker-binaries
===============================
![Build Status](https://github.com/andrewrothstein/ansible-docker-binaries/actions/workflows/build.yml/badge.svg)

Install the docker binaries and bash completions. Does zero configuration.

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.docker-binaries
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
