From: Francisco Javier Cabello <fjcabello@visual-tools.com>
Subject: Re: data corruption with 2.4.25 and datalogging patches
Date: Fri, 14 Jul 2006 10:25:59 +0200
Message-ID: <200607141026.03556.fjcabello@visual-tools.com>
References: <200607120816.11292.fjcabello@visual-tools.com> <1152801263.6353.147.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart6257003.ncl78ZjG1R";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29000-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1152801263.6353.147.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--nextPart6257003.ncl78ZjG1R
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,
I am almost sure that unclean shutdowns happen in those systems. We have tr=
ied=20
to reproduce removing power each 5 minutes and the filesystem wasn't=20
suffering corruption. Perhaps it's related, but I don't know.

I have talked about 'Datalogging patches' because it's the only thing=20
different from our system. I have searched a lot and  few people have=20
corruption with reiserfs standalone... so, it may be datalogging patches.

what do you need from reiserfsck? I guess the output of 'reiserfsck --check=
=20
device' of perhaps you need the output of reiserfsck --rebuild tree.


Regards,

Paco




On Thursday, 13 de July de 2006 16:34, Vladimir V. Saveliev wrote:
> Hello
>
> On Wed, 2006-07-12 at 08:16 +0200, Francisco Javier Cabello wrote:
> > Hello,
> > My company develops video recorder system. Basically we work with linux
> > boxes running kernel 2.4.25. The system captures analogue video,  and
> > after processing and compressing, digital video is stored to hard disk.
> > We are recording continuously (24x7).
> >
> > We have realized that more or less a 10% of our systems are suffering
> > data corruption in the reiserfs partition.
>
> Did unclean shutdowns take place on those systems?
> If you let us see what does reiserfsck report in those cases that could
> help to understand what is is happening.
>
> > Sometimes it's possible to fix it
> > running 'reiserfsck --rebuild-tree' but not always.
> > More information:
> > -Kernel 2.4.25 + v4l2 patches
> > -Reiserfsprogs 3.6.19
> > -Datalogging patches.
> > (http://mirror.mcs.anl.gov/suse-people/mason/patches/data-logging/2.4.2=
5/
> >)
> >
> > I have checked datalogging patches from Reiserfs website and they seem
> > equal to suse ones.
> >
> > I don't have any idea of what it's happening. The disk bandwidth is not
> > so high (300-500kb/sec). The disk is always full at 90% (we have a
> > process deleting old video).
> >
> > I have been thinking about removing Dataloggin patches but I would like
> > to have serious reason. It's not easy to check that the problem is solv=
ed
> > because we are not able to reproduce the error in our headquarter.
> >
> > Regards,
> >
> > Paco

=2D-=20
One of my most productive days was throwing away 1000 lines of code (Ken=20
Thompson)
=2D----------------
PGP fingerprint: AF69 62B4 97EB F5BB 2C60  B802 568A E122 BBBE 5820
PGP Key available at http://pgp.mit.edu
=2D----------------


--nextPart6257003.ncl78ZjG1R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBEt1UbVorhIru+WCARAqWhAJ0QDYYfXDF3e9c8wMlUqoR+FVQEKgCfbu1Z
5yVJzCr7lVbDr3xFVKZ+azQ=
=vMPW
-----END PGP SIGNATURE-----

--nextPart6257003.ncl78ZjG1R--
