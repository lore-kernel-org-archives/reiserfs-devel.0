From: Moritz Franosch <mail@Franosch.org>
Subject: bug: reiserfsck reports "neither new nor old reiserfs format found"
Date: 25 Oct 2002 11:34:40 +0200
Sender: mail@Franosch.org
Message-ID: <m3n0p23lqn.fsf@gateway.askos>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11771-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com



Hello,

I think I've just lost a reiserfs partition and reiserfsck did not
work. Here is my bugreport, as the man page of reiserfsck says.


The system is Intel 486, 66 MHz, 16 MB RAM.
/dev/hda1 boot partition with ext2
/dev/hda2 root partition with reiserfs

I've installed the system with Suse 8.0, the system booted (many
times), then hang and I switched off.


The next boot, the kernel paniced with the message

read_super_block: can't find a reiserfs filesystem on (dev 03:02, block 64, size 1024)


Thus I've downloaded reiserfsprogs-3.6.3.tar.gz and did

tar -xzf reiserfsprogs-3.6.3.tar.gz
cd reiserfsprogs-3.6.3
./configure
make
cd fsck
gcc --static -g -O2 -Wall  -o reiserfsck  main.o pass0.o pass1.o pass2.o semantic_check.o semantic_rebuild.o pass4.o lost+found.o ubitmap.o uobjectid.o ustree.o ufile.o check.o check_tree.o info.o super.o ../lib/libmisc.a ../reiserfscore/libcore.a

to get a statically liked version of reiserfsck (unser Suse Linux 8.0,
gcc 2.95.3, Suse's default 2.4.18-4GB kernel).


I copied reiserfsck via floppies to the ext2 filesystem on /dev/hda1
(using a rescue system, Suse's did not work because of too few
memory).


I booted the Suse bootdisk (Suse kernel 2.4.18-4GB), loaded the
reiserfs module, went to the console, mounted /dev/hda1 and executed
reiserfsck as

reiserfsck --check --logfile check.log /dev/hda2

It reported (I've to type from the screen):

reiserfs_open: neither new nor old reiserfs format found on /dev/hda2
reiserfsck: could not open filesystem on "/dev/hda2"

"echo $?" reported 0 as exit status, check.log has size 0.


According to the man page, reportig 0 as an exit status in this case
is a bug:
man reiserfsck says:
  2.  Run reiserfsck --check --logfile check.log /dev/hda1.  If
  reiserfsck --check exits with status 0 it means no errors were
  discovered.


reiserfsck --rebuild-tree --logfile rebuild.log /dev/hda2

reiserfs_open: neither new nor old reiserfs format found on /dev/hda2
reiserfsck: could not open filesystem on "/dev/hda2"

rebuild.log has size 0.


Trying to mount /dev/hda2 with

mount /dev/hda2 /mnt2

gives the following kernel messages on the console:

...
VFS: Can't find ext2 filesystem on dev ide0(3,2)
read_super_block: can't find a reiserfs filesystem on (dev 03:02, block 64, size 1024)
read_super_block: can't find a reiserfs filesystem on (dev 03:02, block 8, size 1024)
...


I think reiserfsck should do _something_.
man reiserfsck says:
  6. If the --rebuild-tree step fails or does not recover what you
  expected, please submit this as a bug report. Try to provide as much
  information as possible and we will try to help solve the problem.

The --rebuild-tree step failed and did recover absoulutely nothing, so
I report this as a bug.


I suspect the magic number of the reiserfs filesystem is overwritten
and reiserfsck gives up. But there really _is_ a reiserfs filesystem
on that partition. I'll save the first 1.4 MB of /dev/hda2 on a floppy
for further analysis, if required.

Please CC me, as I'm not on the reiserfs-list@namesys.com.


Thank you,

Moritz



-- 
Dipl.-Phys. Moritz Franosch
http://Franosch.org
