#!/bin/bash

command cd
mitmdump -s proxy.py -k --ssl-insecure --set block_global=false
