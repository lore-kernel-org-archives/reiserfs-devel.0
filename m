From: Garrick Staples <garrick@usc.edu>
Subject: Re: BUG in journal_mark_dirty on 2.6.7/ia64
Date: Tue, 17 Aug 2004 15:17:59 -0700
Message-ID: <20040817221759.GQ2136@polop.usc.edu>
References: <20040817191428.GP2136@polop.usc.edu> <1092780643.12138.1591.camel@watt.suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BKz3/kOK/Ohi8CfT"
Return-path: <reiserfs-list-return-20364-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1092780643.12138.1591.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--BKz3/kOK/Ohi8CfT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2004 at 06:10:44PM -0400, Chris Mason alleged:
> On Tue, 2004-08-17 at 15:14, Garrick Staples wrote:
> > Hi all,
> >    I'm currently not subscribed (the list daemon isn't replying to my s=
ubscribe
> > attempts), so please CC me on replies.
> >=20
> > I got a kernel panic on one of my ia64 servers last night.  It's an NFS=
 server
> > for about 1000 clients and ~10 terabytes of data and has been running g=
reat
> > since 2.6.7 was released (Jun 15).  Last week it was rebooted to pull o=
ut an
> > unused scsi raid card.
> >=20
> > Last night I got the panic message below, which caused one of my LVM LV=
s to
> > lock up.  Please let me know what other info you need.
>=20
> Well, this should have been fixed, I'll have to review the transaction
> length code again.  Updating to 2.6.8 won't fix it, the good news is
> that particular panic should have kept corruption away.

Thanks for the reply.  I did a bit of googling before posting and noted a f=
ew
similar posts from a year or two ago, and that noone has reported this erro=
r in
awhile.  And as you mentioned, I didn't see anything in 2.6.8's changelog t=
hat
looked related.


--=20
Garrick Staples, Linux/HPCC Administrator
University of Southern California

--BKz3/kOK/Ohi8CfT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBIoQX0SBUxJbm9HMRApjkAKC2kA7XZjCLuAtPyj85vrpVg7olrACfYIyw
2gD8n7RaPZVMl8BHpiHMgjo=
=HNcu
-----END PGP SIGNATURE-----

--BKz3/kOK/Ohi8CfT--
