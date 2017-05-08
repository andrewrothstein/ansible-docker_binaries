andrewrothstein.docker-binaries
===============================
[![CircleCI](https://circleci.com/gh/andrewrothstein/ansible-docker-binaries.svg?style=svg)](https://circleci.com/gh/andrewrothstein/ansible-docker-binaries)

Simple role to install the docker binaries. Does zero configuration.

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
