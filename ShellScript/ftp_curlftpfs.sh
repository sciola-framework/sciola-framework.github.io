#!/bin/bash

# FTP mount
debian@debian:~$ curlftpfs -o user=www-data:your_password_here ftp.localhost /path/to/dir/FTP

# FTP unmount
debian@debian:~$ fusermount -u /path/to/dir/FTP
