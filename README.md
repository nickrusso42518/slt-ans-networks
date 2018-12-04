[![Build Status](
https://travis-ci.org/nickrusso42518/slt-ans-networks.svg?branch=master)](
https://travis-ci.org/nickrusso42518/slt-ans-networks)

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
  * [Testing](#testing)

## Download Instructions
The easiest way to consume this code is to clone it using SSH or HTTPS.

SSH: `git clone git@github.com:nickrusso42518/slt-ans-networks`

or

HTTPS: `git clone https://github.com/nickrusso42518/slt-ans-networks.git`

After cloning, you should see the following file system structure:

```
$ tree
.
├── getter
│   ├── ansible.cfg
│   ├── getter_playbook.yml
│   ├── group_vars
│   │   └── routers.yml
│   ├── hosts.yml
│   └── README.md
├── LICENSE
├── Makefile
├── ntp
│   ├── ansible.cfg
│   ├── group_vars
│   │   └── routers.yml
│   ├── hosts.yml
│   ├── ntp_playbook.yml
│   ├── README.md
│   └── templates
│       └── ntp_config.j2
├── README.md
└── requirements.txt
```

Ensure you have Python 2.7 (not Python 3) installed along with pip.

> Visit https://www.python.org/downloads/ to download Python.

`sudo python -m ensurepip`

or

`sudo easy_install pip`

You can install the specific packages (really just Ansible and a YAML linter)
using the  following command:

`pip install -r requirements.txt`

You should have access to the `ansible` command on the correct version.

```
$ ansible --version
ansible 2.6.2
```

## Usage
There are two main subdirectories, each containing their own project files.
The `getter/` subdirectory is a basic configuration runner and the `ntp/`
subdirectory performs basic line-level NTP configuration management.

These individual projects have their own READMEs which provides more
information about their main purpose in this course.

## Testing
A GNU Makefile with phony targets is used for testing this codebase.
There is currently only one step:
  * `lint`: Runs YAML linter. This captures any syntax or
    styling errors with the Ansible playbooks or variable files.

You can run `make lint` to execute the testing manually. Because these two
projects are used for reference only and are not cloned into the course,
more detailed testing is not needed. They are kept as simple as possible for
learning purposes. The production playbooks `racc` and `natm` have more
comprehensive testing via CI.
