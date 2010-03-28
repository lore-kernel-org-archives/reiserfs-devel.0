From: Marco Gatti <marco.gatti@gmail.com>
Subject: reiserfs + acl corruption
Date: Sun, 28 Mar 2010 17:29:03 +0200
Message-ID: <54cce25c1003280829q2a173c91p55bc3297a3163452@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=U2u8A7frcb2RZhCM9J8O/u/0m9tCRgWt5lJtufLzg10=;
        b=HmV19cOxOqQteKWfocZD0tJ9UoxrYjZAGnK1Hl4NU62MF3XDP3MFxClnhisg38e33V
         m27V7ChxUdEBU49PDnvaDCUpT2lYlT5NXHNnWqajlrerkyjBa27E+ni78xWMDsgrjQ02
         IAPJBlQsjMKzF1AWK14fYZQnvF0AiWndmntZA=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

I hope to post in the right place.
I recently suffered a filesystem corruption with reiserfs in a
production environment and I was able to reproduce it.
The corruption started when i played with extended attributes, posix
acls, with a partition containing hundreds of thousands of files.
To reproduce the issue test it this way (using bash) in a separate
disk, partition or virtual disk using loopback:

mkfsreiserfs /dev/sdc1
mount -o acl /dev/sdc1 /mnt
cd /mnt
mkdir dir_with_many_files
touch dir_with_many_files/{1..100000}
setfacl -R -m u:username:rw dir_with_many_files
setfacl -R -x u:username dir_with_many_files	(slow responsiveness of
system during the execution of this command)
setfacl -R -b dir_with_many_files

With a debian lenny standard kernel 2.6.26 (port amd64) these commands
ends succesfully and no corruption occours.
With a recent kernel, versions 2.6.32.8 - 2.6.32.9 - 2.6.32.10,
(x86_64) compiled in different ways, from standard configuration to
optimized versions even with no support for modules i get thousands of
this kind of message:

REISERFS warning (device sdc1): jdm-20002 reiserfs_xattr_get: Invalid
hash for xattr (system.posix_acl_access) associated with [2 848 0x0
SD]

then wierd things start to happen and the more you use this filesystem
the more you disrupt it: this leads to a corrupted filesystem!
If you try with less files, let's say 50000, no corruption or error
occour to me.
The number of files to reproduce this behaviour could be different and
it seems to be related to the machine you use: 100000 are enought for
a virtual machine with 1GB of RAM, but i needed 300000 of files using
a real machine with 4GB of RAM.
I tested other filesystem but i get no corruption at all with ext2,
ext3, ext4 and xfs.
I use debian stable or testing environments and i'm using reiserfs
included in vanilla kernels, with default options.
Am I doing something wrong?
Can someone test and reproduce this behaviour?
Regards

Marco Gatti
