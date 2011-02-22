From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiserfsck (v3): out of disk space
Date: Tue, 22 Feb 2011 11:21:35 +0100
Message-ID: <4D638E2F.9030305@gmail.com>
References: <20110222030056.3379d223@Couracado.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=4R3xkmZevuO4AkI2SR67rOCIXQNcsY6726rQkbuDBLA=;
        b=thDwokPvdFN8EV2DIj9CO+hibQmtlgWd/aJBl887IXaK9sgQF1RkJ+mDPK0pkoEzwP
         6GDUwHe1LkBJ9aoxRPBmMQAJySZxnErzYDwXsngGOPQkEUWpU2cAdqHPHsrfyGmXiKAD
         sKQIQY+qoIRvlsEr3wuTGiMoIJrfqqoVSSoCI=
In-Reply-To: <20110222030056.3379d223@Couracado.homelinux.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: higuita <higuita@GMX.net>
Cc: reiserfs-devel@vger.kernel.org

On 02/22/2011 04:00 AM, higuita wrote:
> Hi
>
> 	i'm having a problem with reiserfsck, version 3 and
> as namesys is no more, i dont known exactly where to go to ask
> for help... i'm trying here :)
>
> 	i have a 170GB partition that during a download
> got about -16TB of free space... i checked the log and
> got no kernel error nor message.
>
> 	as it was wierd i dismounted the partition and run
> a reiserfsck --fix-fixable on it... it complained that had
> 2 errors that needed the rebuild-tree.
>
> 	As recomended, i run the rebuild-tree (first time
> without the --scan-whole-partition) and got the error "out
> of disk space" in the end...


Could you build and try reiserfsprogs-3.6.20?

http://www.kernel.org/pub/linux/utils/fs/reiserfs/reiserfsprogs-3.6.20.tar.gz


