# UNDER CONSTRUCTION

### Ansible Development - Overview

##### 1. Style Guide
[Style Guide for Python Code](https://www.python.org/dev/peps/pep-0008/ "Style Guide for Python Code")
- Our style guide for coding modules.

##### 2. Python 3 compatible code
[Cheat Sheet: Writing Python 3 compatible code](https://python-future.org/compatible_idioms.html " Writing Python 2-3 compatible code")
- Cheat Sheet for writing compatible pyhton code

##### 3. Ansible Structure
[Playbook Directory](tree/master/ansible/playbook "playbook")
- Contains all playbooks, which are required to run the ansible modules.

[Module Directory](tree/master/ansible/module "module")
- Contains all modules. Our modules are kind of wrapper because the are using classes from directory "module_utils"

[Module Utils Directory](tree/master/ansible/module_utils "module_utils")
- Contains all classes.

### SDKs
3rd party sdks are available and necessary for api communication between the ansible module and the
target device. It is much more robust and programmable than ssh commands.

### Filter Plugins
Ansible Filter Classes to manipulate ansible facts and vars
[ansible filter_plugins](ansible/filter_plugins)
set

```zsh
[defaults]
filter_plugins     = /path/to/filter_plugins
```

in your ansible.cfg
