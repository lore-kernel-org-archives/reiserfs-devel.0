From: "Flora Dru" <dru@dicts.mak.ac.ug>
Subject: Filesystem repair and Data Recovery
Date: Fri, 01 Jul 2005 14:29:54 +0300
Message-ID: <20050701112954.B2F849FF0@mail.mak.ac.ug>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24887-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi, 

our reiserfs partition that holds our institutions mails got corrupted 
(27GB). A colleague that was around tried to recover it but failed. So he 
changed the filesystem to ext2 in /etc/fstab and rebooted. the partition 
came up but with some of its folders and files corrupted, some folders have 
become executables with strange owners and permissions that dont respond to 
cp, chmod, chown or mv commands. 

We created  an image of the corrupted files onto an ext2 partition  and 
tried to repair it but files in lost+found had strange filenames. 

We created another image file onto a remote host reiserfs partition using ( 
ssh corrupthost dd if=/dev/sda1 conv=noerror > sda1.img) and did the 
following: 

losetup /dev/loop0 sda1.img
reiserfsck --rebuild-sb /dev/loop0
reiserfsck --rebuild-tree /dev/loop0 

but it failes with  "No reiserfs metadata" found error  and the log file 
contains 

####### Pass 0 #######
Could not find hash in use. Using "r5"
####### Pass 1 #######
####### Pass 2 ####### 


Please advise. 

Thanks
Dru
