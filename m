From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: [PATCH] updated data=ordered patch for 2.6.3
Date: Tue, 2 Mar 2004 22:48:07 +0100
Message-ID: <200403022248.07585.Dieter.Nuetzel@hamburg.de>
References: <1077165373.22253.45.camel@watt.suse.com> <1078257997.3928.55.camel@watt.suse.com> <200403022206.08495.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17016-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403022206.08495.Dieter.Nuetzel@hamburg.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>, Christophe Saout <christophe@saout.de>

Am Dienstag, 2. M=E4rz 2004 22:06 schrieb Dieter N=FCtzel:
> Am Dienstag, 2. M=E4rz 2004 21:06 schrieb Chris Mason:
> > On Tue, 2004-03-02 at 14:53, Dieter N=FCtzel wrote:
> > > Ups, data-logging IS already in SuSE's 2.6.3-16 kernel ;-)
> >
> > Yes ;-)
>
> Brave men.
>
> Some numbers:
> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G count=3D1
> 1+0 Records ein
> 1+0 Records aus
> 0.001u 2.592s 0:04.39 58.9%     0+0k 0+0io 0pf+0w
> time rm sparse
> 0.000u 4.516s 0:04.52 99.7%     0+0k 0+0io 0pf+0w
>
> Mouse movement and X server (screen update) works but is very slow (chopp=
y)
> for the "know" four seconds.
> But much better than before.
>
> > > What's needed? --- The reiserfs_unpack() fix and your speed up patch?
> >
> > suse only needs the reiserfs_unpack() fix.
>
> But it works like a charm without it. ;-)

Argh, ... partially... 8-(

lilo... do NOT work with the "new" (2.6.3-16) kernel as we know...
But I could boot with my old one and could create the new initrd.
Let me know if you have something to test.

=2DDieter
