From: Jonathan Abbey <jonabbey@arlut.utexas.edu>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 14:36:17 -0500
Message-ID: <20040826193617.GA21248@arlut.utexas.edu>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com> <200408262128.41326.vda@port.imtp.ilyichevsk.odessa.ua>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Return-path: <reiserfs-list-return-20772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408262128.41326.vda@port.imtp.ilyichevsk.odessa.ua>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>
Cc: Rik van Riel <riel@redhat.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2004 at 09:28:41PM +0300, Denis Vlasenko wrote:
|
| Is it possible to sufficiently hide "dirs inside files"
| so that old tools will be unable to see them?
|=20
| I just checked:
|=20
| ls -d /foo  does lstat64("/foo", ...)
| ls -d /foo/ does lstat64("/foo", ...)
| 	but
| ls -d /foo/. does lstat64("/foo/.", ...)
|=20
| Will it work out if "dir inside file" will only be visible when referred =
as "file/."?

I'm used to using ls symlink/. to get ls to show me the directory on
the far side of a symbolic link.  That's a pretty analagous case to
the one we're discussing here, I think?

 Jon

--=20
---------------------------------------------------------------------------=
----
Jonathan Abbey 				              jonabbey@arlut.utexas.edu
Applied Research Laboratories                 The University of Texas at Au=
stin
GPG Key: 71767586 at keyserver pgp.mit.edu, http://www.ganymeta.org/workkey=
.gpg

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (SunOS)

iD8DBQFBLjuxGI9EwHF2dYYRAragAJ9DcI5AB3TZLclfHo5e3Y5dS6JxdwCg0/6u
AyQiinzuItKB7ATsWEZNni8=
=3fHv
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
