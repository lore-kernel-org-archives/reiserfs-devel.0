From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: bad news? got vs-8115 again
Date: Thu, 23 Sep 2004 20:40:33 +0200
Message-ID: <200409232040.33703.christian.mayrhuber@gmx.net>
References: <20040923181048.GA18256@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21894-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040923181048.GA18256@zero>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tom Vier <tmv@comcast.net>, reiserfs-list@namesys.com

On Thursday 23 September 2004 20:10, Tom Vier wrote:
> this time on a server i'm putting into use soon:
>=20
> ReiserFS: md0: warning: vs-8115: get_num_ver: not directory item
> ReiserFS: md0: warning: vs-8115: get_num_ver: not directory item
>=20
> this time it's raid 1 (last time it was raid 0, on a different machine).
> both running 2.6.8.
>=20
> nothing seems to have been affected either time. is this something i can
> ignore? get_num_ver is being handed something it's not supposted to see,
> correct?
>=20
> --=20
> Tom Vier <tmv@comcast.net>
> DSA Key ID 0x15741ECE
>=20

You are asking this question a second time and you will get the same answer:

Quoting Vladimir Saveliev <vs@namesys.com>
> Hello
>=20
> On Tue, 2004-05-25 at 20:33, Hubert Chan wrote:
> > >>>>> "Vladimir" =3D=3D Vladimir Saveliev <vs@namesys.com> writes:
> >=20
> > Vladimir> Hello
> > Vladimir> On Mon, 2004-05-24 at 20:21, Hubert Chan wrote:
> > >> I got that message a few times (but not every time) while doing
> > >> "apt-cache show ...". =A0Can someone tell me what that message means,
> > >> and if I should be worried about my data?
> > >>=20
> >=20
> > Vladimir> What kernel do you use?
> >=20
> > Sorry. =A02.6.4.
>=20
> vs-8115 is harmless in this kernel.
>=20
> > =A0 I might have added some of Chris Mason's patches --
> > looks like possibly journal-writer, nesting, iosize, but I'm not
> > entirely sure.
>=20

I think I saw -mm changelog with a patch that disables this warning.
Highly likely that kernel 2.6.9 won't spit this out again.

=2D-=20
lg, Chris
