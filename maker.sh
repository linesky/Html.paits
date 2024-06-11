printf "\x1bc\x1b[43;37m"
roots=/mnt/isos
tmps=/mnt/isos/tmp/lists.txt
tmps2=/mnt/isos/tmp/lists2.txt
printf "" > /tmp/stdin.txt
printf "give the megabytes to create a image\n"
read megas
megas=$(expr $megas '*' 1000 )
dd if=/dev/zero of="/tmp/my.img" bs=1k count=$megas
dd if=/dev/zero of="/tmp/image" bs=1k count=15000
sudo chmod 777 "/tmp/my.img"
sudo chmod 777 "/tmp/image"
sudo mkfs.vfat "/tmp/image"
sudo losetup /dev/loop4 /tmp/my.img 
sudo gparted /dev/loop4
#sudo losetup -d /dev/loop4
sudo chmod 777 "/tmp/my.img"
sudo chmod 777 "/tmp/image"
mkdir $roots
mkdir $roots1
sudo mount /dev/loop4p1 $roots -o loop 
mkdir -p $roots/tmp
printf "" > $tmps
printf "" > $tmps2
sudo chmod 777 $tmps
sudo chmod 777 $tmps2
mkdir -p $roots/boot
mkdir -p $roots/boot/grub
mkdir -p $roots/boot/grub/i386-pc
mkdir -p $roots/usr
mkdir -p $roots/usr/bin
mkdir -p $roots/bin
mkdir -p $roots/etc
mkdir -p $roots/lib
mkdir -p $roots/dev
mkdir -p $roots/boot
mkdir -p $roots/proc
mkdir -p $roots/proc/self
mkdir -p $roots/usr/include
mkdir -p $roots/lib/i386-linux-gnu
mkdir -p $roots/mnt
mkdir -p $roots/data
mkdir -p $roots/root
printf "#!/bin/bash\n/bin/bash --login" > $roots/linuxrc 
unzip -u ./file/CD_root.zip -d $roots
gzip /tmp/image
mv /tmp/image.gz $roots/boot
cp /boot/vmlinuz $roots/boot
cp /vmlinuz $roots/boot
cp ./file/syslinux.cfg $roots/boot/syslinux
cp /lib/i386-linux-gnu/ld-linux.so.* $roots/lib/i386-linux-gnu/
cp /lib/i386-linux-gnu/libc.so.* $roots/lib/i386-linux-gnu/
cp  /lib/i386-linux-gnu/crt*.* $roots/lib/i386-linux-gnu/
cp  /lib/i386-linux-gnu/libc.a $roots/usr/bin
cp  /lib/i386-linux-gnu/libc.a $roots/bin
cp  /lib/i386-linux-gnu/libc.a $roots/lib/i386-linux-gnu/
cp  /boot/grub/i386-pc/usb.mod $roots/boot/grub/i386-pc
cp  /boot/grub/i386-pc/*fs*.mod $roots/boot/grub/i386-pc
cp  /boot/grub/i386-pc/*ext*.mod $roots/boot/grub/i386-pc
cp  /boot/grub/i386-pc/*fat*.mod $roots/boot/grub/i386-pc
cp  /boot/grub/i386-pc/*ram*.mod $roots/boot/grub/i386-pc
cp  /usr/bin/bash $roots/bin
cp  /usr/bin/bash $roots/usr/bin
cp  /usr/bin/ld $roots/usr/bin
cp  /usr/bin/ld $roots/bin
cp  /usr/bin/nasm $roots/usr/bin
cp  /usr/bin/nasm $roots/bin
cp  /usr/bin/as $roots/usr/bin
cp  /usr/bin/as $roots/bin
cp  /usr/bin/sh $roots/usr/bin
cp  /usr/bin/sh $roots/bin
cp  /usr/bin/sh $roots/usr/bin
cp  /usr/bin/sh $roots/bin
cp  /usr/bin/ls $roots/usr/bin
cp  /usr/bin/ls $roots/bin
cp  /usr/bin/ldd $roots/usr/bin
cp  /usr/bin/ldd $roots/bin
mv /tmp/hello $roots/bin
printf "" > $roots/dev/null
printf "" > $roots/dev/stdio
printf "" > $roots/dev/stdout
printf "" > $roots/dev/stdin
printf "" > $roots/dev/sda
printf "" > $roots/dev/sda1
printf "" > $roots/dev/data
printf "" > $roots/dev/ram0
printf "" > $roots/dev/hda
printf "" > $roots/dev/hda0
chmod 777 $roots/bin/*
chmod 777 $roots/usr/bin/*
sudo chmod 777 $tmps
sudo chmod 777 $tmps2
printf "" > $tmps
list1=$(ls $roots/usr/bin/*)
for l1 in $list1
do
ldd "$l1" | grep  '/lib/' >> $tmps
done
awk '{for(i=1;i<=NF;i++) if($i ~ /\/lib\//) print $i}' $tmps > $tmps2
while IFS= read -r l1
do

rt="$roots$l1"
cp "$l1" "$rt" 
done < "$tmps2"
#sudo umount  $roots
#sudo mount /tmp/my.img $roots -o loop=/dev/loop1  -t vfat
sudo syslinux /dev/loop4p1
sudo umount  $roots
sudo losetup -d /dev/loop4
cp /tmp/my.img /tmp/my2.img
sudo chmod 777 "/tmp/my2.img"
