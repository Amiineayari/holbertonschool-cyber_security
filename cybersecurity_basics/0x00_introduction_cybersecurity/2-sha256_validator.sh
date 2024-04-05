#!/bin/bash
echo "$1 $(sha256sum "$1" | cut -d ' ' -f1)" | sha256sum -c --quiet --status