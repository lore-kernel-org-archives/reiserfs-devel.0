From: Valentine Sinitsyn <Valentine.Sinitsyn@usu.ru>
Subject: Re[2]: reiser4 and laptop_mode
Date: Wed, 19 Oct 2005 20:48:31 +0600
Message-ID: <1828816731.20051019204831@usu.ru>
References: <19812996093.20051017162429@usu.ru> <43545DCF.1070301@namesys.com>
 <e692861c0510171934m56e2a41dw8a780eb6ddb02f6e@mail.gmail.com>
 <200510191233.48315.zam@namesys.com>
Reply-To: Valentine Sinitsyn <Valentine.Sinitsyn@usu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26569-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510191233.48315.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Hello,

please ignore my previous post. It was wrong (not in a whole, but...).

AZ> On Tuesday 18 October 2005 06:34, Gregory Maxwell wrote:
>> On 10/17/05, Hans Reiser <reiser@namesys.com> wrote:
>> > > In fact, if you have enough RAM, you won't ever touch the
>> > >disk -- deleting a file before it's committed means it never touches
>> > > disk.
>> > >
>> > >It is not as spindown-friendly as laptop_mode, which notices when the
>> > >drive has to spin up anyway (maybe through a read) and flushes all
>> > >writes.  Don't know if they are compatible.
>> >
>> > We should work to integrate well with it.  Zam, can you look at that?
>> > Thanks.
>>
>> Actually, laptop mode flushes when there is a write and sync all
>> pending transactions just before spindown. (delaying the write as long
>> as possible to hopefully get as much in one pass as possible).

AZ> Does the kernel really know when the disk spins down?
No, kernel doesn't know when the disk is going to spin down. But it
certainly knows operations which will cause drive to spin up. And, at the
very end of such operations laptop_mode schedules writeback of all
filesystem data. This is done via laptop_io_completion() call in
end_that_request_last() function from drivers/block/ll_rw_blk.c.
By default, this occurs two seconds after the above-mentioned operation and
is controlled by /proc/sys/vm/laptop_mode value and laptop_mode_wbr_timer
timer defined in mm/page-writeback.c. This timer wakes up pdflush() and
cause it to do_sync(0) as defined in fs/buffer.c. laptop_mode uses
some logic to prolong timer if hard disk is still in use and stop it
if syncing occurs before the specified period. One can certainly expect
that HD would not spun down during two seconds after the IDE operation so
filesystem writeback will not cause another spinup.

>> In the future when enough API is exposed to make a nice interface for
>> multi-syscall transactions with partial sync (i.e. only forced syncs
>> of blocks related to transactions which demand physical fixation), it
>> would be nice if the commit logic were smart enough to grab other
>> nearby small transactions and batch them into the same commit.

AZ> If there is a fs-specific 'prepare-to-disk-spindown' hook we can scan the atom
AZ> list and commit all atoms which may cause the disk to be woken up too early.
As far as I understand, no. According to the scheme described above,
it seems that you are compatible with laptop_mode if you are just
marking your objects dirty and let
pdflush/page-writeback.c/fs-writeback.c do their work to sync it with
disk. If you are using alternative syncing scheme (like XFS which has
it's own sync daemon), you need some patches.
Anyway, this is just my assumptions so I'll be grateful if someone
from kernel hackers can prove it or point out what's wrong with it.
Also it will be interesting to know if  Reiser4 is compatible with
laptop_mode from this point of view (if it is true, of course). Many
thanks in advance.

Best regards,
Valentine

