From: Anders Widman <andewid@tnonline.net>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 14:42:19 +0100
Message-ID: <11104354750.20030212144219@tnonline.net>
References: <NDBBJPAGKLCMDEIEKOPBKEKHKFAA.mailinglists@websitemanagers.com.au>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12714-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <NDBBJPAGKLCMDEIEKOPBKEKHKFAA.mailinglists@websitemanagers.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>> Anders Widman wrote:
>> >>If we handle the journal block error without downtime, the user will
>> >>never chuck the hard drive, and that is bad in the longterm.
>> >  But  a  user  never  knows  he  has  a media error before his system
>> >  crashes  (or  do  a surface scan), or monitor his logs very closely.
>> >  Not all users does this.
>> >
>> >  To  me  a FS should be able to handle both read and write errors and
>> >  be  able to reallocate these errors to a sane are of the media. When
>> >  this  occurs then it should be noted in the kernel log (or similar).
>> >
>> >  Then  users can run a cron job to monitor the log after exactly this
>> >  error message.

> [SNIP]

> While this is all perfectly true, there also remains the question of "If we
> *know* the media is faulty in this spot, how do we know the media isn't
> faulty in these spots?"

> ie, once you are on faulty hardware, you never really know what is the
> correct course of action for this specific fault.

> I can conceive of a few things that *might* be the right thing in various
> circumstances:

> A) Immediately re-mount the drive read-only, and wait for the sysadmin to
> either re-mount rw or to do some other data recovery/repair

This  would be devastating for some form of servers and cause downtime
and  loss  of  work  for  plenty. Consider an application server, or a
document  server within a company. If writes were prohibited then lots
of programs do stop function, or saving fails.

There  are  millions  of other examples I can think of too, that would
make me not choose this option.

Unplanned downtime do cause lot of harm to any business.

> B) Immediately dis-mount the drive and wait

Urg.. Even worse than the above case.

> C) OK, I tried to write to sector 1324 so lets just try each consecutive
> available sector until it doesn't return an error (possibly marking the
> sectors bad/used as we go)

Yes, or use another algorithm to find safe/free sectors.

> D) Just return an error to the application

This  would  at  least  allow  some  services/applications to continue
running. Still, important data and services may not work.

> Of course, all of the above would *also* log an error message to the kernel
> log.

> Now, some options might be suitable if for example the head of the disk has
> crashed into the surface and hence the more you attempt to
> read/write/seek/etc the more damage you do (as opposed to immediately
> stopping all access to the disk and thereby preserving the data).
> Some options are more suitable for example you have a system which
> absolutely needs to run 20 hours/7days and it is only writing to disk as a
> informational log.

Agreed.  There  are  many  different  cases  that  should  be met with
different approaches.

> Of course, it all depends on the reason the hardware error has showed it's
> ugly face, and what your individual circumstances are. Perhaps re-mapping is
> just making the corruption worse (for every write the drive gets more
> confused and scribbles in the wrong spot)...

I  am  not  sure about that. You certainly do not write on top of user
data,  but  on (marked) free space. If the drive cannot write, then no
harm  would  be  done  to  the  user data anyway. Of course in case of
electronics failure/firmware failure then you would perhaps get random
writes  instead  of  where  you want them. However I believe you would
have more serious problems before then (like not being able to read).

> Like most things MS do, they just take the common approach and pretend that
> it will work for everyone.

Easy  to  blame  MS, but Bad Blocks handling from FAT12 and ever since
has probably saved more data than not having it.

Just  because  MS  does  things it does not mean they are bad and that
Linux   world  should  refuse  to  do  something similar. That is just
shooting yourself in the foot.

> Just my 0.02c worth.

How about 0.00c? ;)

- Anders




