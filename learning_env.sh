#!/bin/bash
echo "Launching SIAB!"
/etc/init.d/lighthttpd start && /usr/local/bin/shellinaboxd -t -b && tail -f /dev/null
echo "Running SIAB"
