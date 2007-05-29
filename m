From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Filesystem corruption
Date: Tue, 29 May 2007 12:39:34 +0400
Message-ID: <200705291239.34445.vs@namesys.com>
References: <46598532.5060505@lncsa.com> <Pine.LNX.4.64.0705281829510.6275@sheep.housecafe.de> <465B1C90.6040009@lncsa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-30665-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <465B1C90.6040009@lncsa.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Laurent CARON <lcaron@lncsa.com>
Cc: reiserfs-list@namesys.com

Hello

On Monday 28 May 2007 22:16, Laurent CARON wrote:
> Christian Kujau a =E9crit :
> >> Please try to check the fs with a current version of reiserfsprogs=20
> >> first. As the manpage advises, try --check first and use=20
> >> --rebuild-tree only if you know what you're doing, IOW: have a current=
=20
> >> backup.
>=20
> Over the past few years, i experienced a few reiser corruption on=20
> various hardware (dell, hp, asus, sata, scsi, ide...) with the same=20
> symptoms (unredable file/dir).
> Always ran check which told me to run fix-fixable or rebuild-tree, which=
=20
> I did after ensuring of backup reliability, and the error was corrected=20
> (after eventually losing a few files i fortunately had in the backups).
>=20

Would you run reiserfsck --check -l log and let us see the log?
That may give a hint about which kind of corruptions do you have.

> >>
> >> Also, which kernel/machine is this running on? Do you know *why* this=
=20
> >> corruption may have occured? Any recent hardware issues? Is ther=20
> >> anything in the logs regarding fs/device errors?
>=20
> Kernel is 2.6.19.
> The machine does not seem to have any HW issue, nothing strange in the=20
> logs..... :$
> This is just a plain Dell 2650 server with a bunch of SCSI HDD, software=
=20
> raid5 array, reiserfs on top of it.
>=20
> Laurent
>=20
>=20
>=20
