From: Sander <sander@humilis.net>
Subject: Reiser4 slowdown gone  (was: Re: 2.6.16-rc1-mm4)
Date: Mon, 30 Jan 2006 08:25:30 +0100
Message-ID: <20060130072529.GA1677@favonius>
References: <20060129144533.128af741.akpm@osdl.org>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27927-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060129144533.128af741.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: reiserfs-list@namesys.com

Andrew Morton wrote (ao):
> ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.16-rc1/2.6.16-rc1-mm4/

> +reiser4-big-update-bug-fix-for-readpage-fix.patch
> +reiser4-warnings-cleanup.patch
> +reiser4-do-not-use-get_user_pages-and-do-not-check.patch
> 
>  reiser4 fixes and cleanups

Jumping from 2.6.15-rc1-mm1 to 2.6.16-rc1-mm4.

For me the Reiser4 slowdown[1] reported on the Reiserfs mailinglist are
gone with this kernel.

[1] http://humilis.net/reiser4slowdown.html
