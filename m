From: Miguel <turtle.power@wanadoo.es>
Subject: Re: "df -i" support
Date: Fri, 14 May 2004 20:26:25 +0200
Message-ID: <20040514202625.721b6c43.turtle.power@wanadoo.es>
References: <20040513093432.52d3d7a3.turtle.power@wanadoo.es>
	<1084439945.14090.6209.camel@tribesman.namesys.com>
	<20040514173227.5b0541b5.turtle.power@wanadoo.es>
	<200405141655.i4EGtrAT007250@turing-police.cc.vt.edu>
	<20040514194040.22389128.turtle.power@wanadoo.es>
	<1084556902.29549.22.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18698-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1084556902.29549.22.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

On Fri, 14 May 2004 21:48:22 +0400
Vladimir Saveliev <vs@namesys.com> wrote:

> Hello
>=20
> On Fri, 2004-05-14 at 21:40, Miguel wrote:
> > On Fri, 14 May 2004 12:55:53 -0400
> > Valdis.Kletnieks@vt.edu wrote:
> >=20
> > > On Fri, 14 May 2004 17:32:27 +0200, Miguel said:
> > >=20
> > > > We are migrating our mtas from ext3 to reiserfs and the
> > > > monitorization(a plugin) relies on the output of df -i, this
> > > > output is very diferent between those filesystems, because
> > > > reiserfs always return -1 as a total number of inodes.
> > >=20
> > > The only reason you care about df -i is because on ext[23] and
> > > similar, it is possible to run out of inodes before you run out of
> > > files.  Since reiserfs allocates inodes as needed, you can't run
> > > out of them unless you run out of space - in which case your
> > > monitoring system should be flagging that.
> >=20
> > No, we check this value to know how many files are in that
> > partition (well an aproximation).
>=20
> Well, it is possible to calculate approximately how many files are on
> a filesystem

Yes?, how should I calculate this?

>=20
> >  I hope that this is true for ext2/3,
> > isn't?
>=20
> > >=20
> > > So just fix your code to say '-1 means unlimited', or if that's
> > > too complicated make it say:
> > >=20
> > > 	if (value =3D=3D -1) { value =3D 2147483648; }
> > >=20
> > > which won't be right but should make your scripts act correctly.
> >=20
> > df -i on a 2.4.x kernel already returns (2^32 - 1) free inodes.
> > probably kernel return -1 but df "get" this as a non-signed value.
> >=20
> > Here's an example sda1 is an ext3 partition an sdb1 is reiserfs
> > formatted:
> >=20
> >=20
> > Filesystem            Inodes   IUsed   IFree IUse% Mounted on
> > /dev/sda1            4480448  132216 4348232    3% /
> > /dev/sdb1            4294967295       0 4294967295    0%
> > /var/spool/postfix
> >=20
> > scripts return about 132000 files in / and 0 files in the other
> > filesystem
> >=20
>=20


--=20
La resistencia es f=FAtil todos ser=E9is asimilados
