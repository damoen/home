## Sharing folders in Virtualbox

apt-get update

apt-get upgrade-dist

apt-get install -y virtualbox-guest-x11

reboot

mount -t vboxsf <name_of_share> /path/to/mountpoint

for persistence, add `<name_of_share>   /path/to/mountpoint   vboxsf   <options>  0   0` to /etc/fstab
