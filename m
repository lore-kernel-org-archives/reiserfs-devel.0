From: "Adam Goryachev" <mailinglists@websitemanagers.com.au>
Subject: RE: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 22:12:36 +1100
Message-ID: <NDBBJPAGKLCMDEIEKOPBKEKHKFAA.mailinglists@websitemanagers.com.au>
References: <3E4A2634.8020609@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12707-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E4A2634.8020609@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Anders Widman wrote:
> >>If we handle the journal block error without downtime, the user will
> >>never chuck the hard drive, and that is bad in the longterm.
> >  But  a  user  never  knows  he  has  a media error before his system
> >  crashes  (or  do  a surface scan), or monitor his logs very closely.
> >  Not all users does this.
> >
> >  To  me  a FS should be able to handle both read and write errors and
> >  be  able to reallocate these errors to a sane are of the media. When
> >  this  occurs then it should be noted in the kernel log (or similar).
> >
> >  Then  users can run a cron job to monitor the log after exactly this
> >  error message.

[SNIP]

While this is all perfectly true, there also remains the question of "If we
*know* the media is faulty in this spot, how do we know the media isn't
faulty in these spots?"

ie, once you are on faulty hardware, you never really know what is the
correct course of action for this specific fault.

I can conceive of a few things that *might* be the right thing in various
circumstances:

A) Immediately re-mount the drive read-only, and wait for the sysadmin to
either re-mount rw or to do some other data recovery/repair

B) Immediately dis-mount the drive and wait

C) OK, I tried to write to sector 1324 so lets just try each consecutive
available sector until it doesn't return an error (possibly marking the
sectors bad/used as we go)

D) Just return an error to the application

Of course, all of the above would *also* log an error message to the kernel
log.

Now, some options might be suitable if for example the head of the disk has
crashed into the surface and hence the more you attempt to
read/write/seek/etc the more damage you do (as opposed to immediately
stopping all access to the disk and thereby preserving the data).
Some options are more suitable for example you have a system which
absolutely needs to run 20 hours/7days and it is only writing to disk as a
informational log.

Of course, it all depends on the reason the hardware error has showed it's
ugly face, and what your individual circumstances are. Perhaps re-mapping is
just making the corruption worse (for every write the drive gets more
confused and scribbles in the wrong spot)...

Like most things MS do, they just take the common approach and pretend that
it will work for everyone.

Just my 0.02c worth.

