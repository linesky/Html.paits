printf "\x1bc\x1b[43;37m"
roots=/mnt/isos
tmps=/mnt/isos/tmp/lists.txt
tmps2=/mnt/isos/tmp/lists2.txt
printf "give the file name to resizes a image\n"
read name
printf "give the  new file sizes in megabytes to resizes a image\n"
read sizes
sizes="$sizes"M
printf "$sizes"\n
sudo chmod 777 $name
sudo losetup /dev/loop4 $name 
fatresize --size $sizes /dev/loop4
mkdir $roots
sudo mount /dev/loop4 $roots -o loop 
nautilus --browser $roots
sudo umount  $roots
sudo losetup -d /dev/loop4

