From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions
Date: Wed, 25 Jun 2003 20:26:01 +0200
Message-ID: <3EF9E939.1050501@g-house.de>
References: <20030619054535.GA23852@namesys.com> <3EF6AE67.5090502@namesys.com> <20030623090258.GA12259@namesys.com> <3EF6C83F.6060702@namesys.com> <3EF702CC.9050005@g-house.de> <20030624131904.GA460@namesys.com> <3EF86928.7080504@g-house.de> <20030624151940.GC21845@namesys.com> <3EF888B2.4000900@g-house.de> <3EF8EFF0.6020207@g-house.de> <20030625054031.GA11576@namesys.com> <3EF9A0F6.4030401@g-house.de>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14698-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EF9A0F6.4030401@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

finally,

2.5.72 with CONFIG_REISERFS_CHECK is ready and was booting fine. but 
another issue occured: i always had reiserfs built as a module, now i 
got "Invalid module format" on the reiserfs module too (i got the error 
in earlier versions too, but i _had_ once a 2.7.72 with reiserfs as 
module. only now i get this error. btw: i other modules are ok, but only 
jfs/xfs/reiserfs are showing these errors). anyway, i built 2.5.72 with 
static reiserfs support but i don't get much debug info.

this is the mounting:

found reiserfs format "3.6" with standard journal
reiserfs:warning: CONFIG_REISERFS_CHECK is set ON
reiserfs:warning: - it is slow mode for debugging.
Reiserfs journal params: device sde2, size 8192, journal first block 18, 
max trans len 1024, max batch 900, max commit age 30, max trans age 30
reiserfs: checking transaction log (sde2) for (sde2)
journal-1153: found in header: first_unflushed_offset 71, 
last_flushed_trans_id 15
journal-1206: Starting replay from offset 71, trans_id 16
journal-1299: Setting newest_mount_id to 11
Using r5 hash to sort names

cp'ing files to it gives no info in stderr/logfiles, but the corruptions 
are back again:

lila:~# reiserfsck --fix-fixable /dev/sde2

<-------------reiserfsck, 2003------------->
reiserfsprogs 3.6.8

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

Will check consistency of the filesystem on /dev/sde2
and will fix what can be fixed without --rebuild-tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
###########
reiserfsck --fix-fixable started at Wed Jun 25 20:01:56 2003
###########
Replaying journal..
0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..vpf-10630: The on-disk and the correct bitmaps 
differs. Will be fixed later.
Checking Semantic tree:
/lib/libnss_files-2.3.1.sovpf-10680: The file [3 415] has the wrong 
block count in the StatData (104) - corrected to (56)
[...]
/libpthread-0.10.sovpf-10680: The file [3 423] has the wrong block count 
in the StatData (232) - corrected to (120)
finished
No corruptions found
There are on the filesystem:
	Leaves 33
	Internal nodes 1
	Directories 99
	Other files 323
	Data block pointers 5477 (2616 of them are zero)
	Safe links 0
###########
reiserfsck finished at Wed Jun 25 20:02:05 2003
###########
lila:~#
---------------------------------

i really don't know why this alpha has these odd problems. remember the 
strange "bread error" i got with 2.4? today, under 2.5.72 i noticed for 
the first time an scsi-error in my logfile while "mkreiserfs /dev/sdb2" 
was about to finish. (scsi0: ERROR on channel 0, id 5, lun 0/sense key 
Medium Error). can't it be an hw issue too?
as described in an earlier mail i already re-partitioned sde into sde1 
(10MB) and sde2 (2135MB). now, after getting these scsi error i 
re-partitioned again into sde1(10MB), sde2(2125MB) and sde3(10MB), to 
exclude the beginning and the end of the disk from being touched.
sure, the only good workaround is buy a new disk :-)

so, after saying that i made another test. ok, perhaps is sde really 
dying, but sdc is not, it's my rootfs :-)
i created a 100MB image, mkreiserfs -f on it, mounted it and copied 
files to it. a following "diff" gave no errors! fine, but "reiserfsck 
test.img" (after unmounting) presented the very known errors again. i 
did not use --fix-fixable but mounted the test.img again, now "diff -r" 
showed differences where none should be :-(


Thank you for your time,
Christian.

