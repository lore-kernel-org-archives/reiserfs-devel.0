From: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Subject: Re: reiserfsck 3.6.8 + corrupted filesystem
Date: Thu, 03 Jul 2003 11:46:41 -0400
Message-ID: <pan.2003.07.03.11.46.40.824752.5077@umail.hungrycats.org>
References: <pan.2003.07.02.13.31.41.846811.20132@umail.hungrycats.org> <200307022231.36007.vitaly@namesys.com> <pan.2003.07.02.19.12.09.969889.20132@umail.hungrycats.org> <pan.2003.07.02.19.12.09.969889.20132@umail.hungrycats.org> <200307031516.44549.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-14818-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu, 03 Jul 2003 07:16:44 -0400, Vitaly Fertman wrote:

> On Thursday 03 July 2003 03:12, Zygo Blaxell wrote:
>> On Wed, 02 Jul 2003 14:31:36 -0400, Vitaly Fertman wrote:

> Ok, I will try to make it clear and any suggestions are appreciated.

I suggest you start with a description of the immediate problem, which
should include what was expected, what was found, and where it was found.
Sometimes that does happen but sometimes the message is simply "only
leaves expected" which doesn't tell me which kind of non-leaf thing it
found.  Then after that suggest possible causes, like bad memory.

I wouldn't mind a hex dump of a few relevant data structures either...I
really miss having a tool like debugfs for ext[23] filesystems lying
around.  I can often fix an ext3 filesystem by hand when e2fsck gets
confused by wildly inconsistent data.  :-P

> Actually in-memory data only are conserned here, they are not written to
> disk and read again, trey all the time in the memory and just a part of
> them will be written to disk at the end of fscking.

Uhhh, I've observed a lot of writes to otherwise idle disks while running
reiserfsck.  I had assumed that it was reiserfsck doing those writes,
although I haven't attached strace to be sure.  When reiserfsck says
various things are "deleted" in pass0, has it not modified something on
the disk at that time?

>> I'll exercise RAM and disks over the next N days to try to eliminate
>> hardware as a possible cause.
>
