From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: samba
Date: Sat, 5 Oct 2002 19:55:17 +0200
Message-ID: <200210051955.17771.Dieter.Nuetzel@hamburg.de>
References: <3D9E8451.5010605@xs4all.nl> <200210050903.41939.tomlins@cam.org> <3D9F0A9B.9060108@xs4all.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11614-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D9F0A9B.9060108@xs4all.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Gertjan Vinkesteijn <gvink@xs4all.nl>, Ed Tomlinson <tomlins@cam.org>
Cc: the filesystem <reiserfs-list@namesys.com>

Am Samstag, 5. Oktober 2002 17:51 schrieb Gertjan Vinkesteijn:
> Ed Tomlinson wrote:
> >On October 5, 2002 02:18 am, Gertjan Vinkesteijn wrote:
> >>Dear audience,
> >>
> >>Last year samba was not yet possible on reiserfs, it is on xfs from sgi
> >>though. Does anybody know if work has been done in that area? It would
> >>be very handy having (parts of) my 40GByte reiserfs filesystem letting
> >>share on our subnet with windows computers.
> >
> >Huh?  samba on reieserfs here.  Light usage, works fine.  I am now using
> >2.5.40 but, 2.4.17/8/9/20pre (and probably more) all work too.
> >
> >Ed Tomlinson
>
> thanks, it was long ago that i tried it. this is good news.

But if you ask about SAMBA/ACLs/ReiserFS (3.5/3.6) then there are some litt=
le=20
questions.

Two options:

* Get the (generic) ACL kernel (VFS) patch.
* Or get latest SuSE 8.1 which comes with ACLs for all four journaling FSs.

Regards,
	Dieter
=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)
