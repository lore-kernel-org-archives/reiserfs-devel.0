From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 sending process to D state
Date: Tue, 16 Aug 2005 04:50:09 -0700
Message-ID: <4301D2F1.1030907@namesys.com>
References: <43012902.1010600@webalive.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25516-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43012902.1010600@webalive.biz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mohammad.rahman@webalive.biz
Cc: reiserfs-list@namesys.com, Nate Diller <ndiller@namesys.com>

Nate also reported this, yes?....


Hans

Mohammad A. Rahman wrote:

> Hello,
>
> I am having an issue with reiser4. I am wondering if it is a known
> issue for reiser4 or I have missed something along the path.
>
> #cat /etc/redhat-release
> Red Hat Enterprise Linux ES release 3 (Taroon Update 5)
>
> Downloaded 2.6.12 vanila kernel, applied mm2 patch (2.6.12-mm2) and
> then aapplied reiser4 patch downloaded from namesys for 2.6.12-mm2
> (ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12-mm2/reiser4-vfs-3.patch).
> Kernel compiles and boots ok.
>
> Compiled libaal-1.0.5 and reiser4progs-1.0.5 with ./configure, make
> and make install.
>
> Created reiser4 fs on my disk (/usr/local/sbin/mkfs.reiser4  /dev/sda5)
>
> Mounted the partition (/dev/sda5               /test                  
> reiser4 defaults        1 2)
>
> "dmesg | grep reiser" shows:  loading reiser4 bitmap......done (181
> jiffies)
>
> But when I try to write big amount of data on that partition the
> process hangs and goes to uninterruptible sleep (D) state.
>
> the PS output shows:
>
> root      2375  2.7  0.0  3828  692 pts/1    D    23:21   0:15 cp -i
> -r /usr .
>
> I can easily simulate it with  bonnie++
>
> bonnie++ -u user:user -d /test -s 4096m -m hudson -n 32:100000:16:256
> -b -q
>
> which also jumps into uninterruptible sleep (D) state.
>
> After having this issue, I tried using
> libaal-1.0.4/reiser4progs-1.0.4. Tried 2.6.11 kernel, 2.6.13-rc4 - but
> all with no joy.
>
> For all these trials, I used vanilla kernel with appropriate mm patch
> and the appropriate patch downloaded from namesys (on top of that).
>
> Once the process goes to state D, the log shows the following output:
>
> reiser4[pdflush(99)]: writeout (fs/reiser4/vfs_ops.c:586)[nikita-31001]:
> code: -12 at fs/reiser4/wander.c:1268
> WARNING: Flush failed: -12
> reiser4[pdflush(99)]: writeout (fs/reiser4/vfs_ops.c:586)[nikita-31001]:
> code: -12 at fs/reiser4/wander.c:1268
> WARNING: Flush failed: -12
> reiser4[pdflush(99)]: writeout (fs/reiser4/vfs_ops.c:586)[nikita-31001]:
> code: -12 at fs/reiser4/wander.c:1268
> WARNING: Flush failed: -12
> reiser4[pdflush(99)]: writeout (fs/reiser4/vfs_ops.c:586)[nikita-31001]:
> code: -12 at fs/reiser4/wander.c:1268
> WARNING: Flush failed: -12
> reiser4[pdflush(99)]: writeout (fs/reiser4/vfs_ops.c:586)[nikita-31001]:
> code: -12 at fs/reiser4/wander.c:1268
> WARNING: Flush failed: -12
> reiser4[pdflush(99)]: writeout (fs/reiser4/vfs_ops.c:586)[nikita-31001]:
> code: -12 at fs/reiser4/wander.c:1268
> WARNING: Flush failed: -12
> reiser4[pdflush(99)]: writeout (fs/reiser4/vfs_ops.c:586)[nikita-31001]:
> code: -12 at fs/reiser4/wander.c:1268
> WARNING: Flush failed: -12
> reiser4[pdflush(99)]: writeout (fs/reiser4/vfs_ops.c:586)[nikita-31001]:
> code: -12 at fs/reiser4/wander.c:1268
> WARNING: Flush failed: -12
> reiser4[pdflush(99)]: writeout (fs/reiser4/vfs_ops.c:586)[nikita-31001]:
> code: -12 at fs/reiser4/wander.c:1268
> WARNING: Flush failed: -12
>
> Thanks and will look for some feedback.
>
> MR
>
>
> P.S: If the partition is mounted as ext3, or xfs - it is working as
> expected.
>
>
>

