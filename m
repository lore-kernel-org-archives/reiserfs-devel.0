From: Kacper Wysocki <kacperw@online.no>
Subject: Re: reiser4 problems in 2.6.10-rc1-mm
Date: Fri, 19 Nov 2004 07:41:24 +0000
Message-ID: <1100850087l.4414l.0l@comotion>
References: <1100667360l.1027l.0l@comotion>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-asMP7fBYOX+J+rtYeu5c";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-list-return-22424-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <1100667360l.1027l.0l@comotion>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-asMP7fBYOX+J+rtYeu5c
Content-Type: text/plain; charset=ISO-8859-1; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11/16/04 23:55:53, Kacper Wysocki wrote:
> Hello,
>=20
> I decided to try out reiser4 yesterday, when I got a new harddrive
> for my laptop. In the process, I had some terrible problems, and gave
> up after a good full day of trying to make it work.
[snip]
> Steps to reproduce: run 'apt-get update' (or any apt-get command
> really, and some other apps as well). 'apt-get update' will fetch all
> the index files and then oops on 'reading package lists..' First time
> after reboot: recoverable kernel oops. Second time: process enters
> unkillable sleep, as does strace and gdb when attempting to attach to
> it.
[snip]

Hi,

I'm replying to my own message here, but I made some progress on this =20
today: after basically restoring the filesystem again, I used the =20
missing context fix patch from the thread
"Re: 2.6.10-rc2-mm1: oops when accessing reiser4 fs's(maybe fix	=20
provided)" on this very same list, since Mathieu Segaud seemed to have =20
problems similar to mine. This did indeed fix my bootup oopsing =20
problems, however the filesystem still oopses+segfaults some important =20
applications - ie apt-get as described in the previous post.

I'm not posting the new (slightly different)oops here, as I noticed =20
that the previous oopses were a little hard to read due to all the =20
syslog crap, and I'm not sure anyone's interested, since I did not =20
receive any replies to my previous post. Also, my reiserfs (v3) =20
partition seems to be working fine
(this mere fact rules out a corrupted file system due to usb tranfer =20
errors and most possibilities of physical problems with my new =20
harddrive).

However, should anyone more knowledgable about reiser4 have any ideas =20
as to what's causing this oops, I'd be more than happy to debug a =20
little further.

Cheers,
Kacper

--=-asMP7fBYOX+J+rtYeu5c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBnaOn+LsaKQiaxYYRAkGfAJ90CB5bwBPP/c9zIx6vHP/NcRaFXgCfYQZ0
30peaCZKqW6ft4/3yDDZCj0=
=0As/
-----END PGP SIGNATURE-----

--=-asMP7fBYOX+J+rtYeu5c--

