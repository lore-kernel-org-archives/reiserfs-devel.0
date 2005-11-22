From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Re: More Slowdown
Date: Tue, 22 Nov 2005 11:44:34 +0100
Message-ID: <200511221144.34541.marcel@hilzinger.hu>
References: <200511171447.41362.mail@earthworm.de> <200511221123.51724.marcel@hilzinger.hu> <20051122103812.GB12072@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27070-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051122103812.GB12072@favonius>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Am Dienstag, 22. November 2005 11:38 schrieb Sander:
> Marcel Hilzinger wrote (ao):
> > Did you ever think about, that this is not a reiser4 problem, but a
> > kernel bug or a problem related to hal?
> >
> > Suse 10 has big problems with external USB drives using sync as mount
> > option. They used sync already in 9.3 but with 2.6.11 there were no
> > such problems. There has been some changes in kernel 2.6.13 and 2.6.14
> > concering the sync behavior, perhaps it can help investigating there
> > first, bevor fixing reiser4 for nothing...
>
> Running Debian here, and all the reports have been on Reiser4
> filesystems. Also, the same system has no such problems with other
> filesystems.
It's not about Debian or Suse. It's about kernel 2.6.13 or 2.6.14. At least=
 it=20
seems, that the problem does not appear on older kernels (right?)

=2D-=20
=DCdv=F6zlettel -- Mit freundlichen Gr=FCssen,
Marcel Hilzinger
