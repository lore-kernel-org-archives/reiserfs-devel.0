From: Bennett Todd <bet@rahul.net>
Subject: Re: How to set a reiserfs partition to get an occasional fsck?
Date: Fri, 30 Jan 2004 11:19:30 -0500
Message-ID: <20040130161930.GA531@rahul.net>
References: <200401301515.10852.Michael.James@csiro.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <reiserfs-list-return-16659-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200401301515.10852.Michael.James@csiro.au>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Michael James <Michael.James@csiro.au>
Cc: reiserfs-list@namesys.com

--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2004-01-29T23:15:10 Michael James:
> PS:	I've just realized I can do it by adding an fsck
> 	  into the linuxrc script of a cooked initrd image.

I'm sure there are many approaches that can be used, but it so
happens that I can specifically comment on that one, having recently
gotten started playing with initrds.

They're so easy, so fun!

If I wanted to make a "fsck boot", here's how _I_ would do it.

	dd if=/dev/zero bs=1024k count=4 of=initrd.fs
	mke2fs initrd.fs
	mount -o loop initrd.fs /mnt
	# copy a full busybox setup onto /mnt
	# copy the statically-linked fsck binary I want to /mnt
	sync
	umount /mnt
	gzip -9 <initrd.fs >initrd.img

That's a rescue disk. If you want it to be completely automated, add
this etc/init.d/rcS, mode 0755:

	#!/bin/sh
	fsck command I want
	reboot

I've got a statically linked busybox (along with a lot of other
components, all statically linked against uClibc) available from
<URL:http://bent.latency.net/bent/>. For rescue disk creation you'll
want to unpack elsewhere and delete docs, and var/lib/bpm (where the
complete package sources are installed).

To boot such an initrd, besides specifying your kernel and initrd,
you want to add "rw" and "root=/dev/ram0" to your boot options.

But I don't think I'd actually respond this way to the problem
you've got. RAM is so cheap, run memtest86 to find out for sure
which bits are marginal, and replace 'em.

-Bennett

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQFAGoQRHZWg9mCTffwRAtkFAKCF8BFc0gPts8EVqOurvs5dwlMwxACeP6JM
ky0MeDVx0kuvPvbZLD5ye/U=
=nP+0
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
