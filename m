From: Michael James <Michael.James@csiro.au>
Subject: Trouble with Suse9.3's reiser4
Date: Wed, 17 Aug 2005 14:45:46 +1000
Message-ID: <200508171445.46519.Michael.James@csiro.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25535-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Dear Reiser experts and enthusiasts,

I can't get the reiser4 in Suse9.3 Pro to work.

The problem is completely repeatable, happens every time.

Unmount a happy reiserfs3.6 data partition.
Re-format it as reiser4.
Re-mount it.
Copy something BIG into it.
As soon as it sees a file >2 Gig, the copy process hangs.
Once the copy is hung anything that reads that partition hangs too.


The system is a Dell 1655MC blade server.
It's a fully patched Suse9.3 pro machine.
All the reiser components are stock Suse.

a3:~ # cat /etc/SuSE-release
SuSE Linux 9.3 (i586)
VERSION = 9.3

a3:~ # cat /proc/version
Linux version 2.6.11.4-21.8-bigsmp (geeko@buildhost) (gcc version 3.3.5 
20050117 (prerelease) (SUSE Linux)) #1 SMP Tue Jul 19 12:42:37 UTC 2005

a3:~ # l /boot/vmlinuz-2.6.11.4-21.8-bigsmp
-rw-r--r--  1 root root 1555967 Jul 24
	 00:55 /boot/vmlinuz-2.6.11.4-21.8-bigsmp


Here's the simple path to destruction:

Have a lot of fun...
a3:~ # umount /coda

a3:~ # mkfs.reiser4 /dev/sda4
mkfs.reiser4 1.0.3
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser,
 licensing governed by reiser4progs/COPYING.

Block size 4096 will be used.
Linux 2.6.11.4-21.8-bigsmp is detected.
Uuid 01d3e4b0-e5b2-4b1b-a525-17fd4c239af1 will be used.
Reiser4 is going to be created on /dev/sda4.
(Yes/No): Yes
Creating reiser4 on /dev/sda4 ... done

a3:~ # fsck.reiser4  /dev/sda4

*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sda4 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** fsck.reiser4 started at Wed Aug 17 11:46:19 2005
Reiser4 fs was detected on /dev/sda4.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           01d3e4b0-e5b2-4b1b-a525-17fd4c239af1
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4.
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x2783ddb9
blocks:         7349737
free blocks:    7349476
root block:     23
tail policy:    0x2 (smart)
next oid:       0x10000
file count:     0
tree height:    2
key policy:     LARGE


CHECKING STORAGE TREE
        Read nodes 2
        Nodes left in the tree 2
                Leaves of them 1, Twigs of them 1
        Time interval: Wed Aug 17 11:46:21 2005 - Wed Aug 17 11:46:21 
2005
CHECKING EXTENT REGIONS.
        Read twigs 1
        Time interval: Wed Aug 17 11:46:21 2005 - Wed Aug 17 11:46:21 
2005
CHECKING SEMANTIC TREE
        Found 1 objects.
        Time interval: Wed Aug 17 11:46:21 2005 - Wed Aug 17 11:46:21 
2005
***** fsck.reiser4 finished at Wed Aug 17 11:46:21 2005
Closing fs...done

FS is consistent.

a3:~ # mount -t reiser4 /dev/sda4 /coda

a3:~ # mkdir /coda/blastN
a3:~ # mkdir /coda/blastP

a3:~ # chown -R biofile:www /coda/
a3:~ # su - biofile

biofile@a3:~ $  pwd
/home/cbf/biofile


biofile@a3:~ $  cp -av  db/blastN/  /coda/blastN/
`db/blastN/' -> `/coda/blastN/blastN'
`db/blastN/nt' -> `/coda/blastN/blastN/nt'
`db/blastN/nt/.nt.log' -> `/coda/blastN/blastN/nt/.nt.log'
`db/blastN/nt/nt.00.nhr' -> `/coda/blastN/blastN/nt/nt.00.nhr'

And there it hangs,  ^C does no good.
Close that local window,  log in again and:


Have a lot of fun...
a3:~ # df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sda2              4080316   2583200   1497116  64% /
tmpfs                  1035968         0   1035968   0% /dev/shm
/dev/sda1                23300      8395     13702  38% /boot
darius:/home         714091552 491106336 222985216  69% /home
darius:/var/spool/share
                      20136800   3830208  16306592  20% /var/spool/share
/dev/sda4             27934744    519076  27415668   2% /coda


a3:/var/log # ls -la /coda/

And that's it for that window too, it's hung beyond ^C retrieving it.

This is what always happens,
 I think it relates to the files being bigger than 2 Gig.
This time it died copying nt.nhr

ls -la  /home/cbf/biofile/db/blastN/nt/nt.00.nhr
-rw-r--r--   1 biofile www 179427600 2005-08-05 20:31 nt.00.nhr

Performance on the filesystem is important,
 I'm keen to get reiser4 working.
Any help with this would be appreciated,
 if there's any extra info needed, just ask,

michaelj

-- 
Michael James                         michael.james@csiro.au
System Administrator                    voice:  02 6246 5040
CSIRO Bioinformatics Facility             fax:  02 6246 5166

No matter how much you pay for software,
 you always get less than you hoped.
Unless you pay nothing, then you get more.
