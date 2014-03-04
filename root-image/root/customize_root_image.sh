#!/bin/bash
set -e -u

pacman -Rdd --noconfirm linux

sed -i 's/#\(pl_PL\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

pushd /usr/share/locale
  shopt -s extglob
  rm -rf !(pl|pl_PL)
popd
rm -rf /usr/include/* /usr/share/doc /usr/share/man /usr/share/gtk-doc

ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

useradd -m -p "" -g users -G "adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel" -s /usr/bin/bash arch

chmod 750 /etc/sudoers.d
chmod 440 /etc/sudoers.d/g_wheel

sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

systemctl enable multi-user.target
