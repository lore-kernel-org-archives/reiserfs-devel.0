From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: large files
Date: Tue, 18 May 2004 15:42:06 +0200
Sender: Bernd Schubert <Bernd.Schubert@tc.pci.uni-heidelberg.de>
Message-ID: <200405181544.36152.bernd-schubert@web.de>
References: <200405172148.33162.bernd-schubert@web.de> <1084824741.20437.368.camel@watt.suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_ENhqAjf9LzcQKzL";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18745-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1084824741.20437.368.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Chris Mason <mason@suse.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

--Boundary-02=_ENhqAjf9LzcQKzL
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

Hello Chris,

>
> As a comparison data point, could you please try 2.6.6-mm3?  I realize
> you don't want to run this kernel in production, but it would tell us if
> I understand the problems at hand.

the results in 2.6.6-mm3 are below, we almost consider to run this kernel=20
version.

Here are two other interesting facts:

1.) During the filecreation in 2.4.26 the load on the system was around 3-4=
,=20
whereas in 2.6.6-mm3 the load was at about 8-9.

2.) When the dd file creation process finished (2.4.26 was running) the sys=
tem=20
became so unresponsible, that the drdb connection timed out and a resync=20
process automatically started when the system became responsible again. I=20
don't have any comparism to 2.6.6-mm3 since we would need another drbd=20
version. Also, I don't know if this happend when dd finished or when=20
rm-started, since both were running from a script.

Here are the measured times for file creation and file deleting

=3D=3D=3D=3D=3D> 2.4.26:

taylor:~# cat test.out-2.4.26
time dd if=3D/dev/zero of=3D/worka/testfile.dd bs=3D1M count=3D300000
300000+0 records in
300000+0 records out
314572800000 bytes transferred in 5746.266841 seconds (54743855 bytes/sec)

real	95m46.275s
user	0m0.760s
sys	29m57.800s


time rm -fr /worka/testfile.dd

real	11m20.589s
user	0m0.000s
sys	4m59.850s


=3D=3D=3D=3D=3D> 2.6.6-mm3


taylor:~# cat test.out-2.6.6-mm3
time dd if=3D/dev/zero of=3D/worka/testfile.dd bs=3D1M count=3D300000
300000+0 records in
300000+0 records out
314572800000 bytes transferred in 4902.873869 seconds (64160900 bytes/sec)

real	81m46.211s
user	0m1.172s
sys	22m26.010s


time rm -fr /worka/testfile.dd

real	1m38.000s
user	0m0.000s
sys	1m5.872s



Do you have any ideas how we could improve 2.4.x?=20


Thanks,
	Bernd


=2D-=20
Bernd Schubert
Physikalisch Chemisches Institut / Theoretische Chemie
Universit=E4t Heidelberg
INF 229
69120 Heidelberg
e-mail: bernd.schubert@pci.uni-heidelberg.de

--Boundary-02=_ENhqAjf9LzcQKzL
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAqhNEC8BUnAF+ydYRAsMDAJ9syvt+82PwoQr410+pAMgaGt6cGACfWxvh
+/H3quWGsazEigAk44G3JYk=
=jUkJ
-----END PGP SIGNATURE-----

--Boundary-02=_ENhqAjf9LzcQKzL--