so i run it again like this:
>
> # reiserfsck --scan-whole-partition --rebuild-tree /dev/sdb7
> reiserfsck 3.6.21 (2009 www.namesys.com)
>
> *************************************************************
> ** Do not  run  the  program  with  --rebuild-tree  unless **
> ** something is broken and MAKE A BACKUP  before using it. **
> ** If you have bad sectors on a drive  it is usually a bad **
> ** idea to continue using it. Then you probably should get **
> ** a working hard drive, copy the file system from the bad **
> ** drive  to the good one -- dd_rescue is  a good tool for **
> ** that -- and only then run this program.                 **
> ** If you are using the latest reiserfsprogs and  it fails **
> ** please  email bug reports to reiserfs-list@namesys.com, **
> ** providing  as  much  information  as  possible --  your **
> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> ** messages  (including version),  the reiserfsck logfile, **
> ** check  the  syslog file  for  any  related information. **
> ** If you would like advice on using this program, support **
> ** is available  for $25 at  www.namesys.com/support.html. **
> *************************************************************
>
> Will rebuild the filesystem (/dev/sdb7) tree
> Will put log info to 'stdout'
>
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes Replaying journal: Done.
> Reiserfs journal '/dev/sdb7' in blocks [18..8211]: 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Mon Feb 21 01:14:14 2011
> ###########
>
> Pass 0:
> ####### Pass 0 #######
> The whole partition (44998048 blocks) is to be scanned
> Skipping 9584 blocks (super block, journal, bitmaps) 44988464 blocks will be read
> 0%..
> block 4269056: The number of items (1) is incorrect, should be (0) - corrected
> block 4269056: The free space (0) is incorrect, should be (4072) - corrected
> ..20%....
> block 16628504: The number of items (22)is incorrect, should be (0) - corrected
> block 16628504: The free space (1815) is incorrect, should be (4072) - corrected
> 40%
> block 19311136: Thenumber of items (6) is incorrect, should be (0) - corrected
> block 19311136: The free space (2281) is incorrect, should be (4072) - corrected
> .
> block 19966124: The number of items (2048) is incorrect, should be (1) - corrected
> block 19966124: The free space (2048) is incorrect, should be (2000) - corrected
> pass0: vpf-10110:
> block 19966124, item (0): Unknown item type found [134217729 657408 0x8000001 ??? (15)] - deleted
> ...
> block 25407788: The number of items (1536) is incorrect, should be (1) - corrected
> block 25407788: The free space (300) is incorrect, should be (3792) - corrected
> pass0: vpf-10110:
> block 25407788, item (0): Unknown item type found [69403136 85724160 0x2ed0000 ??? (9)] - deleted
> block 26219204: The number of items (7) is incorrect, should be (1) - corrected
> block 26219204: The free space (0) is incorrect, should be (3024) - corrected
> pass0: vpf-10110:
> block 26219204, item (0): Unknown item type found [3140107008 3076072448 0xb53f00 ??? (15)] - deleted
> 60%
> block 27540926: The number of items (1284) is incorrect, should be (1) - corrected
> block 27540926: The free space (512) is incorrect, should be (4048) - corrected
> pass0: vpf-10110:
> block 27540926, item (0): Unknown item type found [16842756 69892 0x1010101 ??? (15)] - deleted
> pass0: vpf-10160:
> block 28321297: item 6: No "." entry found in the first item of a directory
> ..
> block 32231127: The number of items (14) is incorrect, should be (0) - corrected
> block 32231127: The free space (1998) is incorrect, should be (4072) - corrected
> ..
> block 34225196: The number of items (256) is incorrect, should be (1) - corrected
> block 34225196: The free space (33807) is incorrect, should be (4048) - corrected
> pass0: vpf-10110:
> block 34225196, item (0): Unknown item type found [2475232323 192 0xd284fa89 ??? (8)] - deleted
> 80%
> block 36309055: The number of items (83) is incorrect, should be (0) - corrected
> block 36309055: The free space (0) is incorrect, should be (4072) - corrected
> ..
> block 39752011: The number of items (7) is incorrect, should be (1) - corrected
> block 39752011: The free space (0) is incorrect, should be (4048) - corrected
> pass0: vpf-10200:
> block 39752011, item 0: The item [11869226 45345 0x9000100 IND (1)] with wrong offset is deleted
> block 40328404: The number of items (15364) is incorrect, should be (1) - corrected
> block 40328404: The free space (20924) is incorrect, should be (976) -corrected
> pass0: vpf-10210:
> block 40328404, item 0: The item with wrong offset or length found [883290112 201335811 0x603021 DRCT (2)], len 3072 - deleted
> ..
> block 43971720: The number of items (7) is incorrect, should be (1) - corrected
> block 43971720: The free space (25) is incorrect, should be (4048) - corrected
> pass0: vpf-10210:
> block 43971720, item 0: The item with wrong offset or length found [369147936 11938893 0x7009923 DRCT (2)], len 0 - deleted
> block 44863841: The number of items (3840) is incorrect, should be (1) - corrected
> block 44863841: The free space (0) is incorrect, should be (3792) - corrected pass0: vpf-10110:
> block 44863841, item (0): Unknown item type found [268496896 268501007 0xff001 ??? (15)] - deleted 100%
>                          left 0, 9103 /sec
>
> 675769 directory entries were hashed with "r5" hash. "r5" hash is selected
> Flushing..finished Read blocks (but not data blocks) 44988464
> Leaves among those 158045
> 			- corrected leaves 2
> 			- leaves all contents of which could not be saved
> and deleted 21 Objectids found 675414
>
> Pass 1 (will try to insert 158024 leaves):
> ####### Pass 1 #######
> Looking for allocable blocks .. finished
> 0%....20%....40%....60%....80%....Not enough allocable blocks, checking
> bitmap...there are 1 allocable blocks, btw
>
> out of disk space
> Aborted (core dumped)
> # echo $?
> 134
>
> 	So i can't mount the filesystem, as the rebuild didn't finish,
> nor i can finish the rebuild, as it keeps  giving out the "out of disk
> space" error... if the "out of disk space" is true, i have many files i
> could erase, but as i cant mount, i'm in a deadlock. whatever corruption
> i have, this version of reiserfsck is unable to fix it...
>
> i already done a  dump of the metadata:
>
> debugreiserfs -p /dev/sdb7  | bzip2 -c>  /tmp/metadata.bz2
>
> 	The system is a slackware64 -current and main kernel:
>
> Linux Caravela 2.6.37.1-k8_64-kms #33 SMP Sat Feb 19 05:27:52 WET 2011
> x86_64 Dual Core AMD Opteron(tm) Processor 175 AuthenticAMD GNU/Linux
>
> 	So, is there anyone with time and will to help me
> recover this partition? :)
>
> Thanks in advance for any help
> higuita
>
> ps: might be a coincidence, but since i changed to 2.6.37-1 i
> have run 2 --fix-fixable on other reiserfs partitions and this
> --rebuild-tree. As i said, its probably a coincidence, but just
> in case...
>

