From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: reiserfs v3 patches updated - Bug
Date: Tue, 13 Apr 2004 16:57:14 +0200
Message-ID: <200404131657.14577.christian.mayrhuber@gmx.net>
References: <1081210239.4994.69.camel@watt.suse.com> <200404071714.39187.christian.mayrhuber@gmx.net> <1081382282.5111.9.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17887-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081382282.5111.9.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

On Thursday 08 April 2004 01:58, you wrote:

> Strange stuff, we can't reproduce it here.  Are you sure you've got the
> whole patch set applied (maybe missing permission-reiserfs?)
>
> Thanks for the strace, we'll have to debug this when you get back.
>
> -chris

I can confirm, this is a non-bug.
I guess there was some old patch lurking around in my local kernel tree.
With a clean 2.6.5 from kernel.org this bug does not exist.

"quilt push -a" Applied:
reiserfs-nesting-02
reiserfs-journal-writer
reiserfs-logging
reiserfs-jh-2
reiserfs-prealloc
reiserfs-tail-jh
reiserfs-writepage-ordered-race
reiserfs-file_write_hole_sd.diff
reiserfs-laptop-mode
reiserfs-truncate-leak
reiserfs-ordered-lat
reiserfs-dirty-warning
reiserfs_kfree-warning-fix.patch
reiserfs-end-trans-bkl
reiserfs-acl-mknod.diff
reiserfs-xattrs-04
reiserfs-acl-02
reiserfs-trusted-02
reiserfs-selinux-02
reiserfs-xattr-locking-02
reiserfs-quota
permission-reiserfs
reiserfs-warning.linus
reiserfs-group-alloc-8
reiserfs-delayed-work

Mount options:
rw,noatime,nodiratime,acl,user_xattr,data=ordered,alloc=skip_busy:dirid_groups,packing_groups

Everything looks good, now.
I'll let you know if I experience any strange things.

-- 
lg, Chris
