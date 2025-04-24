## TMUX
### Shortcuts
- Ctrl + x = prefixo
- u = divide terminal na horizontal
- i = divide terminal na vertical

- h j k l = movimenta entre os splits de terminal

# Solução para quebra de bootloader do Arch Linux
- Dar boot em uma imagem Arch Linux
- Montar partições do sistema
```
mount -t btrfs -o subvol=@ /dev/nvme0n1p2
mount --bind /dev /mnt/dev
mount --bind /proc /mnt/proc
mount --bind /sys /mnt/sys
mount --bind /run /mnt/run
```
- Montar partição de boot
```
mount /dev/nvme0n1p1 /mnt/boot
```
- Acessar o sistema via arch-chroot
- Reconfigurar o arquivo de boot GRUB
```
grub-mkconfig -o /boot/grub/grub.cfg
```
