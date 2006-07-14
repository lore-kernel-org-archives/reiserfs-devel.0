From: Francisco Javier Cabello <fjcabello@visual-tools.com>
Subject: Re: data corruption with 2.4.25 and datalogging patches
Date: Fri, 14 Jul 2006 14:20:34 +0200
Message-ID: <200607141420.36656.fjcabello@visual-tools.com>
References: <200607120816.11292.fjcabello@visual-tools.com> <1152877739.6407.37.camel@tribesman.namesys.com> <200607141403.33613.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart42726798.rkdN2y2fZE";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29003-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607141403.33613.fjcabello@visual-tools.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: "Vladimir V. Saveliev" <vs@namesys.com>

--nextPart42726798.rkdN2y2fZE
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello Vladimir,

# reiserfsck -l /tmp/reiserfsck.log -y --check /dev/hdc1

Standard output:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
Will read-only check consistency of the filesystem on /dev/hdc1
Will put log info to '/tmp/reiserfsck.log'
###########
reiserfsck --check started at Fri Jul 14 14:09:33 2006
###########
Replaying journal..
Reiserfs journal '/dev/hdc1' in blocks [18..8211]: 0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..Bad nodes were found, Semantic pass skipped
1 found corruptions can be fixed only when running with --rebuild-tree
###########
reiserfsck finished at Fri Jul 14 14:13:29 2006
###########
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

/tmp/reiserfsck.log:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
bad_internal: vpf-10320: block 23868569, items 91 and 92: The wrong order o=
f=20
items: [410810496 11321 0x16abca00 ??? (15)], [11312 11321 0x22f1c880 DIR=20
(3)]
 the problem in the internal node occured (23868569), whole subtree is skip=
ped
vpf-10640: The on-disk and the correct bitmaps differs.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Regards,

Paco


On Friday, 14 de July de 2006 14:03, Francisco Javier Cabello wrote:
> Yes. I have a sef of system with the same main board, memory,
> microprocessor... They are identical. The difference is the conditions
> where they are working. Perhaps the cpu load average is difference, the
> amount of data they are writting, the number of power failure...
>
> I am going to send you the output of reiserfsck of some the systems.
>
> Regards,
>
> Paco
>
> On Friday, 14 de July de 2006 13:48, Vladimir V. Saveliev wrote:
> > Hello
> >
> > On Fri, 2006-07-14 at 10:25 +0200, Francisco Javier Cabello wrote:
> > > Hello,
> > > I am almost sure that unclean shutdowns happen in those systems. We
> > > have tried to reproduce removing power each 5 minutes and the
> > > filesystem wasn't suffering corruption. Perhaps it's related, but I
> > > don't know.
> > >
> > > I have talked about 'Datalogging patches' because it's the only thing
> > > different from our system.
> >
> > sorry, I am confused. Am I correct that you have set of systems and they
> > all run similar load on the same kernel and only ~10% of them encounter
> > reiserfs corruptions? Do they have identical hardware?
> >
> > > I have searched a lot and  few people have
> > > corruption with reiserfs standalone... so, it may be datalogging
> > > patches.
> > >
> > > what do you need from reiserfsck? I guess the output of 'reiserfsck
> > > --check device'
> >
> > yes. There is -l option to redirect output to log file.
> >
> > > of perhaps you need the output of reiserfsck --rebuild tree.
> > >
> > >
> > > Regards,
> > >
> > > Paco
> > >
> > > On Thursday, 13 de July de 2006 16:34, Vladimir V. Saveliev wrote:
> > > > Hello
> > > >
> > > > On Wed, 2006-07-12 at 08:16 +0200, Francisco Javier Cabello wrote:
> > > > > Hello,
> > > > > My company develops video recorder system. Basically we work with
> > > > > linux boxes running kernel 2.4.25. The system captures analogue
> > > > > video,  and after processing and compressing, digital video is
> > > > > stored to hard disk. We are recording continuously (24x7).
> > > > >
> > > > > We have realized that more or less a 10% of our systems are
> > > > > suffering data corruption in the reiserfs partition.
> > > >
> > > > Did unclean shutdowns take place on those systems?
> > > > If you let us see what does reiserfsck report in those cases that
> > > > could help to understand what is is happening.
> > > >
> > > > > Sometimes it's possible to fix it
> > > > > running 'reiserfsck --rebuild-tree' but not always.
> > > > > More information:
> > > > > -Kernel 2.4.25 + v4l2 patches
> > > > > -Reiserfsprogs 3.6.19
> > > > > -Datalogging patches.
> > > > > (http://mirror.mcs.anl.gov/suse-people/mason/patches/data-logging=
/2
> > > > >.4 .25/ )
> > > > >
> > > > > I have checked datalogging patches from Reiserfs website and they
> > > > > seem equal to suse ones.
> > > > >
> > > > > I don't have any idea of what it's happening. The disk bandwidth =
is
> > > > > not so high (300-500kb/sec). The disk is always full at 90% (we
> > > > > have a process deleting old video).
> > > > >
> > > > > I have been thinking about removing Dataloggin patches but I would
> > > > > like to have serious reason. It's not easy to check that the
> > > > > problem is solved because we are not able to reproduce the error =
in
> > > > > our headquarter.
> > > > >
> > > > > Regards,
> > > > >
> > > > > Paco

=2D-=20
One of my most productive days was throwing away 1000 lines of code (Ken=20
Thompson)
=2D----------------
PGP fingerprint: AF69 62B4 97EB F5BB 2C60  B802 568A E122 BBBE 5820
PGP Key available at http://pgp.mit.edu
=2D----------------


--nextPart42726798.rkdN2y2fZE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBEt4wUVorhIru+WCARAr0ZAJ9e0+HbyCFkBNJey7IgPHj33hpyzgCfcuMG
zhp0Wp15661aZSeUYoxz4Vc=
=zoX1
-----END PGP SIGNATURE-----

--nextPart42726798.rkdN2y2fZE--
