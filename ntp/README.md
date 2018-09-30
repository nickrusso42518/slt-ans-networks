# Basic NTP configuration manager
This simple playbook manages a subset of the Network Time Protocol (NTP)
configuration on a Cisco IOS device. It relies primarily on the built-in
idempotency of `ios_config` using `match: lines`, which has limitations.
For example, it can only check for existing configuration; removing
unneeded existing configuration is challenging and requires more logic.
This directory is for reference only as the course builds all this content
from scratch, potentially with minor deviations based on student
participation.
