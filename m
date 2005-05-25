From: "Ricardo \(Tru64 User\)" <tru64user@yahoo.com>
Subject: Reiserfs Sloooow Boot
Date: Wed, 25 May 2005 08:30:01 -0700 (PDT)
Message-ID: <20050525153002.60091.qmail@web51410.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24141-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi Guys,
First time posting here...after spending couple hours
in the mail archives.
I am running mandrake 10, 10.1 with reiserfs 3.6.11 
I have used reiserfs for a number of years...previous
with mandrake 8,9,9.2 (not sure what version of
reiserfs was in use then).
Since converting all nodes to Mandrake 10.0,(comes
with reiserfs 3.6.110, reboots (even clean ones) are
painfully sloooow!

For an empty reiserfs filesystem, 2TB in size, it
takes about 7-10mins to complete:
May 25 11:02:20 node2 kernel: reiserfs: found format
"3.6" with standard journal
May 25 11:04:22 node2 kernel: reiserfs: checking
transaction log (device sd(8,17)) ...
May 25 11:04:22 node2 kernel: for (sd(8,17))
May 25 11:04:22 node2 kernel: sd(8,17):Using r5 hash
to sort names
--------------------------

I have another empty filesystem created on a Logical
Volume (LV), that is 5TB. That one takes about 15-20
minutes to boot+mount!!
This was not the case in previous installs, where my
largest filesystems were 1TB. 
Does reiserfs have performance limitations with
filesystem size?

I took on XFS for trial purpose....formating the same
5TB partition with XFS, and reboots are extremely
quick! Barely two minutes, node is up, vs. 15 minutes
with reiserfs.

Any tweaking recommendations? More info that I should
provide? Hardware is a mix of promise technologies
(ATA to SCSI) raid boxes, and EonStor (SATA to SCSI)
raid boxes, some using LSI logic card as HBA, and
others using adaptec 39160, same issue. 
Server hardware is Dell PowerEdge 1750, 4GB ram, Dual
Xeon 3.2 processors.

I am hoping someone will lead me to some tuning to
reduce this delay. I can't use xfs, since on some
nodes i have to use kernel 2.4.26 (vanilla) that
doesnt support xfs, and besides, I have been a default
reiserfs user for a while, so I am not about to start
converting all 20-30TB paritions into XFS. For now, I
prepare 30mins for reboot whenever i have too...which
means they cant happen on work week, otherwise too
much cursing will occur.

I am using reiserfs for all partitions, including
root. Delay is much noticeable on the external
devices, which are the largest partitions.

_Thanks

Richard



More info that might be helpful::

]# debugreiserfs /dev/sdb1
debugreiserfs 3.6.11 (2003 www.namesys.com)


Filesystem state: consistency is not checked after
last mounting

Reiserfs super block in block 16 on 0x811 of format
3.6 with standard journal
Count of blocks on the device: 524287996
Number of bitmaps: 16000
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps,
data, reserved] blocks): 521696895
Root block: 457391
Filesystem is NOT cleanly umounted
Tree height: 5
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x36901ac5]
        Size 8193 blocks (including 1 for journal
header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 1
UUID: d1e512ee-d5b7-41f9-a0cc-1cc99b58f587
LABEL: 
Set flags in SB:
        ATTRIBUTES CLEAN



		
__________________________________ 
Do you Yahoo!? 
Yahoo! Small Business - Try our new Resources site
http://smallbusiness.yahoo.com/resources/
