From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: udpated data logging available
Date: Mon, 23 Jun 2003 18:53:03 +0200
Message-ID: <200306231853.04098.christian.mayrhuber@gmx.net>
References: <1055764071.24111.650.camel@tiny.suse.com> <1055944613.5545.22.camel@tiny.suse.com> <1056336342.5545.376.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14672-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1056336342.5545.376.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Am Montag, 23. Juni 2003 04:45 schrieb Chris Mason:
> On Wed, 2003-06-18 at 09:56, Chris Mason wrote:
> > Hello again,
> >
> > ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21/experimental
> >
> > Has two additional patches.  The first is io-stalls-logging-6.diff,
> > which is very similar to the io stalling code I've been posting on the
> > linux kernel list.  It's unrelated to reiserfs really, and fixes some
> > fairness issues at the block device layer.
> >
> > The second is reiserfs-jh-1, which changes where the lists live for
> > data=ordered and tail buffers.  It allows us to do a few things:
>
> Hello all, I've updated the reiserfs-jh patch, it's now at
> reiserfs-jh-2.  The major changes are tested O_DIRECT + data=ordered
> support, and a bug fix for an oops under memory pressure.
>
> In general the patch has had a few more hours of testing on it now, and
> I'm less worried about it making your computer catch on fire if you give
> it a try.
>
> -chris

This patch does better than reiserfs-jh-1, though It didn't eat the data on my system.
I was unable to login as root (both tty and su) for about 2 minutes after system
boot with the -1 patch (data=ordered mode and root fs on software raid1).

2.4.21 + data_logging and 2.4.21+data_logging + reiserfs-jh-2 + io-stalls-logging-6 does not
show this behaviour.

The quota patches seem to work with the experimental data logging stuff, too.
The system latency is bad during heavy  io, but this could hold true for all of the 2.4.x kernel series.
You can try it yourself if you  issue the command "dd if=/dev/zero of=tst bs=102400" in a shell and
now try to start another app. (I did this to test the user quota.)
-- 
lg, Chris


