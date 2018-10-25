#!/bin/bash

# Exit on fail
set -e

yarn install
exec "$@"