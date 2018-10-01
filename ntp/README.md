# Basic NTP configuration manager
This simple playbook manages a subset of the Network Time Protocol (NTP)
configuration on a Cisco IOS device. It relies primarily on the built-in
idempotency of `ios_config` using `match: lines`, which has limitations.
For example, it can only check for existing configuration; removing
unneeded existing configuration is challenging and requires more logic.
This directory is for reference only as the course builds all this content
from scratch, potentially with minor deviations based on student
participation.

The playbook only has one task and one handler:
  1. Idempotently add NTP configuration in accordance with
     the state defined in the `group_vars/routers.yml` file
  2. Run the handler to print changes if necessary.

Basic variables example:

```
---
ansible_network_os: "ios"
ansible_user: "ansible"
ansible_ssh_pass: "ansible"
ntp:
  authenticate: true
  auth_keys:
    - id: 1
      secret_hash: "0832494D1B1C113C17125D557B"  # secretKey111
    - id: 2
      secret_hash: "111A1C0605171F27013379767A"  # secretKey222
  servers:
    - ip: "192.0.2.1"
      key_id: 1
    - ip: "192.0.2.2"
      key_id: 2
```

Sample playbook runs:

```
$ ansible-playbook ntp_playbook.yml

PLAY [Manage NTP configuration] **********************************************

TASK [Apply NTP updates using jinja2 template] *******************************
changed: [CSR1]

RUNNING HANDLER [Print changes since NTP was updated] ************************
ok: [CSR1] => {
  "ntp_updates.updates": [
    "ntp authenticate",
    "ntp authentication-key 1 md5 0832494D1B1C113C17125D557B 7",
    "ntp authentication-key 2 md5 111A1C0605171F27013379767A 7",
    "ntp server 192.0.2.1 key 1",
    "ntp server 192.0.2.2 key 2"
  ]
}

$ ansible-playbook ntp_playbook.yml

PLAY [Manage NTP configuration] **********************************************

TASK [Apply NTP updates using jinja2 template] *******************************
ok: [CSR1]
```
