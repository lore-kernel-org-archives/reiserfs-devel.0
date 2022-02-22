From: Jan Kara <jack@suse.cz>
Subject: Re: Is it time to remove reiserfs?
Date: Tue, 22 Feb 2022 11:04:08 +0100
Message-ID: <20220222100408.cyrdjsv5eun5pzij@quack3.lan>
References: <YhIwUEpymVzmytdp@casper.infradead.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1645524249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KGfyKWdEZJhA5+6FN5DHdSypDyy+shnNAH3syJfBIhw=;
        b=fZBn/89ZZ6v6UmwwwdiXYAKlVaPaicKVlFrMRrjRsuIg+qha1jJe52hIbeUj/Ou8+FoxGn
        1cxY8IvRDu6adoTND6bnEMzHGaPT4m1SN3y9b+dJp4u9TiTNfNJfB3iGiVi2GZwJSxIJQK
        sxMy0MBE0iA1ofp773/AvwesyjMgtb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1645524249;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KGfyKWdEZJhA5+6FN5DHdSypDyy+shnNAH3syJfBIhw=;
        b=gUyIalokRoQw6vM3QJW4ZE4IYfyI+MvEfaOOT6h4z5naBLtUqhtzXIpz2AQEHPGX/uP8ME
        Qr0jYJVeXr+qZYAg==
Content-Disposition: inline
In-Reply-To: <YhIwUEpymVzmytdp@casper.infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>

Hello!

On Sun 20-02-22 12:13:04, Matthew Wilcox wrote:
> Keeping reiserfs in the tree has certain costs.  For example, I would
> very much like to remove the 'flags' argument to ->write_begin.  We have
> the infrastructure in place to handle AOP_FLAG_NOFS differently, but
> AOP_FLAG_CONT_EXPAND is still around, used only by reiserfs.
> 
> Looking over the patches to reiserfs over the past couple of years, there
> are fixes for a few syzbot reports and treewide changes.  There don't
> seem to be any fixes for user-spotted bugs since 2019.  Does reiserfs
> still have a large install base that is just very happy with an old
> stable filesystem?  Or have all its users migrated to new and exciting
> filesystems with active feature development?
> 
> We've removed support for senescent filesystems before (ext, xiafs), so
> it's not unprecedented.  But while I have a clear idea of the benefits to
> other developers of removing reiserfs, I don't have enough information to
> weigh the costs to users.  Maybe they're happy with having 5.15 support
> for their reiserfs filesystems and can migrate to another filesystem
> before they upgrade their kernel after 5.15.
> 
> Another possibility beyond outright removal would be to trim the kernel
> code down to read-only support for reiserfs.  Most of the quirks of
> reiserfs have to do with write support, so this could be a useful way
> forward.  Again, I don't have a clear picture of how people actually
> use reiserfs, so I don't know whether it is useful or not.
> 
> NB: Please don't discuss the personalities involved.  This is purely a
> "we have old code using old APIs" discussion.

So from my distro experience installed userbase of reiserfs is pretty small
and shrinking. We still do build reiserfs in openSUSE / SLES kernels but
for enterprise offerings it is unsupported (for like 3-4 years) and the module
is not in the default kernel rpm anymore.

So clearly the filesystem is on the deprecation path, the question is
whether it is far enough to remove it from the kernel completely. Maybe
time to start deprecation by printing warnings when reiserfs gets mounted
and then if nobody yells for year or two, we'll go ahead and remove it?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
