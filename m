From: Dirk Wetter <dirk_wetter@yahoo.com>
Subject: rip?
Date: Wed, 21 Jul 2004 16:17:48 -0700 (PDT)
Message-ID: <20040721231748.46066.qmail@web60310.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19726-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Hi there,

looks a reiserfs on a disk is shredded, hope I can save something. This
is what I did:

Being lazy I used "yast2 disk" (i.e. the partion resizer) under Suse
9.0 I tried to enlarge a fs by the amout of the following swap
partition
(output of a previously recorded layout):


   Device Boot    Start       End    Blocks   Id  System
/dev/hdf1             1     14945 120045681    f  Win95 Ext'd (LBA)
/dev/hdf2             1         1         0    0  Empty
/dev/hdf5   *         1       262   2104452   83  Linux
/dev/hdf6           263      3631  27061461   83  Linux
/dev/hdf7          3632      3680    393561   82  Linux swap
/dev/hdf8          3681     14945  90486081   83  Linux

After this action the disk looked like this:

Disk /dev/hdf: 122.9 GB, 122942324736 bytes
16 heads, 63 sectors/track, 238216 cylinders
Units = cylinders of 1008 * 512 = 516096 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hdf1             1    238186 120045681    f  Win95 Ext'd (LBA)
/dev/hdf5   *         1      4176   2104452   83  Linux
/dev/hdf6          4177     58647  27453352+  83  Linux
/dev/hdf7         58651    238186  90486081   83  Linux

Note the difference in Start/End, I cannot recall what I initially
did to get the first output. I don't remember invoking fdisk with
anything special...

I did unmount all partions from hdf before. yast complained that it
failed (I cannot quite recall the message, I only remember seeing a 
status bar with 0% and the error message on top of it). I quit yast and
tried to mount my filesystem, but it seemed to be gone. Then:

eagle:~# debugreiserfs /dev/hdf6
debugreiserfs 3.6.13 (2003 www.namesys.com)


reiserfs_open: the reiserfs superblock cannot be found on /dev/hdf6.


debugreiserfs: can not open reiserfs on "/dev/hdf6": no filesystem
found

eagle:~# 

I tried to run reiserfsck --rebuild-sb /dev/hdf6 :

eagle:/etc # reiserfsck --rebuild-sb /dev/hdf6
reiserfsck 3.6.13 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will check superblock and rebuild it if needed
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes

reiserfs_open: the reiserfs superblock cannot be found on /dev/hdf6.
what the version of ReiserFS do you use[1-4]
        (1)   3.6.x
        (2) >=3.5.9 (introduced in the middle of 1999) (if you use
linux 2.2, choose this one)
        (3) < 3.5.9 converted to new format (don't choose if unsure)
        (4) < 3.5.9 (this is very old format, don't choose if unsure)
        (X)   exit
1

Enter block size [4096]: 
8192
No journal device was specified. (If journal is not available, re-run
with --no-journal-available option specified).
Is journal default? (y/n)[y]: 

Did you use resizer(y/n)[n]: y

Enter partition size [3431669]: ^C


Here I stopped because I didn't know what unit the size asked for is.
Also I thought it was smarter to work on a copy (dd if=/dev/hdf6
of=mydiskfile bs=large), so I did some experiments, but I wasn't able
to access any data yet.


Mount previously divulged:

ReiserFS: hdf6: found reiserfs format "3.6" with standard journal
ReiserFS: hdf6: using ordered data mode
ReiserFS: hdf6: journal params: device hdf6, size 8192, journal first
block 18, max trans len 1024, max batch 900, max commit age 30, max
trans age 30



Any useful hint would be very appreciated.

Thanks,
      Dirk






__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
