From: Cyrille Chepelov <cyrille@chepelov.org>
Subject: Re: [2.6.0-test3 + reiser4] NULL dereference a virtual address 00000009
Date: Fri, 15 Aug 2003 21:47:04 +0200
Message-ID: <20030815194704.GA12726@chepelov.org>
References: <20030815151205.GA9260@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15332-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030815151205.GA9260@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le Fri, Aug 15, 2003, =E0 05:12:05PM +0200, Cyrille Chepelov a =E9crit:
> Greetings,
>=20
> while shaking reiserfs4 a little, I stumbled upon a NULL dereference.


Extra details:

	* I can reproduce the crash after a reboot (or N reboots), by
mounting the fs and issuing an "apt-get check" (yes, this fs holds /usr
and /var of a test machine).

	* I could run strace on "apt-get check", but I could not get the
file to be stored before the oops, so here's the end of it, in manually
copied form:

stat64("/var/lib/apt/lists/security.debian.org_dists_testing_updates_main_b=
inary-i386_Packages",
{st_mode=3DS_IFREG|0644, st_size=3D7082, ...}) =3D 0
stat64("/var/lib/apt/lists/security.debian.org_dists_testing_updates_main_b=
inary-i386_Packages",
{st_mode=3DS_IFREG|0644, st_size=3D7082, ...}) =3D 0
munmap(0x4087e000, 4480972)                =3D 0
close(6)
open("/var/cache/apt/srcpkgcache.bin", O_RDONLY) =3D 6
fcntl64(6, F_SETFS, FD_CLOEXEC)            =3D 0
fstat64(6, {st_mode=3DS_IFREG|0644, st_size =3D 4480972, ...}) =3D 0
fstat64(6, {st_mode=3DS_IFREG|0644, st_size =3D 4480972, ...}) =3D 0
read(6, Unable to handle kernel NULL pointer dereference at virtual address
00000009
and then follows the oops I already posted.

After a reboot, I tried to cat /var/cache/apt/srcpkgcache.bin, and nothing
ill happened. If after that, I try again to run apt-get check, again I
crash.

I'm sending Nikita Danilov and Hans Reiser privately an URL to an image of
the file system. I'm leaving the computer "as is" for the next couple of
days, so if you guys want me to run specific things, I can do that.

	-- Cyrille

--=20
