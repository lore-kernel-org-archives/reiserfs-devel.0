From: "Robin H. Johnson" <robbat2@orbis-terrarum.net>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to mount
Date: Mon, 31 Mar 2003 00:37:58 -0800
Message-ID: <20030331083758.GA23518@cherenkov.orbis-terrarum.net>
References: <20030331072250.GC22731@cherenkov.orbis-terrarum.net> <20030331113446.A31858@namesys.com> <20030331074957.GD22731@cherenkov.orbis-terrarum.net> <20030331120014.C25533@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <reiserfs-list-return-13461-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030331120014.C25533@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: "Robin H. Johnson" <robbat2@orbis-terrarum.net>, reiserfs-list@namesys.com

--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2003 at 12:00:14PM +0400, Oleg Drokin wrote:
> > http://www.orbis-terrarum.net/~robbat2/reiserfs/debugreiserfs.run
> "bread: Cannot read the block (18)."
> Well, now this is something.
> Do you have I/O errors messages in kernel logs, or do you know another re=
ason for
> it to fail reading 18th block?
Nope, no I/O messages in the logs at all.

> Perhaps try to run "badblocks -b 4096" to find out if there are more bloc=
ks
> that cannot be read?
I had previously scanned the partition only, but I've scanned the entire
drive now, just to be entirely certain, and there are no bad blocks at
all. I've tested with both the standard readonly test, and the
non-destructive read/write.

The drive is a FUJITSU MPC3102AT-E, one of the ones without the firmware
issues (these drives pre-Feb 2001 had a firmware bug).

> We accept money too ;)
I'll keep that in mind then.

> > A question for you, so I can support things. Is there a list somewhere
> > of features requested, and how much you money you want to be paid to add
> > them in? Especially the smaller features (hint hint).
> Well, there is http://namesys.com/support.html , as of features, usually
> we expect customers to come up with features they need. If you lack somet=
hing
> in reiserfs and you are willing to pay, we can implement it.
> If you are happy with the current features-set, why to pay for features t=
hat
> would be never used?
I've been trying and using reiserfs since before it was officially in
2.4, and this is actually the first real issue I've hit with it. I had
just wondered if you had some feature list of minor things you would
like, but never had time for. Eg nice to have, but not crucial.
Random thing I saw while reading ReiserFS docs, like maybe the repacker?
But I suspect that may be a much larger task (and I certianly don't want
my drives and RAID arrays ever getting that full in the first place).

--=20
Robin Hugh Johnson
E-Mail     : robbat2@orbis-terrarum.net
Home Page  : http://www.orbis-terrarum.net/?l=3Dpeople.robbat2
ICQ#       : 30269588 or 41961639
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks

iD8DBQE+h/5msnuUTjSIToURAoSAAJwKLPVnPtARJztoMWde/DNkSMakKACfXSav
7v7z/rdUUuAPZPTZJMtox44=
=K78W
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
