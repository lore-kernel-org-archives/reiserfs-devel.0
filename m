From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: Cannot open root device
Date: Tue, 4 May 2004 10:54:44 +0200
Sender: bernd-schubert@web.de
Message-ID: <200405041054.51123.bernd-schubert@web.de>
References: <Pine.LNX.4.33.0405032124200.1663-100000@bi165.wilkes.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_ap1lA85lYjsMOHu";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18422-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.33.0405032124200.1663-100000@bi165.wilkes.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: John Wilkes <john@wilkes.com>

--Boundary-02=_ap1lA85lYjsMOHu
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

> Can I do that too?  In other words, can I mount /boot/initrd and have
> a look at what's there?  How do I mount it?

=46irst you should check this inird is not gzipped then you can simply moun=
t it=20
by doing e.g.:

mount -t ext2 -o loop /boot/initrd /mnt/any_where

This assumes your initrd is ext2 formated.

[snip]

>
> I'm guessing that the boot process does "rdev /dev/hda3" at some
> point.  How is "rdev" different from "mount"?  (Apart from the
> obvious, that one sets the root file system while the other simply
> makes the filesystem available.)  Does "rdev" read or write any
> special block that fsck doesn't look at?

I don't know how Suse's initrd's work and and also don't know rdev, but any=
=20
initrd I have seen uses "mount" and "pivot_root".

>
> I'm wondering if reformating the partition would cure the problem.

So far nobody knows the reason for your mount failures, so how should one k=
now=20
that it cures the problem?

>
> Here's how I would go about it:
>
> 1. boot alternate system on hdb
> 2. mount /dev/hda3 /mnt
> 3. cd /mnt
> 4. tar czvf ~/rootfs.tar .
> 5. umount /mnt
> 6. mkfs -t reiserfs /dev/hda3

Why not using mkreiserfs directly?

> 7. mount /dev/hda3 /mnt
> 8. cd /mnt
> 9. tar xzvf ~/rootfs.tar
>
> Does that look like it will work?  Any reiserfs specific options
> needed for mkfs?

=46or a very long time Suse modified mkreiserfs to make reiser3.5 to be def=
ault.=20
They even didn't warn about this, I don't know if this is still the default=
=20
version for Suse > 8.0.

If I were you, I first would simply try to replace the kernel with one that=
=20
doesn't require an initrd for booting.=20
In our institute we have several kernel available that can mount reiserfs=20
themselves. If you like (and trust me that I didn't modify the source in a=
=20
bad way ;-) ) I could make one available for downloading.

Another option would be to use e.g. knoppix for checking your root device, =
I'm=20
sure the newest version has a much more modern reiserfsck than Suse-8.1 CD'=
s=20
have.

Cheers,
	Bernd

--Boundary-02=_ap1lA85lYjsMOHu
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAl1paC8BUnAF+ydYRAp8+AJ9g59tGF0prfiOZU8cYhA1jqRicGgCfS/6W
CZ+kw8x3MRAXapiYDWwxNlc=
=Saxi
-----END PGP SIGNATURE-----

--Boundary-02=_ap1lA85lYjsMOHu--
