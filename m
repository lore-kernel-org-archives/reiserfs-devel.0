From: Jelle de Jong <jelledejong@powercraft.nl>
Subject: Need some help please
Date: Fri, 29 Dec 2006 23:28:00 +0100
Message-ID: <45959670.20801@powercraft.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30346-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

I did a rm * on a wrong directory now i lost my data.

I directly did this:

sudo umount /dev/hda3

sudo mkdir /mnt/sda1
sudo mount /dev/sda1 /mnt/sda1

sudo dd if=/dev/hda3 conv=noerror of=/mnt/sda1/dd_image_hda3_29_12_06.iso
sudo losetup -f
sudo losetup /dev/loop0 /mnt/sda1/dd_image_hda3_29_12_06.iso
sudo reiserfsck --rebuild-tree --scan-whole-partition --logfile
/mnt/sda1/recovery.log /dev/loop0

sudo mkdir /mnt/recovery
sudo mount /dev/loop0 /mnt/recovery

#recover your files
#find node numbers
ls -i /mnt/recovery/Desktop
sudo find /mnt/recovery/lost+found/ -name '*' -exec sudo grep -H -n
"Computer" '{}' \;
sudo thunar /mnt/recovery/lost+found

sudo umount /mnt/recovery
sudo losetup -d /dev/loop0


I found a lot of file but not the ones I need the log file says this:

rebuild_semantic_pass: The entry [21766 283] ("afspraken.txt") in
directory [2 21766] points to nowhere - is removed
rebuild_semantic_pass: The entry [21766 72165] ("Foto's") in directory
[2 21766] points to nowhere - is removed
rebuild_semantic_pass: The entry [21766 21767] ("Kill
Application.desktop") in directory [2 21766] points to nowhere - is removed
rebuild_semantic_pass: The entry [21766 19620] ("Start logger.desktop")
in directory [2 21766] points to nowhere - is removed
rebuild_semantic_pass: The entry [21766 21768] ("Start
Hellanzb.desktop") in directory [2 21766] points to nowhere - is removed
rebuild_semantic_pass: The entry [21766 92717]
("eUYaWhoNsWdYq1zIGONKig==.jpg") in directory [2 21766] points to
nowhere - is removed
rebuild_semantic_pass: The entry [21766 23833] ("logfile.txt") in
directory [2 21766] points to nowhere - is removed
rebuild_semantic_pass: The entry [21766 21821] ("open staande
facturen.txt") in directory [2 21766] points to nowhere - is removed
rebuild_semantic_pass: The entry [21766 5122] ("refcard-en-a4.pdf") in
directory [2 21766] points to nowhere - is removed
rebuild_semantic_pass: The entry [21766 40] ("Introduction.odt") in
directory [2 21766] points to nowhere - is removed
rebuild_semantic_pass: The entry [21766 76287] ("Beginning CSS Web
Development: From Novice to Professional") in directory [2 21766] points
to nowhere - is removed
rebuild_semantic_pass: The entry [21766 21773] ("linux problems.txt") in
directory [2 21766] points to nowhere - is removed

These file's I need

How do I get them back it was a simple rm* nothing more


