From: Valdis.Kletnieks@vt.edu
Subject: Re: "df -i" support
Date: Fri, 14 May 2004 12:55:53 -0400
Message-ID: <200405141655.i4EGtrAT007250@turing-police.cc.vt.edu>
References: <20040513093432.52d3d7a3.turtle.power@wanadoo.es> <1084439945.14090.6209.camel@tribesman.namesys.com>
            <20040514173227.5b0541b5.turtle.power@wanadoo.es>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-677207453P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18693-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 14 May 2004 17:32:27 +0200."
             <20040514173227.5b0541b5.turtle.power@wanadoo.es> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Miguel <turtle.power@wanadoo.es>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

--==_Exmh_-677207453P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, 14 May 2004 17:32:27 +0200, Miguel said:

> We are migrating our mtas from ext3 to reiserfs and the monitorization
> (a plugin) relies on the output of df -i, this output is very diferent
> between those filesystems, because reiserfs always return -1 as a total=

> number of inodes.

The only reason you care about df -i is because on ext[23] and similar,
it is possible to run out of inodes before you run out of files.  Since
reiserfs allocates inodes as needed, you can't run out of them unless you=

run out of space - in which case your monitoring system should be flaggin=
g
that.

So just fix your code to say '-1 means unlimited', or if that's too compl=
icated
make it say:

	if (value =3D=3D -1) { value =3D 2147483648; }

which won't be right but should make your scripts act correctly.

--==_Exmh_-677207453P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFApPoZcC3lWbTT17ARAp4IAJ4+1cxPp6ybDaGgAqIn96XlaOYETACgqTZP
4fogILDBFG2Us2nossD4zcA=
=1n9n
-----END PGP SIGNATURE-----

--==_Exmh_-677207453P--
