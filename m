From: Francisco Javier Cabello <fjcabello@visual-tools.com>
Subject: Re: data corruption with 2.4.25 and datalogging patches
Date: Wed, 19 Jul 2006 14:33:14 +0200
Message-ID: <200607191433.18082.fjcabello@visual-tools.com>
References: <200607120816.11292.fjcabello@visual-tools.com> <200607141420.36656.fjcabello@visual-tools.com> <1152881975.6407.58.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2664698.VvNIU5I0BN";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29070-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1152881975.6407.58.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--nextPart2664698.VvNIU5I0BN
Content-Type: multipart/mixed;
  boundary="Boundary-01=_LaivEmaHboK3PLe"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_LaivEmaHboK3PLe
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,
I think It's not a memory problem. I have run memtest for more than 24 hour=
s=20
and the memory is OK.=20
We use the best memory in the market (Kingston). When a system=20
fails we check hardware devices first. If we find a hardware problem we=20
usually don't check for software problem.=20

I have other system with reiserfs corruption. I send you attached reisefsck=
=20
output for  'reiserfsck --check' and 'reiserfsck --check --fix-fixable'

Regards,

Paco




On Friday, 14 de July de 2006 14:59, Vladimir V. Saveliev wrote:
> Hello
>
> On Fri, 2006-07-14 at 14:20 +0200, Francisco Javier Cabello wrote:
> > Hello Vladimir,
> >
> > # reiserfsck -l /tmp/reiserfsck.log -y --check /dev/hdc1
> >
> > Standard output:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > Will read-only check consistency of the filesystem on /dev/hdc1
> > Will put log info to '/tmp/reiserfsck.log'
> > ###########
> > reiserfsck --check started at Fri Jul 14 14:09:33 2006
> > ###########
> > Replaying journal..
> > Reiserfs journal '/dev/hdc1' in blocks [18..8211]: 0 transactions
> > replayed Checking internal tree..finished
> > Comparing bitmaps..Bad nodes were found, Semantic pass skipped
> > 1 found corruptions can be fixed only when running with --rebuild-tree
> > ###########
> > reiserfsck finished at Fri Jul 14 14:13:29 2006
> > ###########
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >
> > /tmp/reiserfsck.log:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > bad_internal: vpf-10320: block 23868569, items 91 and 92: The wrong ord=
er
> > of items: [410810496 11321 0x16abca00 ??? (15)], [11312 11321 0x22f1c880
> > DIR (3)]
>
> such corruptions used to be considered as hardware bugs. Memory failure,
> for instance. Did you ever run memtest on your systems?
>
> >  the problem in the internal node occured (23868569), whole subtree is
> > skipped vpf-10640: The on-disk and the correct bitmaps differs.
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

=2D-=20
One of my most productive days was throwing away 1000 lines of code (Ken=20
Thompson)
=2D----------------
PGP fingerprint: AF69 62B4 97EB F5BB 2C60  B802 568A E122 BBBE 5820
PGP Key available at http://pgp.mit.edu
=2D----------------



--Boundary-01=_LaivEmaHboK3PLe
Content-Type: text/plain;
  charset="iso-8859-1";
  name="reiserfsck_check_with_fixfixable"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfsck_check_with_fixfixable"

bad_stat_data: The objectid (14933) is shared by at least two files. Can be fixed with --rebuild-tree only.
vpf-10630: The on-disk and the correct bitmaps differs. Will be fixed later.
vpf-10650: The directory [14056 14057] has the wrong size in the StatData (16320) - corrected to (16248)
check_semantic_pass: Name "C04_060228T175015298+000-175337903+000_0000240_792.mpeg" in directory [14056 14063] points to nowhere
 - removed
check_semantic_pass: Name "C04_060228T173711821+000-174033786+000_0000240_773.mpeg" in directory [14056 14063] points to nowhere
 - removed
check_semantic_pass: Name "C04_060228T173404188+000-173711581+000_0000240_758.mpeg" in directory [14056 14063] points to nowhere
 - removed
check_semantic_pass: Name "C04_060228T174034066+000-174357422+000_0000240_782.mpeg" in directory [14056 14063] points to nowhere
 - removed
check_semantic_pass: Name "C04_060228T174357662+000-174701364+000_0000240_762.mpeg" in directory [14056 14063] points to nowhere
 - removed
check_semantic_pass: Name "C04_060228T174701604+000-175015018+000_0000240_773.mpeg" in directory [14056 14063] points to nowhere
 - removed
vpf-10650: The directory [14056 14063] has the wrong size in the StatData (7104) - corrected to (6672)

--Boundary-01=_LaivEmaHboK3PLe
Content-Type: text/plain;
  charset="iso-8859-1";
  name="reiserfsck_check_without_fixfixable"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfsck_check_without_fixfixable"

bad_stat_data: The objectid (14933) is shared by at least two files. Can be fixed with --rebuild-tree only.
vpf-10640: The on-disk and the correct bitmaps differs.
vpf-10650: The directory [14056 14057] has the wrong size in the StatData (16320), should be (16248)
check_semantic_pass: Name "C04_060228T175015298+000-175337903+000_0000240_792.mpeg" in directory [14056 14063] points to nowhere

check_semantic_pass: Name "C04_060228T173711821+000-174033786+000_0000240_773.mpeg" in directory [14056 14063] points to nowhere

check_semantic_pass: Name "C04_060228T173404188+000-173711581+000_0000240_758.mpeg" in directory [14056 14063] points to nowhere

check_semantic_pass: Name "C04_060228T174034066+000-174357422+000_0000240_782.mpeg" in directory [14056 14063] points to nowhere

check_semantic_pass: Name "C04_060228T174357662+000-174701364+000_0000240_762.mpeg" in directory [14056 14063] points to nowhere

check_semantic_pass: Name "C04_060228T174701604+000-175015018+000_0000240_773.mpeg" in directory [14056 14063] points to nowhere

vpf-10650: The directory [14056 14063] has the wrong size in the StatData (7104), should be (6672)

--Boundary-01=_LaivEmaHboK3PLe--

--nextPart2664698.VvNIU5I0BN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBEviaOVorhIru+WCARAsuDAJsG6HIbG2ezl00AJ9Wio1CbXS1WWwCcC9us
HDzroRKYq0BRRVumNjwCPfc=
=ZNKu
-----END PGP SIGNATURE-----

--nextPart2664698.VvNIU5I0BN--
