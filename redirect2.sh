#!/bin/bash
script_name="$0"
text="$1"
echo "This is a test of redirection for ${script_name} using ${text}"

# disable previous exec redirection
exec > /dev/tty # restore STDOUT and STDERR
echo "This should be in standard output ${script_name} using ${text}"