From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: NFSv2 problem? initctl problem?
Date: Thu, 19 Aug 2004 12:56:34 +0200
Sender: Bernd Schubert <Bernd.Schubert@tc.pci.uni-heidelberg.de>
Message-ID: <200408191256.40317.bernd-schubert@web.de>
References: <20040818145103.GE1284@nysv.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_ndIJBvOtXnUaZDR";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20397-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040818145103.GE1284@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Markus =?iso-8859-1?q?T=F6rnqvist?= <mjt@nysv.org>, linux-fai@rrz.uni-koeln.de

--Boundary-02=_ndIJBvOtXnUaZDR
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


> It doesn't matter whether I use the kernel- or user-space NFS
> implementation, it still dies on me, except that I'd rather use the
> kernel-space one.

Don't use te unfsd except for special reasons. If you want to test a usersp=
ace=20
daemon just use unfs3 (unfs3.sf.net).

>
> Now what I'm wondering about is where is the error?
>
> How can I force the client to use only NFSv3? rpc.mountd -N2 -V3 should
> work, right? But it still speaks v2 according to the traffic AND affects
> only the server-side, in theory, if not in practice apparently.

"man 5 nfs", mountoption is "nfsvers=3D3"

>
> The underlying filesystem is ReiserFS, so I'm sending a copy of this
> mail to the ReiserFS list as well, to see if anyone over there knows
> anything about this. If need be, I can reinstall the FAI server to use
> some other FS, but I would not like to do that.
>
> With the user-space NFS implementation I got the file id of 1476542499
> which does not have a file in the file system at all. Might this be
> because of ReiserFS? An ancient curse? NFS just being broken?

I wouldn't use the old userspace daemon with reiserfs at all, if you want t=
o=20
do this, just use unfs3.

>
> Any help is greatly appreciated here, I have a deadline coming up for
> this installation and just out of principle I would dislike doing it
> from a CD as I'm going to install a lot more of these Debians and need
> FAI working...

Well, your testing approach is a bit strange:

1.) I would use the knfsd.
2.) To test if exporting works, I would take a second non-rootnfs system an=
d=20
try to mount the exported directories on this system. This will help you a=
=20
lot since you can experiment with mount options on this system and you can=
=20
check the syslogs.
3.) I mounting from you second server works, you can go on and see what=20
happens in your fai environment.

>
> PS.
> Semi-off topic, what's the status of NFSv4? rpc.mountd supports something
> like it but is it in Linux already?
> Should I seek answers elsewhere than in 0d NFS protocols?

Your questions are completety off topic from the view of reiserfs, since th=
ere=20
are many people (including our group) who use nfs and reiserfs. However you=
=20
should use unfsd and reiserfs. A group suitable for nfs questions is=20
"nfs@lists.sourceforge.net".  NFSv4 is still in early development and I=20
wouldn't use it except for some tests (actually I never used it at all, but=
 I=20
see all of those patches about it on the nfs-list).


Cheers,=20
	Bernd

PS: If you should decide to unfs3 for some tests, make sure it is able to=20
include the ext2_fs.h, unfortunality the one from the debian kernel-headers=
=20
package is broken :(, replace it with the file from Mariusz Mazur headers=20
(http://ep09.pld-linux.org/~mmazur/linux-libc-headers/)


=2D-=20
Bernd Schubert
Physikalisch Chemisches Institut / Theoretische Chemie
Universit=E4t Heidelberg
INF 229
69120 Heidelberg
e-mail: bernd.schubert@pci.uni-heidelberg.de

--Boundary-02=_ndIJBvOtXnUaZDR
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBJIdnC8BUnAF+ydYRAkLkAJ9iPUUrDZtNI6vKs9GInRr3tKZKGQCdEZHR
/EbJvMA43b/Cnff34HHZDj0=
=KDgY
-----END PGP SIGNATURE-----

--Boundary-02=_ndIJBvOtXnUaZDR--
