From: Oleg Drokin <green@namesys.com>
Subject: Re: merge 2.4.21-pre4 with Direct IO bug fix
Date: Mon, 10 Mar 2003 17:33:08 +0300
Message-ID: <20030310173308.A22176@namesys.com>
References: <20030304013450.249cc096.philippe.gramoulle@mmania.com> <20030304111807.A18814@namesys.com> <20030310131528.B9033@humilis> <20030310152801.F19773@namesys.com> <20030310141605.D9033@humilis> <20030310164035.I19773@namesys.com> <20030310152352.F9033@humilis>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13174-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030310152352.F9033@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ookhoi <ookhoi@humilis.net>
Cc: Chris Mason <mason@suse.com>, reiserfs <reiserfs-list@namesys.com>

Hello!

On Mon, Mar 10, 2003 at 03:23:53PM +0100, Ookhoi wrote:
> > > For some reason, the mount options are not listed.
> > This is because reiserfs is lacking necessary callback to print it's
> > current mount options in /proc/mounts, I think.
> That would fix setups which have a link to /proc/mounts most likely?

Not likely.
quota tools seems to be confused by non-existent /dev/root reported as mounted.
According to man page, quota tools look for "usr/grpquota" in /etc/fstab.

> Anyway, let me know when you come to amsterdam, ok? ;-)

This is not likely to happen any time soon unfortunatelly.

> Btw, quota works (just tested it).

That's good. I do not need to fix it then ;)

Bye,
    Oleg
