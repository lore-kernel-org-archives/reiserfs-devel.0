From: "Lamont R. Peterson" <lamont@gurulabs.com>
Subject: Re: reiserfs logging patches udpated
Date: Wed, 24 Mar 2004 12:43:18 -0700
Message-ID: <1080157397.4247.11.camel@wraith.lrp.advansoft.us>
References: <1080149399.14737.77.camel@watt.suse.com>
Reply-To: lamont@gurulabs.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-p9nKN+t2Qf1DDMriJ97q"
Return-path: <reiserfs-list-return-17438-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080149399.14737.77.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-p9nKN+t2Qf1DDMriJ97q
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-03-24 at 10:29, Chris Mason wrote:
[SNIP]
> Andrew, this subset is ready for testing -mm.  It's everything except
> the xattr and ACLs, I'm still trying to convince Hans those should go
> in.
[SNIP]

We absolutely need xattr support or else nearly everyone is going to
move to ext3.  There are those who are too scared to try to use SELinux,
FACLs or other features provided by xattrs.  But for those of us doing
"real" work, SELinux and FACLs are long overdue.

I love using ReiserFS.  I consistently see significantly better
performance and more economical use of my storage spaces with ReiserFS
over ext3, JFS or XFS in real-world use.

I will soon have all of my systems converted to using SELinux.  I do not
want to abandon ReiserFS, so I will make sure to patch my kernels as
needed.  However, most of the systems that others use (which I have set
up or whatever) are not going to see these kernels.  For most people, it
has to come with the "stock" kernel of their chosen distribution.

Please, get the xattr patches into the mainline kernel.

Thank you for all the great work.  Keep it up.
--=20
Lamont Peterson <lamont@gurulabs.com>
Senior Instructor
Guru Labs <http://www.gurulabs.com/>

--=-p9nKN+t2Qf1DDMriJ97q
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAYeTVRK8Q4zt1QRURArSAAKCckmnxtN32lphH/JmOpnwArEM/QwCgtewT
GM7l7AjiK/M2/NYAyEKq8U0=
=KOaP
-----END PGP SIGNATURE-----

--=-p9nKN+t2Qf1DDMriJ97q--

