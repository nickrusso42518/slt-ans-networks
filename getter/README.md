# Basic information getter
This simple playbook runs arbitrary commands on a Cisco IOS network
device but lacks the sophistication of the `racc` playbook. This
directory is for reference only as the course builds all this content
from scratch, potentially with minor deviations based on student
participation.

The playbook only has two tasks:
  1. Run the show commands on the router as specified in the
     `group_vars/routers.yml`
  2. Print the output lines to standard output.

Basic variables example:

```
$ cat group_vars/routers.yml
---
ansible_network_os: "ios"
ansible_user: "ansible"
ansible_ssh_pass: "ansible"
commands:
  - "show ip route"
  - "show ip interface brief"
  - "show inventory"
```

Sample playbook run:

```
$ ansible-playbook getter_playbook.yml

PLAY [Collect information from router and print it] ***************************

TASK [Run commands on router] *************************************************
ok: [CSR1]

TASK [Print collected output] *************************************************
ok: [CSR1] => {
  "cli_output.stdout_lines": [
    [
      "Codes: L - local, C - conn, S - static, R - RIP, M - mobile, B - BGP",
      " D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area ",
      " N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2",
      " E1 - OSPF external type 1, E2 - OSPF external type 2",
      " i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2",
      " ia - IS-IS inter area, * - candidate default, U - per-user static rte",
      " o - ODR, P - periodic downloaded static route, H - NHRP, l - LISP",
      " a - application route",
      " + - replicated route, % - next hop override, p - overrides from PfR",
      "",
      "Gateway of last resort is 10.125.0.1 to network 0.0.0.0",
      "",
      "S*    0.0.0.0/0 [1/0] via 10.125.0.1, GigabitEthernet1",
      "      10.0.0.0/8 is variably subnetted, 2 subnets, 2 masks",
      "C        10.125.0.0/24 is directly connected, GigabitEthernet1",
      "L        10.125.0.61/32 is directly connected, GigabitEthernet1"
    ],
    [
      "Interface              IP-Address      OK? Method Status     Protocol",
      "GigabitEthernet1       10.125.0.61     YES DHCP   up         up      ",
      "VirtualPortGroup0      192.168.35.101  YES TFTP   up         up"
    ],
    [
      "NAME: \"Chassis\", DESCR: \"Cisco CSR1000V Chassis\"",
      "PID: CSR1000V          , VID: V00  , SN: 9CA4AE2P1J7",
      "",
      "NAME: \"module R0\", DESCR: \"Cisco CSR1000V Route Processor\"",
      "PID: CSR1000V          , VID: V00  , SN: JAB1303001C",
      "",
      "NAME: \"module F0\", DESCR: \"Cisco CSR1000V Embedded Services Proc\"",
      "PID: CSR1000V          , VID:      , SN:"
    ]
  ]
}
```
