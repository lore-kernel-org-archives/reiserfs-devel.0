From: Wayne Scott <wscott@bitmover.com>
Subject: Re: EACCESS vs ENOENT for nonexistent files-within-files
Date: Mon, 13 Sep 2004 09:25:58 -0500 (EST)
Message-ID: <20040913.092558.92560723.wscott@bitmover.com>
References: <20040913140637.GB29591@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21716-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040913140637.GB29591@redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: jorton@redhat.com
Cc: reiserfs-list@namesys.com

From: Joe Orton <jorton@redhat.com>
> Hi, we had a bug report that Apache httpd logs a spurious error for
> every file served from a reiser4 filesystem, because httpd assumes that
> /path/to/file/.htaccess (where /path/to/file is a normal file) returns
> ENOENT or ENOTDIR, but reiser4 returns EACCES in this case.

Thank you.  I was just tracking down a similar problem with BitKeeper
that is explained by this bug.  You saved me some work.

-Wayne
