From: <doiggl@velocitynet.com.au>
Subject: Re: reiser4progs: possible off-by-one in librepair/twig_scan.c?
Date: Fri, 20 Jun 2014 17:23:01 +1000
Message-ID: <8f586f2cdc821d8a85a5e908536aa823@mail.velocitynet.com.au>
References: <1559792.K1g2CRjlCX@intelfx-laptop> <53A37C52.5050006@gmail.com> <1475191.W2aZRKbs49@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1475191.W2aZRKbs49@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, Edward Shishkin <edward.shishkin@gmail.com>

On Fri, 20 Jun 2014 06:36:56 +0400, Ivan Shapovalov <intelfx100@gmail.com>
wrote:
> On Friday 20 June 2014 at 02:12:02, Edward Shishkin wrote:	
>> 
>> On 06/20/2014 01:18 AM, Ivan Shapovalov wrote:
>> > I've got a strange fsck complaint while testing the rewritten
discard.
>> > The fsck log is here (not line-wrapped):
>> >
>> > ====LOG====
>> >
>> > $ fsck.reiser4 /dev/disk/by-label/linux-build
>> > *******************************************************************
>> > This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
>> > *******************************************************************
>> >
>> > Fscking the /dev/disk/by-label/linux-build block device.
>> > Will check the consistency of the Reiser4 SuperBlock.
>> > Will check the consistency of the Reiser4 FileSystem.
>> > Continue?
>> > (Yes/No): y
>> > ***** fsck.reiser4 started at Fri Jun 20 02:49:22 2014
>> > Reiser4 fs was detected on /dev/disk/by-label/linux-build.
>> > Master super block (16):
>> > magic:          ReIsEr4
>> > blksize:        4096
>> > format:         0x0 (format40)
>> > uuid:           73831051-68e1-4848-b9ea-83f9703558b6
>> > label:          linux-build
>> >   
>> > Format super block (17):
>> > plugin:         format40
>> > description:    Disk-format plugin.
>> > version:        0
>> > magic:          ReIsEr40FoRmAt
>> > mkfs id:        0x143b8ccd
>> > flushes:        0
>> > blocks:         2621440
>> > free blocks:    542951
>> > root block:     69897
>> > tail policy:    0x2 (smart)
>> > next oid:       0x21c6d1
>> > file count:     182200
>> > tree height:    4
>> > key policy:     LARGE
>> >   
>> >   
>> > CHECKING THE STORAGE TREE
>> >          Read nodes 239320
>> >          Nodes left in the tree 239320
>> >                  Leaves of them 236133, Twigs of them 3136
>> >          Time interval: Fri Jun 20 02:49:22 2014 - Fri Jun 20
02:49:29
>> >          2014
>> > CHECKING EXTENT REGIONS.
>> > FSCK: extent40_repair.c: 96: extent40_check_layout: Node (2618486),
>> > item (9), unit (10), [20d7ef:4(FB):766d6c696e757a:20da66:0]: points
out
>> > of the fs, region [2621239..2621439].
>> >          Read twigs 3136
>> >          Invaid extent pointers 1
>> >          Time interval: Fri Jun 20 02:49:29 2014 - Fri Jun 20
02:49:29
>> >          2014
>> > CHECKING THE SEMANTIC TREE
>> >          Found 189973 objects (some could be encountered more then
>> >          once).
>> >          Time interval: Fri Jun 20 02:49:29 2014 - Fri Jun 20
02:49:33
>> >          2014
>> > FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and
>> > really used block bitmap differ.
>> > ***** fsck.reiser4 finished at Fri Jun 20 02:49:33 2014
>> > Closing fs...done
>> >
>> > 1 fatal corruptions were detected in FileSystem. Run with --build-fs
>> > option to fix them.
>> >
>> > ====END LOG====
>> >
>> > This seems invalid to me: why a [2621239; 2621439] region would be
>> > invalid
>> > in a filesystem with 2621440 blocks?
>> > Also, the file in question is intact and does not appear to be
>> > corrupted,
>> > because this is my current vmlinuz. :)
>> >
>> > The following patch against reiser4progs shows precise location of
>> > this check.
>> >
>> > diff --git a/librepair/twig_scan.c b/librepair/twig_scan.c
>> > index 39b747c..ca8607a 100644
>> > --- a/librepair/twig_scan.c
>> > +++ b/librepair/twig_scan.c
>> > @@ -19,7 +19,7 @@ static errno_t cb_item_region_check(blk_t start,
>> > uint64_t count, void *data) {
>> >   	/* This must be fixed at the first pass. */
>> >   	if (start >= ts->bm_met->total ||
>> >   	    count > ts->bm_met->total ||
>> > -	    start >= ts->bm_met->total - count)
>> > +	    start > ts->bm_met->total - count)
>> >   	{
>> >   		ts->stat.bad_unfm_ptrs++;
>> >   		return RE_FATAL;
>> 
>> Sometimes our fsck is overly suspicious ;)
>> Does this fix help, BTW?
>> Thanks!
> 
> Yes, it does -- after applying the same filesystem is reported as OK.

Hello,
Is this going to get the patch as well ?
http://downloads.sourceforge.net/project/reiser4/reiser4-utils/reiser4progs/reiser4progs-1.0.8.tar.gz
--Glenn

Sourced from:
https://reiser4.wiki.kernel.org/index.php/Reiser4progs
