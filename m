From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Some errors, tree-related?
Date: Tue, 29 Jun 2004 21:00:39 +0400
Message-ID: <20040629170039.GW5080@backtop.namesys.com>
References: <20040628194741.GG4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19446-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040628194741.GG4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

On Mon, Jun 28, 2004 at 10:47:41PM +0300, Markus T=F6rnqvist wrote:
> Hi
>=20
> While I was toying around with unrelated stuff, I noticed I got the good
> old jamming problems that I had with some older auto-snapshot, that is,
> apt-get would lock on 93% and tab expansion would as well, then everything
> would lock. Rebooting needs the SysRq trio.
>=20
> Now I got the behavior again, and noted some stuff in the log that I
> could swear wasn't there when I last had these problems. On the other han=
d,=20
> I don't know if they're related. That's why I'm mailing here :)
>=20
> Jun 28 22:18:53 shrike kernel: reiser4[xmms(3797)]: traverse_tree (fs/rei=
ser4/search.c:747)[nikita-1481]:
> Jun 28 22:18:53 shrike kernel: WARNING: Too many iterations: 1048576
> Jun 28 22:19:15 shrike kernel: reiser4[xmms(3797)]: traverse_tree (fs/rei=
ser4/search.c:747)[nikita-1481]:
> Jun 28 22:19:15 shrike kernel: WARNING: Too many iterations: 2097152
> Jun 28 22:19:46 shrike kernel: reiser4[xmms(3797)]: traverse_tree (fs/rei=
ser4/search.c:747)[nikita-1481]:
> Jun 28 22:19:46 shrike kernel: WARNING: Too many iterations: 4194304
>=20
> Then I restarted the computer. Bugger me, I can't remember if I restarted
> because of a lock-up there or not, but this I got later:
>=20
> Jun 28 22:36:21 shrike kernel: reiser4[xmms(3834)]: renew_sibling_link (f=
s/reiser4/tree_walk.c:441)[nikita-3532]:
> Jun 28 22:36:21 shrike kernel: WARNING: Sibling nodes on the different le=
vels: 1 !=3D 2
>=20
> [...]
>=20
> Jun 28 22:38:51 shrike kernel: reiser4[xmms(4068)]: renew_sibling_link (f=
s/reiser4/tree_walk.c:441)[nikita-3532]:
> Jun 28 22:38:51 shrike kernel: WARNING: Sibling nodes on the different le=
vels: 1 !=3D 2
>=20
> So, what's up here? Is it related to any known stability issue?

it shows serious tree corruption. which reiser4 snapshot is on shrike?

> I re-mkfs'd my home partition, but did an fsck on the / partition, when it
> was last needed. Could that affect here? Do I _really_ have to mkfs again?
> Or am I barking up the wrong tree? (No pun intended :D)

> Thanks!
>=20
> --=20
> mjt
>=20

--=20
Alex.
