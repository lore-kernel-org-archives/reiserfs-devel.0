From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Catastrophe with mailboxes on ReiserFS
Date: Wed, 9 Oct 2002 16:23:31 +0200
Message-ID: <200210091623.31301.Dieter.Nuetzel@hamburg.de>
References: <20021009094215.B11954@namesys.com> <200210091602.34904.Dieter.Nuetzel@hamburg.de> <20021009180935.A4618@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11631-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021009180935.A4618@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Am Mittwoch, 9. Oktober 2002 16:09 schrieb Oleg Drokin:
> Hello!
>
> On Wed, Oct 09, 2002 at 04:02:34PM +0200, Dieter N?tzel wrote:
> > > prevented system from putting new content in there), but since you've
> > > got other file's data in the middle of file, this is not the case.
> >
> > Oleg, I "see" it from time to time during kernel and DRI development (X
> > server crashes), too. This times without Chris's stuff. 2.4.19-ck5
> > (latest ReiserFS patches for 2.4.19) and now with 2.5.40-ac3.
>
> What's "it"? Is it means what I describe, or "it" means wrong stuff in the
> middle of files?
>
> > Most times "messages", "localmessages", kernel .o.*, dep files, etc. are
> > broken (wrong stuff or mixed stuff).
>
> These are recently modified stuff.
>
> > Latest my ".q3a/baseq3/q3key" file (DRI SMP tests) was broken (complete=
ly
> > other stuff in it) even though it only should opened for reading.
>
> ls -la .q3a/baseq3/q3key?

OK, read it wrong. You mean "ls" NOT "less" ;-)

It is VERY, VERY small...

ls -la .q3a/baseq3/q3key
=2Drw-r--r--    1 nuetzel  users         167 Okt  9 05:47 .q3a/baseq3/q3key

:-)))

Regards,
	Dieter
