From: berthiaume_wayne@emc.com
Subject: RE: fsync() Performance Issue
Date: Mon, 29 Apr 2002 13:26:06 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D0049BF979@corpusmx1.us.dg.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10200-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mason@suse.com
Cc: russell@coker.com.au, tdickenson@geminidataloggers.com, reiserfs-list@namesys.com

	Agreed, it would be better to sync to disk after multiple files
rather than serially; however, in the interest of not being concerned of a
power outage during the process, one of the reason the disk cache is
disabled, the choice was to fsync() each write.  

-----Original Message-----
From: Chris Mason [mailto:mason@suse.com]
Sent: Monday, April 29, 2002 12:46 PM
To: tdickenson@geminidataloggers.com
Cc: Russell Coker; berthiaume_wayne@emc.com; reiserfs-list@namesys.com
Subject: Re: [reiserfs-list] fsync() Performance Issue


On Mon, 2002-04-29 at 12:32, Toby Dickenson wrote:

> >One thing that has occurred to me (which has not been previously
discussed as 
> >far as I recall) is the possibility for using sync() instead of fsync()
if 
> >you can accumulate a number of files (and therefore replace many
fsync()'s 
> >with one sync() ).
> 
> I can see
> 
> write to file A
> write to file B
> write to file C
> sync
> 
> might be faster than
> 
> write to file A
> fsync A
> write to file B
> fsync B
> write to file C
> fsync C

Correct.

> 
> but is it possible for it to be faster than
> 
> write to file A
> write to file B
> write to file C
> fsync A
> fsync B
> fsync C

It depends on the rest of the system.  sync() goes through the big lru
list for the whole box, and fsync() goes through the private list for
just that inode.  If you've got other devices or files with dirty data,
case C that you presented will always be the fastest.  For general use,
I like this one the best, it is what the journal code is optimized for.

If files A, B, and C are the only dirty things on the whole box, a
single sync() will be slightly better, mostly due to reduced cpu time.

-chris

