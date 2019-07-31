[![Build Status](https://travis-ci.org/CSCfi/ansible-role-rally-scenarios.svg?branch=master)](https://travis-ci.org/CSCfi/ansible-role-rally-scenarios)

# ansible-role-rally-scenarios

This role is is meant to be used together with ansible-role-rally.

This role will configure rally deployments and optionally tempest verifiers for each cloud you specify. The role uses the http_proxy and https_proxy environment variables for access to e.g. the installation of rally/tempest and retrieval of Cirros images.

If tempest verifiers are configred, this role will deploy the necessary shell scripts to start tempest verifications, but the role will not trigger the tempest verifications itself.

## Configuration

You can find an example of all the varibles the role uses under defaults/main.yml

## Usage

```
---
- name: Configure rally
  hosts: rally_server
  become: true
  roles:
    - ansible-role-rally
    - ansible-role-rally-scenarios
  environment: "{{ proxy_env }}"
```
