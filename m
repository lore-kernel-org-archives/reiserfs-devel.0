From: "=?iso-8859-1?B?SW5nbyBS9t9sZXI=?=" <roessler@gmx.de>
Subject: cannot mount /dev/hdc1
Date: Tue, 25 Feb 2003 16:06:07 +0100
Message-ID: <001701c2dcdf$6cc60650$5e01a8c0@roessler.dnsalias.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12913-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hello,

I hope You can help me!

I get at the reboot of  my Suse7.1-Linux-server this message:

mount -t reiserfs  /dev/hdc1 /home : mount: wrong fs type, bad option, bad
superblock on /dev/hdc1, or too many mounted file systems

This is my home-directory - my live!

The harddisk is correct connected. It is a Western Digial 80 GB Harddisk
with only this Partition hdc1.

elsa:~ # cat /etc/fstab
/dev/hda1       /windows        vfat            defaults                0 0
/dev/hda2       swap            swap            pri=3D42                  0=
 0
/dev/hda3       /               reiserfs        defaults                1 1
/dev/hdc1       /home           reiserfs        defaults                1 2
/dev/hda5       /home/backup          reiserfs        defaults
1 2
/dev/cdrom      /home/mount/cdrom       auto            ro,noauto,user,exec
0 0
/dev/dvd        /home/mount/dvd auto            ro,noauto,user,exec     0 0
/dev/fd0        /home/mount/floppy      auto            noauto,user,sync 0 0
proc            /proc           proc            defaults                0 0
devpts          /dev/pts        devpts          defaults                0 0

elsa:~ # reiserfsck --check /dev/hdc1
<-------------reiserfsck, 2001------------->
reiserfsprogs 3.x.0j
reiserfs_open: neither new nor old reiserfs format found on /dev/hdc1
reiserfsck: --rebuild-sb may restore reiserfs super block

Now I boot with a newer OS: Knoppix, a CDROM-Linux-Distri:

mount -t reiserfs  /dev/hdc1 /mnt
read_super_block: can't find a reiserfs filesystem on (dev 16:01, block 128,
size 512)
read_super_block: can't find a reiserfs filesystem on (dev 16:01, block 16,
size 512)
mount : Falscher Dateisystemtyp, ung=FCltige Optionen, der "Superblock" von
/dev/hdc1 ist besch=E4digt oder es sind zu viele Dateisysteme eingeh=E4ngt.

# reiserfsck --check /dev/hdc1
<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.3
reiserfs_open: neither new nor old reiserfs format found on /dev/hdc1
reiserfsck:  could not open filesystem on "/dev/hdc1"
Aborted

What can I do?
Can you help me?

Ciao Ingo

PS:
Excuse my bad english.
Excuse my using of OE - my Netscape is on /home/




