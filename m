From: Sander Sweers <sander.sweers@gmail.com>
Subject: Re: grub reiser4 won't compile
Date: Mon, 2 May 2005 23:39:39 +0000
Message-ID: <b65fbb1305050216391187d449@mail.gmail.com>
References: <200504272226.48234.c_wakefield@shaw.ca>
	 <42763E8B.9060906@namesys.com>
	 <b65fbb1305050208176e07aa74@mail.gmail.com>
	 <200505021520.00991.c_wakefield@shaw.ca>
Reply-To: Sander Sweers <sander.sweers@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23962-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200505021520.00991.c_wakefield@shaw.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Wakefield <c_wakefield@shaw.ca>
Cc: reiserfs-list@namesys.com

On 02/05/05, Chris Wakefield <c_wakefield@shaw.ca> wrote:
> ls -l /var/cache/apt/archives|grep grub
> -rw-r--r--  1 root root   733102 2005-01-17 16:40
> grub_0.95+cvs20040624-13_amd64.deb
> -rw-r--r--  1 root root   733396 2005-02-05 07:18
> grub_0.95+cvs20040624-14_amd64.deb
> -rw-r--r--  1 root root   733610 2005-02-18 16:18
> grub_0.95+cvs20040624-15_amd64.deb
> -rw-r--r--  1 root root   733800 2005-03-21 00:41
> grub_0.95+cvs20040624-16_amd64.deb
>=20
> This is odd.   I run pure64 amd64 and these packages indicate that they a=
re 64
> bit?
>=20
> Chris W.
On gentoo if you have a multilib environment it will be built with
-m32 (just checked) and if you built it with -m64 i get the same error
as you. Gentoo has a special static 32bit package if you do not run
multilib, my guess is that Debian does the same with those packages.

Sander

--=20
After a time, you may find that "having" is not so pleasing a thing,
after all, as "wanting." It is not logical, but it is often true.

Spock, "Amok Time"
stardate 3372.7
