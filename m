From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 and bonnie problems
Date: Wed, 21 Apr 2004 11:03:53 +0400
Message-ID: <20040421070352.GE1579@backtop.namesys.com>
References: <20040416203937.GY14134@nysv.org> <26F302F3-9042-11D8-8B4A-000A95CD704C@wagland.net> <2EB65FD6-924A-11D8-8B4A-000A95CD704C@wagland.net> <16516.54935.159587.423283@laputa.namesys.com> <61B07E02-92A8-11D8-8B4A-000A95CD704C@wagland.net> <16517.10147.704572.959551@laputa.namesys.com> <20040420145158.GC1579@backtop.namesys.com> <1EA54599-92F7-11D8-B5AA-000A95CD704C@wagland.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18099-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1EA54599-92F7-11D8-B5AA-000A95CD704C@wagland.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Wagland <paul@wagland.net>
Cc: reiserfs-list@Namesys.COM

On Tue, Apr 20, 2004 at 08:18:27PM +0200, Paul Wagland wrote:
> 
> On Apr 20, 2004, at 16:51, Alex Zarochentsev wrote:
> 
> >On Tue, Apr 20, 2004 at 05:37:39PM +0400, Nikita Danilov wrote:
> >>Paul Wagland writes:
> >>>Just to summarise everything that is written below, this is what 
> >>>bonnie
> >>>is doing:
> >>>1. write 3.5 GB onto a 4GB partition. This works
> >>>2. delete 3.5 GB from a 4GB partition. This works.
> >>
> >>Disk blocks freed during transaction are not actually freed until
> >>transaction commits.
> 
> Under what conditions do transactions get committed? Alex mentioned 
> below that every write is an implicit commit. 

no. write should cause a commit _only_ if no free space.

df (for reiser4) does not show correct free block counter value.  It shows (1)
amount of reiser4 free blocks plus (2) blocks which can be freed by atom
commits.  Those blocks are _potentially_ free.  If blocks (1) are not enough,
reiser4 has to commit atoms to free blocks (2).

The explanation above is simplified a bit.  Indeed, atom commit may free more
blocks, some blocks are reserved for wandered log and they are freed after
commit, some blocks can be freed by squalloc (node squeeze and allocate)
operation which precedes atom commit. 

> Is that the only 
> situation? Other than sync obviously :-)

1. atom (transaction) is too old or too large.

2. VM asks for memory and reiser4 failed to free memory ways other than
atom commit.

3. fsync.

4. reiser4 consideres the situation as close to OOM.  reiser4_writepage() may
   force atoms to commit.

> 
> >>>3. I check using df that the disk space is free. That works.
> >>
> >>But that "delayed freeing" confused users (they did cp, rm, but df has
> >>still showed that space is used), so that statfs(2) (system call used 
> >>by
> >>df) was modified to take these delayed blocks into account and pretend
> >>that they are free.
> 
> OK, that I can deal with, rm'ing a file should free the space ;-). 
> However, if the transaction is not committed at this point, what 
> happens if I lose power at this point? Is the filesystem rolled back to 
> before the deletions?
> 
> >>>4. write 3.5GB onto a 4GB partition. This fails.
> >>
> >>Try to repeat this with sync before step 4.
> 
> OK, here is the results of the test. I have decided to run it without 
> bonnie, just to make sure that it was not the determining factor.
> 
> -----------------
> 
> tidbit:~# mount | grep /mnt/sdr
> /dev/sdr1 on /mnt/sdr type reiser4 (rw)
> tidbit:~# df /mnt/sdr
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/sdr1              3984228       292   3983936   1% /mnt/sdr
> tidbit:~# dd if=/dev/zero of=/mnt/sdr/ddtest bs=512K count=7K ; rm 
> /mnt/sdr/ddtest; df /mnt/sdr; dd if=/dev/zero of=/mnt/sdr/ddtest 
> bs=512K count=7K ; rm /mnt/sdr/ddtest; df /mnt/sdr
> 7168+0 records in
> 7168+0 records out
> 3758096384 bytes transferred in 70.899981 seconds (53005605 bytes/sec)
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/sdr1              3984228       292   3983936   1% /mnt/sdr
> dd: writing `/mnt/sdr/ddtest': No space left on device
> 613+0 records in
> 612+0 records out
> 321384448 bytes transferred in 3.378787 seconds (95118291 bytes/sec)
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/sdr1              3984228       296   3983932   1% /mnt/sdr
> tidbit:~# dd if=/dev/zero of=/mnt/sdr/ddtest bs=512K count=7K ; rm 
> /mnt/sdr/ddtest; df /mnt/sdr; sync; dd if=/dev/zero of=/mnt/sdr/ddtest 
> bs=512K count=7K ; rm /mnt/sdr/ddtest; df /mnt/sdr
> 7168+0 records in
> 7168+0 records out
> 3758096384 bytes transferred in 73.244216 seconds (51309122 bytes/sec)
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/sdr1              3984228       296   3983932   1% /mnt/sdr
> 7168+0 records in
> 7168+0 records out
> 3758096384 bytes transferred in 70.666456 seconds (53180768 bytes/sec)
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/sdr1              3984228       292   3983936   1% /mnt/sdr
> 
> ----------------
> 
> 
> >>>At the time of failure, according to df there is stiff 3.5 GB
> >>>free. So, I say that reiser4 has a problem.
> >>
> >>df lies.
> 
> No. df tells the user what reiser4 tells df. If df is lying it is 
> because reiser4 has lied to it. If df tells me that there is 3.9GB 
> available on the filesystem, then I expect that filesystem to allow me 
> to write 3.9GB to it.

Yes. reiser4_stafs() was changed expecting that reiser4_filewrite(), for
example, would free that space if necessary.

I committed a fix for reiser4_write().  However it is not tested yet.

> >reiser4_statfs() was changed to report deleted blocks as free space 
> >immediately
> >after rm(1).
> 
> As mentioned above, this makes perfect sense, and leads to more 
> 'intuitive' behaviour from the filesystem. I fully expect that the 
> filesystem should change "established semantics", and in this sense the 
> above change keeps these semantics, which is a good thing :-)
> 
> >It was done because reiser4_write() should trigger fs commit and 
> >recover free
> >space.   If commit does not happen, it is a reiser4 bug.
> 
> In that case I humbly submit that I have found a reiser4 bug :-)
> 
> Cheers,
> Paul

Thanks.

-- 
Alex.
