From: Francisco Javier Cabello <fjcabello@visual-tools.com>
Subject: Re: data corruption with 2.4.25 and datalogging patches
Date: Thu, 20 Jul 2006 09:29:50 +0200
Message-ID: <200607200929.53331.fjcabello@visual-tools.com>
References: <200607120816.11292.fjcabello@visual-tools.com> <1152881975.6407.58.camel@tribesman.namesys.com> <200607191433.18082.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1934319.H5SD26WPj8";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29083-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607191433.18082.fjcabello@visual-tools.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: "Vladimir V. Saveliev" <vs@namesys.com>

--nextPart1934319.H5SD26WPj8
Content-Type: multipart/mixed;
  boundary="Boundary-01=_uDzvEvBca4+IuAy"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_uDzvEvBca4+IuAy
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

At the end I could fix the filesystem. I attach the output of 'reiserfsck=20
=2D-rebuild-tree'

Do you have any idea?

Regards,

Paco


On Wednesday, 19 de July de 2006 14:33, Francisco Javier Cabello wrote:
> Hello,
> I think It's not a memory problem. I have run memtest for more than 24
> hours and the memory is OK.
> We use the best memory in the market (Kingston). When a system
> fails we check hardware devices first. If we find a hardware problem we
> usually don't check for software problem.
>
> I have other system with reiserfs corruption. I send you attached reisefs=
ck
> output for  'reiserfsck --check' and 'reiserfsck --check --fix-fixable'
>
> Regards,
>
> Paco
>
> On Friday, 14 de July de 2006 14:59, Vladimir V. Saveliev wrote:
> > Hello
> >
> > On Fri, 2006-07-14 at 14:20 +0200, Francisco Javier Cabello wrote:
> > > Hello Vladimir,
> > >
> > > # reiserfsck -l /tmp/reiserfsck.log -y --check /dev/hdc1
> > >
> > > Standard output:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > > Will read-only check consistency of the filesystem on /dev/hdc1
> > > Will put log info to '/tmp/reiserfsck.log'
> > > ###########
> > > reiserfsck --check started at Fri Jul 14 14:09:33 2006
> > > ###########
> > > Replaying journal..
> > > Reiserfs journal '/dev/hdc1' in blocks [18..8211]: 0 transactions
> > > replayed Checking internal tree..finished
> > > Comparing bitmaps..Bad nodes were found, Semantic pass skipped
> > > 1 found corruptions can be fixed only when running with --rebuild-tree
> > > ###########
> > > reiserfsck finished at Fri Jul 14 14:13:29 2006
> > > ###########
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > >
> > > /tmp/reiserfsck.log:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > > bad_internal: vpf-10320: block 23868569, items 91 and 92: The wrong
> > > order of items: [410810496 11321 0x16abca00 ??? (15)], [11312 11321
> > > 0x22f1c880 DIR (3)]
> >
> > such corruptions used to be considered as hardware bugs. Memory failure,
> > for instance. Did you ever run memtest on your systems?
> >
> > >  the problem in the internal node occured (23868569), whole subtree is
> > > skipped vpf-10640: The on-disk and the correct bitmaps differs.
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

=2D-=20
One of my most productive days was throwing away 1000 lines of code (Ken=20
Thompson)
=2D----------------
PGP fingerprint: AF69 62B4 97EB F5BB 2C60  B802 568A E122 BBBE 5820
PGP Key available at http://pgp.mit.edu
=2D----------------


--Boundary-01=_uDzvEvBca4+IuAy
Content-Type: text/plain;
  charset="iso-8859-1";
  name="reiserfsck_rebuildtree"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfsck_rebuildtree"

####### Pass 0 #######
24011 directory entries were hashed with "r5" hash.
####### Pass 1 #######
####### Pass 2 #######
####### Pass 3 #########
####### Pass 3a (lost+found pass) #########
rewrite_file: 3 items of file [14057 14933] moved to [14057 23960]

--Boundary-01=_uDzvEvBca4+IuAy--

--nextPart1934319.H5SD26WPj8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBEvzDxVorhIru+WCARAqSgAKCENDfTXJlOcraDD5JKE8ds+b2oSwCeOPKf
xwQN2Z5CAHuhOAln2RvhS84=
=mLkr
-----END PGP SIGNATURE-----

--nextPart1934319.H5SD26WPj8--
