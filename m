From: Chris Mason <mason@suse.com>
Subject: Re: fsync() Performance Issue
Date: 29 Apr 2002 12:45:54 -0400
Message-ID: <1020098755.1735.195.camel@tiny>
References: <93F527C91A6ED411AFE10050040665D0049BF961@corpusmx1.us.dg.com>
	<20020429162020.92AD93EA8@lyta.coker.com.au> 
	<6tsqcu0887p2396p14cn2krqrhh1o0dhfk@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10198-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <6tsqcu0887p2396p14cn2krqrhh1o0dhfk@4ax.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tdickenson@geminidataloggers.com
Cc: Russell Coker <russell@coker.com.au>, berthiaume_wayne@emc.com, reiserfs-list@namesys.com

On Mon, 2002-04-29 at 12:32, Toby Dickenson wrote:

> >One thing that has occurred to me (which has not been previously discussed as 
> >far as I recall) is the possibility for using sync() instead of fsync() if 
> >you can accumulate a number of files (and therefore replace many fsync()'s 
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


