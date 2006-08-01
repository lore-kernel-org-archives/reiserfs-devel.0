From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Tue, 1 Aug 2006 14:27:05 +0200
Message-ID: <20060801122705.GB14461@hermes.uziel.local>
References: <44CBA4BF.80301@slaphack.com> <200607300132.28326.sarathmenon@gmail.com> <44CBC557.4050403@slaphack.com> <20060730115526.GB5336@hermes.uziel.local> <7a329d910607301410x6d6fb4f0sa946c8764be82ab1@mail.gmail.com> <20060730213757.GB6420@hermes.uziel.local> <20060730214237.GC6420@hermes.uziel.local> <7a329d910607310821p69e964f7t8d29300f3221cfa3@mail.gmail.com> <44CE286F.6000700@slaphack.com> <op.tdj9mnrnd4os1z@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Return-path: <reiserfs-list-return-29391-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <op.tdj9mnrnd4os1z@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: =?utf-8?Q?=C5=81ukasz?= Mierzwa <prymitive@pcserwis.net>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2006 at 06:05:01PM +0200, =C5=81ukasz Mierzwa wrote:

> I gues that extens are much harder to reuse then normal inodes so when Yo=
u =20
> have something as big as portage tree filled with nano files wich are =20
> being modified all the time then You just can't keep performance all the =
=20
> time. You can always tar, rm -fr /usr/portage, untar and You will probabl=
y =20
> speed things up a lot.

I submitted a script to this list which takes care of everything
required to recreate your fs. It even converts between different
filesystems, for migration purposes or comparitive tests, and currently
supports ext2|3, reiser3|4 and xfs.

The thing is undergoing some surgery atm. to reduce forced disk flushes.
I already replaced the call to sync() after every operation by one
fsync() call on the archive file before the formatting takes place. What
is still missing is functionality to retrieve things like fs label and
UUID from the existing fs and reuse them during mkfs. Testing is also
pending, so you might not want to hold your breath waiting for the funky
version, the idea of which is to leave everything as it was found,
except for better disk layout and possibly changed fs type.

It is a completely different approach from convertfs, which tries to do
the conversion in-place by moving the fs's contents into a new fs
created within a sparse file on the same device and relocating the
sparse file's blocks afterwards. My guess is that a failure of any kind
in the latter process will destroy your data (this was the case last
time I checked), while I do (at least try) everything to ensure that the
tarball is written to platters before mkfs occurs.

The new version will be posted to wiki.namesys.com asap, no timeframe
attached though as Thursday yields an exam, so maybe on Friday, but who
knows. The version already posted to the list works well, I used it at
least a hundred times, even on stuff like /home and /usr (the latter
works only from a live cd or custom initramfs).

Kind regards,
Chris

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iQIVAwUBRM9ImKnY3eLOiwZcAQp8xRAAvJzOabQuYaHRRaicY6MeU9UHSg3Dp4sp
QmNXBG0b0peQkf3zV57ql8dgnHK6+DI2Dd4BkkATcJADq9aow80CR1hixZeP7Zgz
ctlIi7ZujCiVVLY8W64zGthbvZKAwk7HD4MBRCgL1P1BuLIerdAIeaSrYrhtTkc6
oQkNRi3BXeUjEV0+5EHs10X/2nqxhjT5DXOirsvg/g34VwqiwDxiDIVVAlKwFcho
SgdBXyw8eAn8jqIQDzB9eZnNZAyQB2iHl5/+mjzO2/LsBkj8SA8NsV6SU7zpdrRe
9v9+IB15SQRMhT7V0M9/5Mz1CWUQFJXpbP8IQO7MIV47PXYOuK6sWIokg/b98H8/
YP6lLSr0o2ffc+XkynzkGWTFujB38cMtOupHE/+FFKnIA1yejEWJkOtZIbsVlN1I
FRwUdux7qH0795HT85OwwM8eZkad7se9hgib9sAc0G+q+TwYcHPcGpf1D8JxUlWL
dWCOMDQbPE+5PKjRX5UlP7rgTbfK9NeocIzFy/yR4UOOImRmWM61RuyKUSakulOp
rOTT8LMgGb+qgh30BIOzwqRCIZBjnyZUc63Ue4i158Sxk/lXX0Vz1OSf+Muw5wA6
Oqz5XmfvoFkPCZNoqe7i5OSlWxjjLh9LNfBwaRUZMYvLFNnFkuhoKnESmJTmflhq
FR4EfN1YqLw=
=iv+t
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--

