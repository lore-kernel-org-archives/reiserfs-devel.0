From: Matthew Toseland <mtoseland@blueyonder.co.uk>
Subject: Re: copying partition to partition, sector by sector, live
Date: Tue, 23 Apr 2002 23:17:23 +0100
Message-ID: <20020423221723.GA14171@amphibian.dyndns.org>
References: <20020421181614.GA11239@vega.ipal.net> <20020422010733.GA2379@amphibian.dyndns.org> <20020422013955.GB8407@vega.ipal.net> <20020422224755.GA1710@amphibian.dyndns.org> <200204230034.g3N0YdQn030194@foo-bar-baz.cc.vt.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <reiserfs-list-return-10149-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200204230034.g3N0YdQn030194@foo-bar-baz.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2002 at 08:34:39PM -0400, Valdis.Kletnieks@vt.edu wrote:
> On Mon, 22 Apr 2002 23:47:55 BST, Matthew Toseland said:
>=20
> > lvcreate -n <snapshotname> -L 500M -v /dev/<vgname>/<partition name>
>=20
> You missed the -s flag.  From 'man lvcreate' (LVM 1.0.3):
Whoops. I tried it, then miscopied it, or something :)
>=20
> -s, --snapshot
>   Create  a  snapshot  logical  volume  (or snapshot) for an existing, so
>   called original  logical  volume  (or  origin).   Snapshots  provide  a
>   'frozen image' of the contents of the origin while the origin can still
>   be updated. They enable  consistent  backups  and  online  recovery  of
>   removed/overwritten  data/files.  The  snapshot  does not need the same
>   amount of storage the origin has. In a typical scenario,  15-20%  might
>   be enough. In case the snapshot runs out of storage, use lvextend(8) to
>   grow it. Shrinking a snapshot is supported by lvreduce(8) as well.  Run
>   lvdisplay(8)  on  the snapshot in order to check how much data is allo?
>   cated to it.
>=20
> > dd if=3D/dev/<vgname>/snapshotname of=3D/usr/local/temp/snapshot.img bs=
=3D1M
> > lvremove -f /dev/<vgname>/snapshotname
>=20
> The rest of this looks OK (although I've *NOT* tried it myself).  I'm not
> sure what the granularity of the snapshot is - whether you need to alloca=
te
> space for each block that's modified, or each 4M segment, or what...
Hmmmm. Presumably it's on the extent level, but I don't know.
>=20
>=20
> --=20
> 				Valdis Kletnieks
> 				Computer Systems Senior Engineer
> 				Virginia Tech
>=20



--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8xd1zmlVGrEH/+qIRAk0aAJ4zTPs4gT3wJ2Ddx9c1pUCsqlJ5egCeKtVg
K8jHkv0y5FSx6+ATtaMYORE=
=04uR
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
