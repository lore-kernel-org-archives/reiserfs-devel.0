From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck infinite loop at pass2 (built by Debian).
Date: Fri, 18 Apr 2003 19:11:44 +0400
Message-ID: <20030418191144.A10228@namesys.com>
References: <200304181604.28955.vitaly@namesys.com> <200304181710.23731.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13710-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200304181710.23731.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, Ed Boraas <ed@debian.org>

Hello!

On Fri, Apr 18, 2003 at 05:10:23PM +0200, Dieter N?tzel wrote:

> what about the "double" checking during bootup since 3.6.5+patch (3.6.6-pre1)?
> I get two check sequences since the latest version.
> First round from fsck.reiserfs (-a/-p) but sadly not logged and then the 
> below.

What led you to think you have two check sequences?
One (unlogged) run is from fsck.
The quote below lists kernel messages that are printed during mount.

> <4>reiserfs: found format "3.6" with standard journal
> <4>reiserfs: using ordered data mode
> <4>reiserfs: checking transaction log (sd(8,3)) for (sd(8,3))
> <4>Using r5 hash to sort names
> <4>VFS: Mounted root (reiserfs filesystem) readonly.
> <4>reiserfs: found format "3.6" with standard journal
> <4>reiserfs: using ordered data mode
> <4>reiserfs: checking transaction log (sd(8,2)) for (sd(8,2))
> <4>Using r5 hash to sort names
> <4>reiserfs: found format "3.6" with standard journal
> <4>reiserfs: using ordered data mode
> <4>reiserfs: checking transaction log (sd(8,5)) for (sd(8,5))
> <4>Using r5 hash to sort names
> <4>reiserfs: found format "3.6" with standard journal
> <4>reiserfs: using ordered data mode
> <4>reiserfs: checking transaction log (sd(8,6)) for (sd(8,6))
> <4>Using r5 hash to sort names
> <4>reiserfs: found format "3.6" with standard journal
> <4>reiserfs: using ordered data mode
> <4>reiserfs: checking transaction log (sd(8,7)) for (sd(8,7))
> <4>Using r5 hash to sort names
> <4>reiserfs: found format "3.6" with standard journal
> <4>reiserfs: using ordered data mode
> <4>reiserfs: checking transaction log (sd(8,8)) for (sd(8,8))
> <4>Using r5 hash to sort names
> <4>reiserfs: found format "3.6" with standard journal
> <4>reiserfs: using ordered data mode
> <4>reiserfs: checking transaction log (sd(8,17)) for (sd(8,17))
> <4>Using r5 hash to sort names
> <4>reiserfs: found format "3.6" with standard journal
> <4>reiserfs: using ordered data mode
> <4>reiserfs: checking transaction log (sd(8,21)) for (sd(8,21))
> <4>Using r5 hash to sort names
> <4>reiserfs: found format "3.6" with standard journal
> <4>reiserfs: using ordered data mode
> <4>reiserfs: checking transaction log (sd(8,22)) for (sd(8,22))
> <4>Using r5 hash to sort names
> <4>reiserfs: found format "3.6" with standard journal
> <4>reiserfs: using ordered data mode
> <4>reiserfs: checking transaction log (sd(8,23)) for (sd(8,23))
> <4>Using r5 hash to sort names
> <4>reiserfs: found format "3.6" with standard journal
> <4>reiserfs: using ordered data mode
> <4>reiserfs: checking transaction log (sd(8,24)) for (sd(8,24))
> <4>Using r5 hash to sort names

Bye,
    Oleg
