From: Bernhard Prell <BernhardPrell@vantagefilm.com>
Subject: Re: Question on Reiser4 regarding power failures
Date: Mon, 29 Nov 2004 10:25:10 +0100
Message-ID: <200411291025.11004.BernhardPrell@vantagefilm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22610-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


Thank you very much for your feedback so far!

Kerin Millar wrote:
> For this reason, and because I believe that the stability of reiserfs
> was improved drastically in later revisions of the 2.4 kernel, I would
> urge that you consider using a modern 2.4 kernel and the latest reiserfs
> tools if possible!

I don't want to describe why we are still using such an outdated system :-)=
=20
but we will move to Gentoo with a current 2.6.x kernel and reiser4 soon. I =

just wanted to know if this will eliminate the problem once and for all - a=
t=20
least in theory - because of the new concepts in reiser4 (atomic=20
transactions). =20

------

Christian Mayrhuber wrote:
> I'd suggest to do the following for pull the plug scenarios on productive
> systems with reiserfs:

> 1) Disable write caching for ide drives with "hdparm -W 0 /dev/hdX"
> =A0 =A0This is the most important thing to do.

Will this really help to protect against partially written sectors and from=
=20
there resulting read-errors (If a disk loses power while writing a sector t=
he=20
CRC-Check will fail and the disk reports an read-error that's not caused by=
 a=20
real hardware defect)? Changing the write cache strategy just "moves" the=20
problem "in time" - maybe the propability that something happens is lower, =

because the amount of data that gets written at a certain point of time is =

smaller.=20

> 4) If you want to prevent data corruption and not just filesystem
> =A0 =A0corruption, use a recent 2.6.x kernel which incoporates Chris Maso=
n's
> =A0 =A0data logging patches.
> =A0 =A0Alternatively you could use a newer SuSE which has the data logging
> =A0 =A0patches in the 2.4 kernel series, too. Maybe the installation of a
> =A0 =A0a newer 2.4.x kernel rpm from ftp.suse.com will work for you.

> As reiser4 is atomic in it's operations it should protect your data even =

more=20
> than ext3/reiserfs with the data=3Djournal mount option, unless you don't=
 have
> write cache for ide drives enabled. Reiser4 is still beta.

I am not concerned about the current beta quality, we will migrate early ne=
xt=20
year and someday the bugs will be fixed. Updating a SuSE system is quite a =

pain I experienced (without reinstalling), it will be easier with Gentoo to=
=20
keep a reasonable current system.

> Since 2.6.9 the write barrier patches are in the kernel. These should
> protect better from data loss with disks that have write caching enabled.
> The only two filesystems supporting write barrier are ext3 with the mount
> option "barrier=3D1" and reiserfs with the mount option "barrier=3Dflush".

Our problem is not loss of (user) data. If someone pulls the plug before al=
l=20
unsaved data is written or before the write cache is flushed - I don't care=
.=20
But it would be nice if the system would boot again... and all system files=
=20
are sane. As I understand it, reiser4 recognizes if a certain transaction w=
as=20
completed successfully. But will it fix a partially written sector?

Bye,

Bernhard

