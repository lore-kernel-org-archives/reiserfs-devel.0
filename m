From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: 2.5.46: SCSI and/or ReiserFS v3.6 broken? Kernel panic
Date: Wed, 6 Nov 2002 00:21:01 +0100
Message-ID: <200211060021.01178.Dieter.Nuetzel@hamburg.de>
References: <200211060006.10425.Dieter.Nuetzel@hamburg.de> <1036537937.24354.337.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11923-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1036537937.24354.337.camel@tiny>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: Linux Kernel List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Am Mittwoch, 6. November 2002 00:12 schrieb Chris Mason:
> On Tue, 2002-11-05 at 18:06, Dieter N=FCtzel wrote:
> > VFS: Cannot open root device "803" or 08:03
> > Please append a correct "root=3D" boot option
> > Kernel panic: VFS: unable to mount root fs on 08:03
> >
> > With and without HugeTLB file system support.
> > With and without ACPI, APIC.
> >
> > Worked all the time before.
>
> Is aic7xxx still in your config?  I'm using 2.5.45 here without
> problems.

As always.
2.5.45 and before are running fine;-(

CONFIG_SCSI_AIC7XXX=3Dy
CONFIG_AIC7XXX_CMDS_PER_DEVICE=3D253
CONFIG_AIC7XXX_RESET_DELAY_MS=3D1500
CONFIG_AIC7XXX_BUILD_FIRMWARE=3Dy

My kernel .config file change only for some little cruft which didn't compi=
le=20
for one or the other kernel version.

=2DDieter
