From: Valentine Sinitsyn <Valentine.Sinitsyn@usu.ru>
Subject: Re[2]: reiser4 and laptop_mode
Date: Wed, 19 Oct 2005 18:22:20 +0600
Message-ID: <768831735.20051019182220@usu.ru>
References: <19812996093.20051017162429@usu.ru> <43545DCF.1070301@namesys.com>
 <e692861c0510171934m56e2a41dw8a780eb6ddb02f6e@mail.gmail.com>
 <200510191233.48315.zam@namesys.com>
Reply-To: Valentine Sinitsyn <Valentine.Sinitsyn@usu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26568-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510191233.48315.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Hi all,

Wednesday, October 19, 2005, 2:33:47 PM, you wrote:

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
I don't think so. As far as I understand from linux-2.6.10 sources and
docs, laptop_mode works in a following way: it gently "removes"
all pdflush() calls in memory-management code and creates a timer with
pdflush(sys_sync(),0) as callback function. Then, every operation which can cause
spin-up (maybe even reading, but I don't know for sure) advance this
timer for laptop_mode*HZ amount of seconds thus guaranteeing that no
writing of dirty-pages will occur during this period and hard disk
will have time to spin-down. So, to conclude, kernel does not know
when disk spins down but it know the functions which may cause him to
spin-up.

>> In the future when enough API is exposed to make a nice interface for
>> multi-syscall transactions with partial sync (i.e. only forced syncs
>> of blocks related to transactions which demand physical fixation), it
>> would be nice if the commit logic were smart enough to grab other
>> nearby small transactions and batch them into the same commit.

AZ> If there is a fs-specific 'prepare-to-disk-spindown' hook we can scan the atom
AZ> list and commit all atoms which may cause the disk to be woken up too early.
Don't know anything about hooks. As I've said earlier, the only
filesystem which deals with laptop_mode explicitly is XFS and the
reason (in my opinion) is because it has it's own syncing daemon
separate from mm-code and the rest.

I'm not quite familiar with kernel internals but I suspect that if
Reiser4 use standard kernel facilities to commit atoms (and these
writeback functions are aware of laptop_mode), it should be compatible
in sense I've asked for.

Best regards,
Valentine

