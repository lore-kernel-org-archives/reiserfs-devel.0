From: Chris Mason <mason@suse.com>
Subject: Re: Data corrupted after crash
Date: 26 Jul 2002 11:17:48 -0400
Message-ID: <1027696668.8530.255.camel@tiny>
References: <m34renr8vj.fsf@toyland.sauerland.de>
	<20020726131943.A18706@namesys.com>  <20020726134405.D4DB145B@hofmann>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11085-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020726134405.D4DB145B@hofmann>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Vilain <sam@vilain.net>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

On Fri, 2002-07-26 at 09:44, Sam Vilain wrote:
> Oleg Drokin <green@namesys.com> wrote:
> 
> > No. Reiserfs provides only metadata journaling. So the data itself still
> > may be damaged (data still may be damaged even in case of full data
> > journaling just because there is no API for applications to control
> > transactions currently)
> 
> Still, data journalling would be nice.  I must say that when reiserfs gets
> the power taken out from under it, you don't half end up with your
> recently worked on files containing pieces of each other.
> 
> With data journalling, this would not be a problem; although of course
> files could end up in a half-updated state, which to a given application
> may as well be corrupted.  It would be a bit slower, unless your journal is on a seperate device, but that can't be helped.

Actually, data journaling doesn't give you much more protection than
ordered write mode.  This is because userspace has no way to influence
which data gets included into a given transaction.  So, if you write
16k, it might become 1 atomic unit or 4, you have no way of knowing.

Both ordered data mode and journaled data mode make sure that new blocks
added to a file are flushed before the transaction commits.  This makes
sure you don't get garbage in the file.

journaled data mode also make sure that a single block is written as an
atomic unit.  If your 4k block spans 8 512 byte sectors on the drive,
you know after a crash all 8 will either be updated or not changed at
all.

journaled data mode also gives you complete ordering of data writes with
respect to the metadata.  So, if a single process does this:

create(file1)
write(file1)
rename(file1, file2)
write(file2)

You know that each step along the chain will either include the previous
step or not be done at all.  In other words, you know the rename won't
happen without the data in file1 being updated.

Most people don't really need either feature, and data=ordered is faster
most of the time.  data journaled mode can be much faster for
synchronous data writes though.

You can try the current data logging patches at:

ftp.suse.com/pub/people/mason/patches/data-logging

I've just uploaded data-logging-20.diff, which should fix a bug where
some writes were not properly ordered if you crashed right after a
truncate or tail conversion (it might take the mirror a few minutes to
update).  

-chris



