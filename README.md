# VirtualBox

## Update, install guest additions and upgrade
sudo apt-get -y update
sudo apt-get -y install -y virtualbox-guest-x11
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
reboot
sudo apt-get install linux-headers-$(uname -r)

## Setup shared folders
1. Share a folder in Virtualbox (sharename: icloudshare)
- If all is well then you should see sf_icloudshare in /media/
2. From here just symlink the shared folder `ln -s /media/sf_icloudshare/ /shared`

**If the above does not work out of the box then**
1. Mount Guestadditions ISO from Vmware
2. run `sh /media/cdrom/VBoxLinuxAdditions.run --nox11`

## Dotfiles
Generate RSA SSH keys:
`ssh-keygen -o -f ~/.ssh/id_rsa`

Add pubkey to Gitlab (https://gitlab.com/profile/keys)
`cat id_rsa.pub`

Clone dotfiles:
cd ~/
git clone git@gitlab.com:root4loot/dotfiles.git

Create symlinks:
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/xmodmap ~/.xmodmap
ln -s ~/dotfiles/i3 ~/.i3

## i3
apt-get -y install i3
reboot
xmodmap .xmodmap

# Packages

## Sublist3r
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
sudo pip install -r requirements.txt

