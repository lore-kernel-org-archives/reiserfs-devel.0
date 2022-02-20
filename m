From: Matthew Wilcox <willy@infradead.org>
Subject: Is it time to remove reiserfs?
Date: Sun, 20 Feb 2022 12:13:04 +0000
Message-ID: <YhIwUEpymVzmytdp@casper.infradead.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=5WMwUY/lejbGy9budx04ZQZ9mYcj4RUjgOOK6LRIrfw=; b=DyHQ+Kv0tpLuE5sDcAwYJGhVUR
        qAt8z1eS7hx7Y8jIl/rg1raXyiw1G6RRwa1gCQk81UQm36X5bYhkRhqBPdlMGW7I6dWArPn9/7PDs
        PqBRMWIKpY27/5lHsG6hN3GjIm4+0w1sGoMtcCdb4Utx0P/D6+mokcArWE/B1I7itpylQlvF8heoP
        CQixsqj80JBYJAsMGEWDILoWC+a9xsAW/6n0yO8Ii5hG2KB5pPr2lHFgjkIqoLWxncHuIRxKTbs86
        Bt5UPKXYbfBwjG9aJq8RCbxeAMb7ut+29GIOLwCKuHrOozACXG/DkhQGupWcYJfR+FbPPT38Ydcwn
        HFIVJm1Q==;
Content-Disposition: inline
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>

Keeping reiserfs in the tree has certain costs.  For example, I would
very much like to remove the 'flags' argument to ->write_begin.  We have
the infrastructure in place to handle AOP_FLAG_NOFS differently, but
AOP_FLAG_CONT_EXPAND is still around, used only by reiserfs.

Looking over the patches to reiserfs over the past couple of years, there
are fixes for a few syzbot reports and treewide changes.  There don't
seem to be any fixes for user-spotted bugs since 2019.  Does reiserfs
still have a large install base that is just very happy with an old
stable filesystem?  Or have all its users migrated to new and exciting
filesystems with active feature development?

We've removed support for senescent filesystems before (ext, xiafs), so
it's not unprecedented.  But while I have a clear idea of the benefits to
other developers of removing reiserfs, I don't have enough information to
weigh the costs to users.  Maybe they're happy with having 5.15 support
for their reiserfs filesystems and can migrate to another filesystem
before they upgrade their kernel after 5.15.

Another possibility beyond outright removal would be to trim the kernel
code down to read-only support for reiserfs.  Most of the quirks of
reiserfs have to do with write support, so this could be a useful way
forward.  Again, I don't have a clear picture of how people actually
use reiserfs, so I don't know whether it is useful or not.

NB: Please don't discuss the personalities involved.  This is purely a
"we have old code using old APIs" discussion.

