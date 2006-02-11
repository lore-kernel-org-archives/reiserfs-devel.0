From: Sergey Vlasov <vsu@altlinux.ru>
Subject: Re: 2.6.15 Bug? New security model?
Date: Sun, 12 Feb 2006 00:55:41 +0300
Message-ID: <20060212005541.107f7011.vsu@altlinux.ru>
References: <200602080212.27896.bernd-schubert@gmx.de>
	<200602081314.59639.bernd-schubert@gmx.de>
	<20060208205033.GB22771@shell0.pdx.osdl.net>
	<200602082246.15613.bernd-schubert@gmx.de>
	<20060208221124.GN30803@sorel.sous-sol.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__12_Feb_2006_00_55_41_+0300_WZowB6GEmT/4d69G"
Return-path: <reiserfs-list-return-28073-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060208221124.GN30803@sorel.sous-sol.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Bernd Schubert <bernd-schubert@gmx.de>
Cc: Chris Wright <chrisw@sous-sol.org>, John M Flinchbaugh <john@hjsoft.com>, reiserfs-list@namesys.com, Sam Vilain <sam@vilain.net>, linux-kernel@vger.kernel.org

--Signature=_Sun__12_Feb_2006_00_55_41_+0300_WZowB6GEmT/4d69G
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Feb 2006 14:11:24 -0800 Chris Wright wrote:

> * Bernd Schubert (bernd-schubert@gmx.de) wrote:
> > Er, you mean /proc/fs/reiserfs/{partition}/on-disk-super?
>=20
> Yup.
>=20
> > bernd@bathl ~>grep attrs_cleared /proc/fs/reiserfs/hda6/on-disk-super
> > flags:  1[attrs_cleared]
>=20
> > > 2) does mount -o attrs ... make a difference?
> >=20
> > Yes, 2.6.13 now makes the same trouble. No difference with 2.6.15.3.=20
> > I played with mount -o noattrs, this makes no difference with 2.6.13, b=
ut has=20
> > some effects to 2.6.15.3. Creating files in /var/run is possible again,=
=20
> > lsattr gives "lsattr: Inappropriate ioctl for device While reading flag=
s=20
> > on /var/run", but deleting files in /var/run is still impossible (still=
=20
> > rather bad for the init-scripts).

Is the filesystem in question old - could it be created initially in the
reiserfs v3.5 format (used with 2.2.x kernels) and later converted to
v3.6 (by mounting with the "conv" option)?

> Yes, that's what I thought.  There's still some backward logic in there.
> noattrs vs. attrs triggers whether the code path that's patched in
> 2.6.15.3 is taken.  I'll dig a bit more, but hopefully the reiserfs folks=
=20
> can fix this for us.

Here is a simple test case which reproduces the problem with a
filesystem converted from v3.5:

# dd if=3D/dev/zero of=3Dtmp.img bs=3D1M count=3D100
# mkreiserfs --format 3.5 -f tmp.img
# mount -t reiserfs -o loop,conv tmp.img /mnt/disk/
# umount /mnt/disk/
# reiserfsck --clean-attributes tmp.img
# mount -t reiserfs -o loop tmp.img /mnt/disk/

At this point, I get obviously wrong attributes on /mnt/disk:

# lsattr -d /mnt/disk/
-----a--c---- /mnt/disk/

BTW, this breaks even with kernels earlier than 2.6.15.2, if you also
add the "attrs" options to the last mount command.

Apparently the reiserfs attrs code has been broken for such converted
filesystems for some time, but it could be enabled only with the "attrs"
option, so people were not hitting this.  However, the following patch:

http://www.kernel.org/git/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3D=
commit;h=3D2949ccf9379678df66ecf2ca70ed4656159eacdd

changed the logic to enable the "attrs" option on all filesystems which
have the reiserfs_attrs_cleared flag.  But that patch was broken - it
did not really set the option properly, so the attrs-related breakage
did not became visible until yet another patch:

http://www.kernel.org/git/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3D=
commit;h=3Dd35c602870ece3166cff3d25fbc687a7f707acf3

which later made into 2.6.15.2, and caused problems for some people.

I have noticed that fs/reiserfs/inode.c:init_inode() does not initialize
REISERFS_I(inode)->i_attrs and inode->i_flags (as done by
sd_attrs_to_i_attrs()) in the branch for v1 stat data; maybe this causes
the problem?

--Signature=_Sun__12_Feb_2006_00_55_41_+0300_WZowB6GEmT/4d69G
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.17 (GNU/Linux)

iD8DBQFD7l1hW82GfkQfsqIRAnqHAJ9Sw1U6Tac6gHbRfgFOzU+/OOxZ9QCfR7Eg
VLOLymLLr9XgFAFNW6AdFMs=
=/xsm
-----END PGP SIGNATURE-----

--Signature=_Sun__12_Feb_2006_00_55_41_+0300_WZowB6GEmT/4d69G--
