From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: What Filesystem?
Date: Wed, 29 Jan 2003 20:02:14 +0100
Message-ID: <200301292002.14633.Dieter.Nuetzel@hamburg.de>
References: <3E38378A.8030406@jtmstudio.fsbusiness.co.uk> <20030129152815.GB28632@willow.seitz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12544-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030129152815.GB28632@willow.seitz.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ross Vandegrift <ross@willow.seitz.com>, James Thompson <james@jtmstudio.fsbusiness.co.uk>
Cc: reiserfs-list@namesys.com

Am Mittwoch, 29. Januar 2003 16:28 schrieb Ross Vandegrift:
> On Wed, Jan 29, 2003 at 03:20:26PM -0500, James Thompson wrote:
> > I am a visual artist and musician.
>
> Check out the document at
> http://myweb.cableone.net/eviltwin69/ALSA_JACK_ARDOUR.html.  There a
> section that benchmarks various filesystems for their latency.  The
> short story is that Reiserfs wins handily over Ext2, Ext3, and FAT32
> (duh!  why would someone test that...).  Unfortunately, there's no
> comparison between Reiser/JFS/XFS.  I think that would be more of a fair
> match.

XFS could win _today_ for "real time" (granted video bandwidth, for which i=
t=20
was designed in the first place), but this could change (compensate) with t=
he=20
latest ReiserFS 3.x patches (data logging) and finally Reiser4 (see the=20
Reiser Homepage).

> Anyhow though, for general low-latency multimedia work, ReiserFS looks
> like it's a good choice.

Yes.

Go with low-latency _and_ preemption patches (try Gentoo, it has it all).
I did beta testing for Robert Love (MontaVista) for ages and it is _the way=
 to=20
go_ for multi media machines.

Greetings,
	Dieter

=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)
