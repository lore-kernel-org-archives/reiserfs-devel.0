From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: v3 logging speedups for 2.6
Date: Thu, 11 Dec 2003 19:30:49 +0100
Message-ID: <200312111930.49910.Dieter.Nuetzel@hamburg.de>
References: <1071166228.11147.122.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16335-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1071166228.11147.122.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Am Donnerstag, 11. Dezember 2003 19:10 schrieb Chris Mason:
> Hello everyone,
>
> This is part one of the data logging port to 2.6, it includes all the
> cleanups and journal performance fixes.  Basically, it's everything
> except the data=3Djournal and data=3Dordered changes.
>
> The 2.6 merge has a few new things as well, I've changed things around
> so that metadata and log blocks will go onto the system dirty lists.
> This should make it easier to improve log performance, since most of the
> work will be done outside the journal locks.
>
> The code works for me, but should be considered highly experimental.  In
> general, it is significantly faster than vanilla 2.6.0-test11, I've done
> tests with dbench, iozone, synctest and a few others.  streaming writes
> didn't see much improvement (they were already at disk speeds), but most
> other tests did.
>
> Anyway, for the truly daring among you:
>
> ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.0-tes=
t11
>
> The more bug reports I get now, the faster I'll be able to stabilize
> things.  Get the latest reiserfsck and check your disks after each use.

Chris,

with which kernel should I start on my SuSE 9.0?
A special SuSE 2.6.0-test11 + data logging?
Or plane native? --- There are such much patches in SuSE kernels...

Greetings,
	Dieter
=2D-=20
Dieter N=FCtzel
@home: <Dieter.Nuetzel () hamburg ! de>
