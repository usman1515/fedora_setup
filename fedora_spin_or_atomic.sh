#!/bin/bash

# Check if the rpm-ostree command exists and is active
if command -v rpm-ostree &> /dev/null && rpm-ostree status &> /dev/null; then
    echo "Fedora Atomic: YES (Immutable / OSTree-based system)"
else
    echo "Fedora Atomic: NO (Standard DNF-based system)"
fi
