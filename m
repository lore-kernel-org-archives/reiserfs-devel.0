From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Catastrophe with mailboxes on ReiserFS
Date: Wed, 9 Oct 2002 17:15:20 +0200
Message-ID: <200210091715.20082.Dieter.Nuetzel@hamburg.de>
References: <20021009094215.B11954@namesys.com> <200210091623.31301.Dieter.Nuetzel@hamburg.de> <20021009183223.A5139@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11634-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021009183223.A5139@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Am Mittwoch, 9. Oktober 2002 16:32 schrieb Oleg Drokin:
> Hello!
>
> On Wed, Oct 09, 2002 at 04:23:31PM +0200, Dieter N?tzel wrote:
> > > > Latest my ".q3a/baseq3/q3key" file (DRI SMP tests) was broken
> > > > (completely other stuff in it) even though it only should opened for
> > > > reading.
> > >
> > > ls -la .q3a/baseq3/q3key?
> >
> > OK, read it wrong. You mean "ls" NOT "less" ;-)
> > It is VERY, VERY small...
> > ls -la .q3a/baseq3/q3key
> > -rw-r--r--    1 nuetzel  users         167 Okt  9 05:47 .q3a/baseq3/q3k=
ey
>
> Looks like recently modified for me ;)

Yes, copied over...;-)

But you are sure with "cp -a original".
And Q3A seems to "modify" it ;-(
Truly bad coding style...

So NOT ReiserFS to blame?!

Thanks,
	Dieter
