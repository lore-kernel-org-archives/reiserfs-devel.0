From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Question on Reiser4 regarding power failures
Date: Mon, 29 Nov 2004 14:31:05 +0100
Message-ID: <200411291431.05706.Dieter.Nuetzel@hamburg.de>
References: <200411291025.11004.BernhardPrell@vantagefilm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22613-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411291025.11004.BernhardPrell@vantagefilm.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Bernhard Prell <BernhardPrell@vantagefilm.com>

Am Montag, 29. November 2004 10:25 schrieb Bernhard Prell:
> Thank you very much for your feedback so far!
>
> Kerin Millar wrote:
> > For this reason, and because I believe that the stability of reiserfs
> > was improved drastically in later revisions of the 2.4 kernel, I would
> > urge that you consider using a modern 2.4 kernel and the latest reiserfs
> > tools if possible!
>
> I don't want to describe why we are still using such an outdated system :=
=2D)
> but we will move to Gentoo with a current 2.6.x kernel and reiser4 soon. I
> just wanted to know if this will eliminate the problem once and for all -
> at least in theory - because of the new concepts in reiser4 (atomic
> transactions).
>
> ------
>
> Christian Mayrhuber wrote:
> > I'd suggest to do the following for pull the plug scenarios on producti=
ve
> > systems with reiserfs:
> >
> > 1) Disable write caching for ide drives with "hdparm -W 0 /dev/hdX"
> > =A0 =A0This is the most important thing to do.
>
> Will this really help to protect against partially written sectors and fr=
om
> there resulting read-errors (If a disk loses power while writing a sector
> the CRC-Check will fail and the disk reports an read-error that's not
> caused by a real hardware defect)? Changing the write cache strategy just
> "moves" the problem "in time" - maybe the propability that something
> happens is lower, because the amount of data that gets written at a certa=
in
> point of time is smaller.
>
> > 4) If you want to prevent data corruption and not just filesystem
> > =A0 =A0corruption, use a recent 2.6.x kernel which incoporates Chris Ma=
son's
> > =A0 =A0data logging patches.
> > =A0 =A0Alternatively you could use a newer SuSE which has the data logg=
ing
> > =A0 =A0patches in the 2.4 kernel series, too. Maybe the installation of=
 a
> > =A0 =A0a newer 2.4.x kernel rpm from ftp.suse.com will work for you.
> >
> > As reiser4 is atomic in it's operations it should protect your data even
>
> more
>
> > than ext3/reiserfs with the data=3Djournal mount option, unless you don=
't
> > have write cache for ide drives enabled. Reiser4 is still beta.
>
> I am not concerned about the current beta quality, we will migrate early
> next year and someday the bugs will be fixed. Updating a SuSE system is
> quite a pain I experienced (without reinstalling), it will be easier with
> Gentoo to keep a reasonable current system.

So why don't you use a current 2.4er with Chris Mason's (SuSE) latest Reise=
rFS=20
3.6.xx patches? Or maybe a newer SuSE 2.4er kernel (with Chris patches)?

ftp://ftp.suse.com/pub/people/mason/patches/data-logging
2.4.25 is "current" for data=3Dordered|journal

Greetings,
	Dieter
