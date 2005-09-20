From: Roman I Khimov <rik@osrc.info>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 23:28:12 +0400
Message-ID: <200509202328.28501.rik@osrc.info>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl> <432E5024.20709@namesys.com> <20050920075133.GB4074@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1692600.LIfSYN1P7A";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26155-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050920075133.GB4074@elf.ucw.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Pavel Machek <pavel@suse.cz>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>

--nextPart1692600.LIfSYN1P7A
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello.

=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 20 =D1=81=D0=B5=D0=BD=D1=82=D1=
=8F=D0=B1=D1=80=D1=8F 2005 11:51 | Pavel Machek:
> Can V4 survive few hours of test below?

Maybe I'm doing something wrong here, but ext2 have failed on second check=
=20
of first pass with

Second check...
e2fsck 1.34 (25-Jul-2003)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Missing '..' in directory inode 17353.
=46ix? yes

Setting filetype for entry '..' in ... (17353) to 2.
Pass 3: Checking directory connectivity
'..' in /lost+found (21) is . (21), should be / (2).
=46ix? yes

'..' in /lost+found/#17353 (17353) is <The NULL inode> (0), should=20
be /lost+found (21).
=46ix? yes

Pass 4: Checking reference counts
Inode 2 ref count is 2, should be 3.  Fix? yes

Pass 5: Checking group summary information

fsck.damaged: ***** FILE SYSTEM WAS MODIFIED *****
fsck.damaged: 1345/25064 files (1.7% non-contiguous), 94063/100000 blocks
=46sck lied about its success (result =3D 1)


While reiser4 (with "fsck.$FS -fy --build-sb --build-fs --fix=20
fsck.damaged" command to make it really fix all the things it can) right=20
now trying to make 37-th pass (with all successfull previous passes)...

=2D-=20
                            Roman
 ,---------------------------. ,--------------------------.
/     http://www.3os.ru/      V    http://www.osrc.info/   \         .o.
\    mailto: rik@3os.ru       ^   mailto: rik@osrc.info    /         ..o
 `---------------------------' `--------------------------'          ooo
gpg --recv-keys 0xE5E055C3 --keyserver hkp://subkeys.pgp.net

--nextPart1692600.LIfSYN1P7A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBDMGLcXJ70z+XgVcMRAihsAJ4gFo8tYVNyr01Nm7iorl/XPUk/1wCcCkT0
EgVPuj5s5ISAmwj2VESheug=
=K08I
-----END PGP SIGNATURE-----

--nextPart1692600.LIfSYN1P7A--
