From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Horrible ftruncate performance
Date: Wed, 23 Jul 2003 15:46:38 +0200
Message-ID: <200307231546.38557.Dieter.Nuetzel@hamburg.de>
References: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu> <200307231425.17476.Dieter.Nuetzel@hamburg.de> <3F1E9004.6040800@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15005-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F1E9004.6040800@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, ReiserFS List <reiserfs-list@namesys.com>

Am Mittwoch, 23. Juli 2003 15:39 schrieb Hans Reiser:
> Dieter N=FCtzel wrote:
> >Am Dienstag, 22. Juli 2003 20:09 schrieb Hans Reiser:
> >>Chris Mason wrote:
> >>>On Tue, 2003-07-22 at 12:43, Hans Reiser wrote:

[-]

> >>V3 is in feature freeze.   Unfortunately, determining what is a feature
> >>and what is a bug is a process based not just on the user experience,
> >>but on the structure of the code.  The proper fix for this bug is to add
> >>a feature called extents.   This  belongs in, and is in, V4.  V4 will be
> >>available very soon.
> >
> >And "coplete" stable from the beginning? --- Come on.
>
> I have been consistently clear in everything I say that V4 will not be
> as stable as V3 for quite some time.  That is because V3 will not
> significantly change except for bug fixes, whereas V4 is fresh new code.

Yes OK, we all know that and it is _right_.=20

> V3 has been dropping in bug reports for quite some time.  Unfortunately
> I have to say we got some this month (direct IO stuff).

I know this.
Andrea Arcangeli's -aa kernels have direct-IO for ages.

> >>Adding features, like new kinds of items, will disturb the stability of
> >>V3.  V3 needs to be zero defect.  It is now in a phase in its lifetime
> >>where conservatism is appropriate.
> >
> >I'll accept this fix in V3 before I "move" to V4.
> >
> >-Dieter
>
> Most users need for their filesystems to at some point finally get left
> alone and not disturbed.  This is the whole idea behind freeze and
> release based development.

Very true.

> Extents are a nice feature, but they belong in V4 not V3.

Nobody asked about extents fro V3.

> Effort spent
> developing extents for V3 is better spent stabilizing V4 which already
> has them and a lot more.

Yes. But we have OSS.
If someone have some time...

Hans, please do not do "full quotes" in mailing list.

Thank you!

=2DDieter

=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

