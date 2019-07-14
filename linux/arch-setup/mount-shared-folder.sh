#!/bin/sh
echo "Mounting shared folder to /media"
sudo mount -t vboxsf vm-shared /media/sf_vm-shared
echo "Done"
