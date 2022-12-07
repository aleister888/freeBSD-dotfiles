#!/usr/local/bin/dash

# Script for mounting all devices, formated with UFS, EXT4, FAT, FAT32 or NTFS.
# Package "fuse" is required

clear
substring1=da
substring2=wd
substring3=p
substring4=s

# unmount all
cd /dev

# analyze character-files in /dev
for i in $( ls ); do

# seeking if the character-file in /dev is a mountable disk
if [ "$i" != "${i%$substring1*}" ] || [ "$i" != "${i%$substring2*}" ] ; then

# seeking if the character-file in /dev has partition
if [ "$i" != "${i%$substring3*}" ] || [ "$i" != "${i%$substring4*}" ] ; then
echo "Substring IS in $i"

# unmout the device if conditions above are ok
umount /dev/$i
fi
fi
done

#read some
clear

# remove all directories used by previous mount
if [ -d "/media/disk" ]; then
rmdir /media/disk/*
else
mkdir /media/disk
fi
echo "removed dir"

#read some
clear

cd /dev

# mount all

# analyze character-files in /dev
for i in $( ls ); do

# seeking if the character-file in /dev is a mountable disk
if [ "$i" != "${i%$substring1*}" ] || [ "$i" != "${i%$substring2*}" ] ; then

# seeking if the character-file in /dev has partition
if [ "$i" != "${i%$substring3*}" ] || [ "$i" != "${i%$substring4*}" ] ; then
echo "Substring IS in $i"

# Create directory for the finded device
mkdir /media/disk/$i

# trying to mount msdos
mount_msdosfs /dev/$i /media/disk/$i
clear
# trying to mount ext4
ext4fuse  /dev/$i /media/disk/$i
clear
# trying to mount ntfs
ntfs-3g /dev/$i /media/disk/$i
clear
mount /dev/$i /media/disk/$i
fi
fi
done
echo "done"
