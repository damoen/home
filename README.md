## Sharing folders in Virtualbox

apt-get update
apt-get upgrade-dist
apt-get install -y virtualbox-guest-x11
reboot
mount -t vboxsf nameofshareinvirtualbox pathtosharepoint
for presistence, add `pathtosharepoint nameofshareinvirtualbox vboxsf defaults 0 0`
