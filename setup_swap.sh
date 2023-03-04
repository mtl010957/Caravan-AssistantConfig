# Run this script once in the OS level shell to setup the additional swap after install or (maybe) OS upgrade
fallocate -l 2G /mnt/data/supervisor/backup/_swap.swap
chmod 0600 /mnt/data/supervisor/backup/_swap.swap
mkswap /mnt/data/supervisor/backup/_swap.swap
swapon /mnt/data/supervisor/backup/_swap.swap
cat <<EOF > /mnt/overlay/etc/udev/rules.d/99-zswapfile.rules
KERNEL=="mmcblk0p8", SUBSYSTEM=="block", RUN+="/usr/sbin/swapon /mnt/data/supervisor/backup/_swap.swap"
EOF