From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: Calling stat with millions of files
Date: Tue, 08 Jun 2004 14:00:54 +0200
Message-ID: <1086696053.2690.37.camel@schlappix.schnulli.de>
References: <Pine.LNX.4.58.0406071735290.30177@localhost.localdomain>
	 <1086688996.1829.79.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19084-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1086688996.1829.79.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> On Tue, 2004-06-08 at 01:54, Ross Skaliotis wrote:
> > We have a backup system (backupPC) that is responsible for backing up
> > millions of files and holding over 2 TB of data. The backup system saves
> > space by creating hard links where it can. This actually reduces the total
> > size down to 200 GB, however there are still millions of files/hard links.
> > 
> > What does this have to do with reiserfs? Well, the partition runs reiserfs
> > 3.6. Over the course of a few months (and the addition of millions more
> > files/hard links) the performance of the filesystem has become painfully
> > slow.
> > 
> > In a directory of ~1000 files, running 'ls -l' or 'stat *' takes 45
> > seconds to complete (assuming nothing is previously cached). We are using
> > the r5 hash, and mount the filesystem with noatime. No one directory has
> > (or will ever have) more than about 2000 files and hard links inside.
> 

Do you have these problems only if you have a lot of files in a
directory or also with smaller directories. I'm using storebackup (which
also uses hard links) for a backup and never had these problems - even
on a slow machine. (I'm using reiserfs 3.6 _with_ tail packing and r5
hash.)

Do you also have these problems when performing a backup?

> > Is this performance decrease when calling stat to be expected with
> > increasing millions of files/hard links? Would XFS or another filesystem
> > get around this somehow? 
> 
> I guess that filesystem which stores on-disk inodes groupped together
> would perform better for this kind of workload.
> 
> > I'd rather not use reiserfs4, as this is a
> > production backup server and needs to be as stable as possible.
> > 
> > Thanks very much for your help,
> > 
> > -Ross Skaliotis
> > 
-- 
Heinz-Josef Claes                     hjclaes@web.de
project: http://sourceforge.net/projects/storebackup
      -> snapshot-like backup to another disk



