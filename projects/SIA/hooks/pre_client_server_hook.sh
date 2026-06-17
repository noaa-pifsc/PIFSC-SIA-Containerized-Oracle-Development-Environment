#!/bin/bash

echo "This is the SIA pre client_server hook"

# load the SIA runtime configuration file
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../config/sia_runtime_config.sh"