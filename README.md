[![Build Status](
https://travis-ci.com/nickrusso42518/slt-ans-networks.svg?branch=master)](
https://travis-ci.com/nickrusso42518/slt-ans-networks)

# Safari Live Training - Ansible for Managing Network Devices
Source code for the training course. Please contact me with any questions.
Before beginning, be sure you know how to use `git` at a basic level on
your computer. For this course, only Linux platforms should be used for
the control/development machine.

> Contact information:\
> Email:    njrusmc@gmail.com\
> Twitter:  @nickrusso42518

  * [Download Instructions](#download-instructions)
  * [Usage](#usage)

## Download Instructions
The easiest way to consume this code is to clone it using SSH or HTTPS.

SSH: `git clone git@github.com:nickrusso42518/slt-ans-networks`

or

HTTPS: `git clone https://github.com/nickrusso42518/slt-ans-networks.git`

After cloning, you should see the following file system structure:

```
$ tree --charset=ascii
.
|-- getter
|   |-- ansible.cfg
|   |-- getter_playbook.yml
|   |-- group_vars
|   |   `-- routers.yml
|   |-- hosts.yml
|   `-- README.md
|-- LICENSE
|-- ntp
|   |-- ansible.cfg
|   |-- group_vars
|   |   `-- routers.yml
|   |-- hosts.yml
|   |-- ntp_playbook.yml
|   |-- README.md
|   `-- templates
|       `-- ntp_config.j2
|-- README.md
|-- requirements.txt
`-- requirements.yml
```

Ensure you have Python 3.6 or newer installed along with pip.

> Visit https://www.python.org/downloads/ to download Python.

`sudo python -m ensurepip`

or

`sudo easy_install pip`

You can install the specific packages using the following commands:

```
pip install -r requirements.txt
ansible-galaxy collection install -r requirements.yml
```

You should have access to the `ansible` command on the correct version.

```
$ ansible --version
ansible 2.10.11
  config file = /home/centos/code/racc/ansible.cfg
  configured module search path = ['/home/centos/.ansible/plugins/modules',
    '/usr/share/ansible/plugins/modules']
  ansible python module location =
    /home/centos/environments/ans3/lib/python3.7/site-packages/ansible
  executable location = /home/centos/environments/ans3/bin/ansible
  python version = 3.7.3 (default, Apr 28 2019, 11:01:35)
    [GCC 4.8.5 20150623 (Red Hat 4.8.5-36)]
```

## Usage
There are two main subdirectories, each containing their own project files.
The `getter/` subdirectory is a basic configuration runner and the `ntp/`
subdirectory performs basic line-level NTP configuration management.

These individual projects have their own READMEs which provides more
information about their main purpose in this course.
