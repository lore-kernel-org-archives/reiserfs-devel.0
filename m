From: Valdis.Kletnieks@vt.edu
Subject: Re: copying partition to partition, sector by sector, live
Date: Mon, 22 Apr 2002 20:34:39 -0400
Message-ID: <200204230034.g3N0YdQn030194@foo-bar-baz.cc.vt.edu>
References: <20020421181614.GA11239@vega.ipal.net> <20020422010733.GA2379@amphibian.dyndns.org> <20020422013955.GB8407@vega.ipal.net>
            <20020422224755.GA1710@amphibian.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1486127692P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: Your message of "Mon, 22 Apr 2002 23:47:55 BST."
             <20020422224755.GA1710@amphibian.dyndns.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Matthew Toseland <mtoseland@blueyonder.co.uk>
Cc: Phil Howard <phil-reiserfs@ipal.net>, reiserfs-list@namesys.com

--==_Exmh_-1486127692P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Apr 2002 23:47:55 BST, Matthew Toseland said:

> lvcreate -n <snapshotname> -L 500M -v /dev/<vgname>/<partition name>

You missed the -s flag.  From 'man lvcreate' (LVM 1.0.3):

-s, --snapshot
  Create  a  snapshot  logical  volume  (or snapshot) for an existing, so=

  called original  logical  volume  (or  origin).   Snapshots  provide  a=

  'frozen image' of the contents of the origin while the origin can still=

  be updated. They enable  consistent  backups  and  online  recovery  of=

  removed/overwritten  data/files.  The  snapshot  does not need the same=

  amount of storage the origin has. In a typical scenario,  15-20%  might=

  be enough. In case the snapshot runs out of storage, use lvextend(8) to=

  grow it. Shrinking a snapshot is supported by lvreduce(8) as well.  Run=

  lvdisplay(8)  on  the snapshot in order to check how much data is allo=AD=

  cated to it.

> dd if=3D/dev/<vgname>/snapshotname of=3D/usr/local/temp/snapshot.img bs=
=3D1M
> lvremove -f /dev/<vgname>/snapshotname

The rest of this looks OK (although I've *NOT* tried it myself).  I'm not=

sure what the granularity of the snapshot is - whether you need to alloca=
te
space for each block that's modified, or each 4M segment, or what...


-- =

				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_-1486127692P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE8xKwfcC3lWbTT17ARAv5TAKDVZBhcD5E9iSwOkoWb0o1sA0QnrgCgqOkQ
lTYF90wtt2GTKV6jaBKBjos=
=mLMH
-----END PGP SIGNATURE-----

--==_Exmh_-1486127692P--
