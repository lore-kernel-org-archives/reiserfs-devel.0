From: Miguel <turtle.power@wanadoo.es>
Subject: Re: "df -i" support
Date: Wed, 19 May 2004 21:41:45 +0200
Message-ID: <20040519214145.6082af87.turtle.power@wanadoo.es>
References: <20040513093432.52d3d7a3.turtle.power@wanadoo.es>
	<1084439945.14090.6209.camel@tribesman.namesys.com>
	<20040514173227.5b0541b5.turtle.power@wanadoo.es>
	<200405141655.i4EGtrAT007250@turing-police.cc.vt.edu>
	<20040514194040.22389128.turtle.power@wanadoo.es>
	<1084557009.3263.7.camel@localhost.localdomain>
	<20040514202627.18ddc7b2.turtle.power@wanadoo.es>
	<20040514184823.GG18086@schnapps.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18770-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040514184823.GG18086@schnapps.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Jonathan Briggs <jbriggs@esoft.com>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Fri, 14 May 2004 12:48:23 -0600
Andreas Dilger <adilger@clusterfs.com> wrote:

> On May 14, 2004  20:26 +0200, Miguel wrote:
> > Jonathan Briggs <jbriggs@esoft.com> wrote:
> > > Would this help you?
> > >=20
> > > # cat /proc/fs/reiserfs/md1/oidmap
> > >=20
> > > At the end of oidmap is a line like this:
> > > total:  46 [46/972] used: 176147 [exact]
> > >=20
> > > I think the used: 176147 is pretty close to what you want.  The
> > > number goes up and down when I create or remove files.  When I ran
> > > 'find /-xdev | wc -l' I got 174425.  I'm not sure where the extra
> > > 1,000+ comes from. =20
> > >=20
> > > You would need to have CONFIG_REISERFS_PROC_INFO set in your
> > > kernel, and of course you would need to replace md1 with whatever
> > > device you were using.
> >=20
> > I can't set this kind of debuging in a production enviroment but
> > those are the values that i'm seeking for. There's another way to
> > get this?.
>=20
> Hmm, why wouldn't reiserfs_statfs() just use that number for the "in
> use" inodes in the first place?  Sadly, the statfs() interface is
> broken in the sense that it contains "total" inodes and "free" inodes
> instead of"in use" inodes, but it shouldn't be difficult to just
> subtract the number of in-use inodes from 2^32-1 and stick that into
> the "free" field so that when user-space does the reverse it gets the
> right number.

I see your point doing an strace df -i (with a 2.6.6 kernel)
reiserfs_statfs reports those values zeroed:

statfs64("/", 84, {f_type=3D"REISERFS_SUPER_MAGIC", f_bsize=3D4096,
f_blocks=3D2560271, f_bfree=3D497245, f_bavail=3D497245, f_files=3D0, f_ffr=
ee=3D0,
f_fsid=3D{0, 0}, f_namelen=3D255, f_frsize=3D4096}) =3D 0

f_files and f_ffree are 0???. I'm trying to do a patch that show those
correctly using show_oidmap() function, but seems that other fs don't
report those values correctly, it's going to be deprecated or something?

>=20
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
>=20


--=20
La resistencia es f=FAtil todos ser=E9is asimilados
