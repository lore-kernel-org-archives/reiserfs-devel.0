From: Alex Malinovich <demonbane@the-love-shack.net>
Subject: Re: Will Reisefs have "undo"?
Date: 15 Jun 2003 14:29:26 -0500
Message-ID: <1055705365.24613.15.camel@Thief>
References: <1055615895.698.129.camel@localhost>
	 <000d01c332ac$a94e23a0$0200a8c0@xpstation>
	 <1055670615.671.106.camel@localhost>
	 <200306151409.41970.d.nuetzel@wearabrain.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ezhUmTHKbaDycNF0Oe7a"
Return-path: <reiserfs-list-return-14552-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306151409.41970.d.nuetzel@wearabrain.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS ML <reiserfs-list@namesys.com>

--=-ezhUmTHKbaDycNF0Oe7a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 2003-06-15 at 07:09, Dieter N=C3=BCtzel wrote:
> Am Sonntag, 15. Juni 2003 11:50 schrieb Joachim Zobel:
> > Am Sam, 2003-06-14 um 21.39 schrieb Fred -- Speed Up --:
> > > This is not the filesystem's work, KDE for instance has a trashcan, a=
nd
> > > you can bind the rm command to a special mv one that moves files from=
 the
> > > initial place to a backup folder, the files of which you can empty
> > > regulary with a cron script depending on the file's "age". It's simpl=
e to
> > > implement, and really not something Reiser4 should be capable of ...
> > > instead journalising works very well to protect data from being erase=
d,
> > > that's the only purpose of a modern filesystem.
> >
> > A filesystem undo is most needed on servers.
--snip--
> > What I would like to have is more - I think I was not clear enough abou=
t
> > that. I not only want to undo deletions. I would like to be able to und=
o all
> > file system operations.
--snap--
> > It feels pretty good if you can undo "everything I did since 11:30".

I don't think snapshots are really needed. I would be perfectly content
with a "semi-intelligent" filesystem that would mark files as deleted in
the journal while leaving the file intact on the HD. As soon as the file
has actually been overwritten, it is marked "purged" and cannot be
recovered. But up to that point, it would be a relatively simple task to
just tell the journal to mark the file as not-deleted again.

At least, this all seems rather simple in my way of looking it. However
I am by no means a file system expert, so I will gladly welcome any
corrections.

--=20
Alex Malinovich
Support Free Software, delete your Windows partition TODAY!
Encrypted mail preferred. You can get my public key from any of the
pgp.net keyservers. Key ID: A6D24837

--=-ezhUmTHKbaDycNF0Oe7a
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA+7MkVBPYwh6bSSDcRAgvZAKCStpFnTVAaLfCN1LIzYmLzD/REhQCfRHh2
5Jn0Ni9WtGujsAPbiLnJq50=
=txpO
-----END PGP SIGNATURE-----

--=-ezhUmTHKbaDycNF0Oe7a--

