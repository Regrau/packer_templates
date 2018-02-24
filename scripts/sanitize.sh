#!/bin/bash
# This script will change the password of the root user
# and remove any password authentication from the image.
# It also will bootstrap for ansible so we can execute
# our playbooks locally.

# Update all packages
zypper update --no-recommends \
    && zypper in ansible