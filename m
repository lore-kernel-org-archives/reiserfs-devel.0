From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Very very slow rm/unlink of large sparse files
Date: Mon, 16 Feb 2004 19:55:00 +0100
Message-ID: <200402161955.00708.Dieter.Nuetzel@hamburg.de>
References: <4030391F.5080204@lig.net> <200402161649.33592.Dieter.Nuetzel@hamburg.de> <1076947168.2931.10.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16810-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1076947168.2931.10.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>, "Stephen D. Williams" <sdw@lig.net>

Am Montag, 16. Februar 2004 16:59 schrieb Chris Mason:
> On Mon, 2004-02-16 at 10:49, Dieter N=FCtzel wrote:
> > Am Montag, 16. Februar 2004 15:29 schrieb Chris Mason:
> > > On Mon, 2004-02-16 at 09:06, Dieter N=C3=BCtzel wrote:
> > > > INSTALL/SOURCE> time rm sparse
> > > > 0.000u 10.684s 2:15.11 7.9%     0+0k 0+0io 0pf+0w
> > > >
> > > > 'rm' time is lost in 'io_schedule' and 'down'.
> > >
> > > Dieter, could you please try with this (shamefully untested and
> > > uncompiled) patch:

Now, I'm back...
During "dd" mouse movement works OK.

> [ no compile in the backround ]

Yes. ;-)

> > INSTALL/SOURCE> time rm sparse
> > 0.000u 4.483s 0:04.48 100.0%    0+0k 0+0io 0pf+0w
> >
> > Mouse behavior is the same.
>
> Very choppy?

Yes. No movement at all. 8-(
But only for the _first_ four seconds.

> Ok, I didn't expect that to change, but it is fixable.=20

Great.

> > With compilation in the "background":
> >
> > INSTALL/SOURCE> time rm sparse
> > 0.000u 4.546s 0:04.86 93.4%     0+0k 0+0io 0pf+0w
>
> So, just to make sure I'm comparing things correctly, the time to rm the
> large file with a compile in the background went from over two minutes
> to 4 seconds?

Correct.

But ONLY if I have such workload in the background.

Several "rm" runs _without_ compilation:

INSTALL/SOURCE> time rm sparse
0.000u 6.177s 0:10.46 58.9%     0+0k 0+0io 0pf+0w

INSTALL/SOURCE> time rm sparse
0.000u 6.098s 0:09.39 64.8%     0+0k 0+0io 0pf+0w

INSTALL/SOURCE> time rm sparse
0.000u 6.256s 0:12.24 51.0%     0+0k 0+0io 0pf+0w

INSTALL/SOURCE> time rm sparse
0.001u 4.792s 0:10.19 47.0%     0+0k 0+0io 0pf+0w

> If so, the improvement is from a stupid bug fixed in 2.4.x, basically we
> were trying to start a huge transaction, which was always forcing the
> current transaction to end, which made for tiny transactions, which are
> really slow.

Good to know.

=2DDieter
