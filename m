From: Ingo Bormuth <ibormuth@efil.de>
Subject: Re: [patch] reiser4-for-2.6.20
Date: Sun, 11 Feb 2007 04:08:43 +0100
Message-ID: <20070211030843.GA11530@efil.de>
References: <20070205030106.GA10122@efil.de> <8898527.post@talk.nabble.com> <20070210150900.GA8973@efil.de> <8901836.post@talk.nabble.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30564-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <8901836.post@talk.nabble.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: squadra <jg@internetx.de>
Cc: reiserfs-list@namesys.com

On 2007-02-10 07:47, squadra wrote:
> diff -puN fs/fs-writeback.c~reiser4-sb_sync_inodes-fix fs/fs-writeback.c
> --- a/fs/fs-writeback.c~reiser4-sb_sync_inodes-fix
> +++ a/fs/fs-writeback.c
> @@ -317,6 +317,8 @@ int generic_sync_sb_inodes(struct super_
>         const unsigned long start = jiffies;    /* livelock avoidance */
>         int ret = 0;
> 
> +       spin_lock(&inode_lock);
> +
>         if (!wbc->for_kupdate || list_empty(&sb->s_io))
>                 list_splice_init(&sb->s_dirty, &sb->s_io);
> 
> 
> since i applied this patch ontop of yours, the error didnt accour anymore. 

Nice to hear that you Problem has gone away.

Nevertheless I'm a bit confused. The 'spin_lock(&inode_lock);' line is
already there (it's part of the official code since reiser4-for-2.6.11).

There might have been an other issue...

Cheers

   Ingo


-- 
Ingo Bormuth, voicebox & fax: +49-(0)-12125-10226517
public key 86326EC9, http://ibormuth.efil.de/contact

