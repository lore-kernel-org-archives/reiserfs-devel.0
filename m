From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: reiserfsck infinite loop at pass2 (built by Debian).
Date: Fri, 18 Apr 2003 17:26:28 +0200
Message-ID: <200304181726.28793.Dieter.Nuetzel@hamburg.de>
References: <200304181604.28955.vitaly@namesys.com> <200304181710.23731.Dieter.Nuetzel@hamburg.de> <20030418191144.A10228@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13711-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030418191144.A10228@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, Ed Boraas <ed@debian.org>

Am Freitag, 18. April 2003 17:11 schrieb Oleg Drokin:
> Hello!
>
> On Fri, Apr 18, 2003 at 05:10:23PM +0200, Dieter N?tzel wrote:
> > what about the "double" checking during bootup since 3.6.5+patch
> > (3.6.6-pre1)? I get two check sequences since the latest version.
> > First round from fsck.reiserfs (-a/-p) but sadly not logged and then the
> > below.
>
> What led you to think you have two check sequences?
> One (unlogged) run is from fsck.

OK, yes.

> The quote below lists kernel messages that are printed during mount.

Yes, you are right.
But two (one useless) journal replay rounds.
Could this be avoided?

> > <4>reiserfs: found format "3.6" with standard journal
> > <4>reiserfs: using ordered data mode
> > <4>reiserfs: checking transaction log (sd(8,3)) for (sd(8,3))
> > <4>Using r5 hash to sort names
> > <4>VFS: Mounted root (reiserfs filesystem) readonly.

-Dieter
