From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: extended attributes
Date: Mon, 18 Nov 2002 16:32:28 -0500
Message-ID: <20021118213228.GC14444@fury.csh.rit.edu>
References: <200210231916.18976.bofh@coker.com.au> <20021024014522.GD28822@clusterfs.com> <1035464747.28715.92.camel@tiny>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YToU2i3Vx8H2dn7O"
Return-path: <reiserfs-list-return-12015-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1035464747.28715.92.camel@tiny>
Resent-To: ReiserFS List <reiserfs-list@namesys.com>
Resent-Message-Id: <20021118224628.5A9882E384@fury.csh.rit.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>


--YToU2i3Vx8H2dn7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 24, 2002 at 09:05:47AM -0400, Chris Mason wrote:
> On Wed, 2002-10-23 at 21:45, Andreas Dilger wrote:
> > On Oct 23, 2002  19:16 +0200, Russell Coker wrote:
> > > Extended attribute support is apparently in 2.5.x kernels now and wil=
l be in=20
> > > 2.4.20.
> > >=20
> > > When will ReiserFS support extended attributes?
> > >=20
> > > Currently there is discussion about the possibility of using extended=
=20
> > > attributes for SE Linux security context labels, if that goes ahead t=
hen I=20
> > > will be forced to cease using any file system that lacks such support.
> > >=20
> > > I would like to continue using ReiserFS...
> >=20
> > I would think that it would be practical to just store the EA data as a
> > separate file internally, if you are using tail packing.  That avoids
> > the need to have a separate data format for EAs entirely.
> >=20
> > What I would probably do is have an EA pointer from each inode.  It
> > would just point to a directory and the EAs would be files with the
> > filename =3D=3D attribute name.  You can probably do special packing so
> > that this is stored efficiently...
> >=20
>=20
> The suse kernels include reiserfs extended attribute and acl support
> (the bestbits.at interface, reiserfs part by Jeff Mahoney).
>=20
> We did it without changing the metadata format at all, which means
> putting each xattr into a file.  The patches are mired in dependencies
> from other parts of the suse kernel, we're trying to pull it all out. =20
>=20
> Until then you can grab the kernels/source at
> ftp.suse.com/pub/people/mantel/next (warning, these are the suse
> bleeding edge kernels).

    Hey all -

    Sorry for the delay in getting this patch out. There was a bug that for
    some reason didn't occur in the SuSE kernel, and it took me some time to
    finally track it down. The code has completed four days of my
    standard xattr stress load succesfully.

    The stress load I typically run for these patches is:
    * default ACL set in the FS root
    * fs_stress 20
    * stress.sh -n 50
    * myattr.pl, which goes through the stress.sh tree and applies random
                 user xattrs to files until interrupted

    Prerequisites:
    * Chris's data logging patches (ftp://ftp.suse.com/pub/people/mason)
        - For nested transactions
    * Andreas Gruenbacher's acl/ea patches (http://acl.bestbits.at)
        - For the ACL/EA infrastructure

    Two patches to get (ftp://ftp.suse.com/pub/people/jeffm/reiserfs/aclea)
    * 01-inode_read_write-atomic.diff - dependency in reiserfs_setattr
    * 02-reiserfs-acl.diff - the xattr/acl patches themselves

    A few config options:
    * CONFIG_REISERFS_FS_XATTR - enables xattrs in general for reiserfs
    * CONFIG_REISERFS_FS_XATTR_USER - enables user xattrs for reiserfs
    * CONFIG_REISERFS_FS_POSIX_ACL - enables posix acls for reiserfs

    Questions/comments welcome and appreciated.

    Enjoy.

    The patches were originally attached to this message, but the reiserfs-list
    mailer killed them for being too large. The SuSE ftp site may take a
    little while to update.

    -Jeff

--
Jeff Mahoney
jeffm@suse.com
jeffm@csh.rit.edu

--YToU2i3Vx8H2dn7O
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (SunOS)

iD8DBQE92VxrLPWxlyuTD7IRAoGNAJ9Ii92T2IY9TYfbQGLZi8+1UZMDXACgj8Co
e7fKHeHU9jL6vYtjISIuS1w=
=2Ehu
-----END PGP SIGNATURE-----

--YToU2i3Vx8H2dn7O--
