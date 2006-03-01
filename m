From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 00/11] reiserfs: xattr rework
Date: Wed, 1 Mar 2006 13:34:06 +0100
Message-ID: <20060301123406.GA20367@atrey.karlin.mff.cuni.cz>
References: <20060220201457.GA23204@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28176-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060220201457.GA23204@locomotive.unixthugs.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>, "E. Gryaznova" <grev@namesys.com>

  Hello,

> Following this message is a series of 11 patches that rework the reiserfs
> xattr code. The current implementation open codes a number of functions that
> are well tested and stable elsewhere, but will slight modifications. It also
> does a number of things suboptimally, such as operations that affect all of
> the xattrs associated with an inode, as well as not handling journalling as
> well as can be.
> 
> I've run them through a weekend of stress testing successfully, but I'd like
> some additional testing before considering them safe.
> 
> Here's the run down:
> 
> * 01 - Make internal xattr operations use vfs ops
>   This eliminates the open coding of the read/write loops in favor of using
>   vfs_read and vfs_write. Performance-wise, it's very little difference
>   from the open coding, and implementation-wise, it's more tested. Yes, this
>   violates the no-file-io-in-the-kernel rules, but this rule has been violated
>   since the day the original patches were accepted.
  I'm not completely sure but from briefly looking at the patches I
think there might be the following problem: you first start a transaction
and then call a VFS write operation. That will lock a page it wants to
write. But if bdflush works on the xattr file and sends some dirty data
to disk, it will first take page lock and then start the transaction.
This introduces essentially a lock inversion (as starting a transaction
behaves like taking a lock) and hence deadlocks... I've been solving
these for the quota code some time ago (quota also has similar needs as
your xattr code) - I really had some deadlock reports for heavily loaded
machines. There the only reasonable solution was an extra write
functions bypassing the page cache. Maybe in your case you can solve the
problems differently as you don't need the working solution for all the
filesystems but just for Reiserfs. 

									Honza
-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs
