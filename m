From: Tracy R Reed <treed@ultraviolet.org>
Subject: Re: Silly question, defrag
Date: Wed, 3 Apr 2002 15:49:06 -0800
Message-ID: <20020403154906.A21821@ultraviolet.org>
References: <200204030017.12595@X-Message-Flag:> <3CAABBA6.3030101@swelltech.com> <200204030740.05950@X-Message-Flag:>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200204030740.05950@X-Message-Flag:>; from matthew@psychohorse.com on Wed, Apr 03, 2002 at 08:08:21AM -0800
List-Id: <reiserfs-devel.vger.kernel.org>
To: Matthew Johnson <matthew@psychohorse.com>
Cc: reiserfs-list@namesys.com

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2002 at 08:08:21AM -0800, Matthew Johnson wrote:
> On Wednesday 03 April 2002 00:21, Joe Cooper wrote:
> > "Don't"
> >
>=20
> Well I don't, but when newbies who are used to computing on win32 systems=
=20
> hear that they may not just accept the word don't. Actually its hard to f=
ind=20
> the reasons exactly why one does not defrag.

It is more useful to look at why one DID defrag back in the bad ol' days
of DOS and Windows. IIRC, the FAT filesystem would scan through it's
equivalient of the free block list and start writing at the first free
block. If it wrote for a while and then there was other data in the way it
stop and go to the next free space. This way fragmentation was practically
guarenteed and it happened rapidly. Modern filesystems use much smarter
ways of laying out data on the disk so that fragmentation happens much
less often. Now you will almost certainly waste more time by defragmenting
than you would suffering whatever performance hit the little fragmentation
there is causes. I've been using Linux/Unix for 10 years and I have never
(not once!) defragged a filesystem.

> Perhaps I should aim this message to the kernel mailing list, so that I c=
an=20
> get response from a wider array of people who like other filesystems. But=
 its=20
> not kernel related.=20

I wouldn't recommend doing that. The answer is pretty much the same
regardless of the filesystem. If it's a non-FAT fs you probably don't have
to worry about fragmentation.

--=20
Tracy Reed      http://www.ultraviolet.org

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAjyrlPEACgkQ9PIYKZYVAq1jPgCghgq0jBwTJtigm7VD6dSceyP1
Z0gAni7tSeXYflkfJ5P6/za30JUVzndD
=SksY
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
