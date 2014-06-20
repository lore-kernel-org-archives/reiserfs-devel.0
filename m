From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4progs: possible off-by-one in librepair/twig_scan.c?
Date: Fri, 20 Jun 2014 06:36:56 +0400
Message-ID: <1475191.W2aZRKbs49@intelfx-laptop>
References: <1559792.K1g2CRjlCX@intelfx-laptop> <53A37C52.5050006@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1650893.yujjTTTVtO"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=EXC8EH91f6QG4WcMq6OAkTnoe+SqqOMvuSDguV2Tg3c=;
        b=vS1FxyT4lPanhY+WXHxgG/+jJts09tsuM+jl/it6zzE4bTxDYGLD+gK4yxw/bBnoRs
         Bqmk3ECpe5iIQeVlDVorEvv7+75a8XHXJtukhMA3N5krdnOeHAHzXS8rgkISwNwnTU1p
         zFs9bXmUsgGZG089Iy6rP8Uu/Gobnl4CHwQR4FlGOCbSF06sDiau9TayMkIA+f3WZlTa
         rNH4m/+vCGT/kMKNyMklvfaE+oQ+xTECMCx09m5s8Ne4FmB1CkPq9tOSRYXSy4Cjzt2/
         tJUY715t85z1zm66PFmT+2jQeDx8Q13ltmPF9sY3QFXqsiVDn0bEOr+Z1K3wwMeShO8j
         hBFA==
In-Reply-To: <53A37C52.5050006@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart1650893.yujjTTTVtO
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Friday 20 June 2014 at 02:12:02, Edward Shishkin wrote:=09
>=20
> On 06/20/2014 01:18 AM, Ivan Shapovalov wrote:
> > I've got a strange fsck complaint while testing the rewritten disca=
rd.
> > The fsck log is here (not line-wrapped):
> >
> > =3D=3D=3D=3DLOG=3D=3D=3D=3D
> >
> > $ fsck.reiser4 /dev/disk/by-label/linux-build
> > *******************************************************************=

> > This is an EXPERIMENTAL version of fsck.reiser4. Read README first.=

> > *******************************************************************=

> >
> > Fscking the /dev/disk/by-label/linux-build block device.
> > Will check the consistency of the Reiser4 SuperBlock.
> > Will check the consistency of the Reiser4 FileSystem.
> > Continue?
> > (Yes/No): y
> > ***** fsck.reiser4 started at Fri Jun 20 02:49:22 2014
> > Reiser4 fs was detected on /dev/disk/by-label/linux-build.
> > Master super block (16):
> > magic:          ReIsEr4
> > blksize:        4096
> > format:         0x0 (format40)
> > uuid:           73831051-68e1-4848-b9ea-83f9703558b6
> > label:          linux-build
> >  =20
> > Format super block (17):
> > plugin:         format40
> > description:    Disk-format plugin.
> > version:        0
> > magic:          ReIsEr40FoRmAt
> > mkfs id:        0x143b8ccd
> > flushes:        0
> > blocks:         2621440
> > free blocks:    542951
> > root block:     69897
> > tail policy:    0x2 (smart)
> > next oid:       0x21c6d1
> > file count:     182200
> > tree height:    4
> > key policy:     LARGE
> >  =20
> >  =20
> > CHECKING THE STORAGE TREE
> >          Read nodes 239320
> >          Nodes left in the tree 239320
> >                  Leaves of them 236133, Twigs of them 3136
> >          Time interval: Fri Jun 20 02:49:22 2014 - Fri Jun 20 02:49=
:29 2014
> > CHECKING EXTENT REGIONS.
> > FSCK: extent40_repair.c: 96: extent40_check_layout: Node (2618486),=
 item (9), unit (10), [20d7ef:4(FB):766d6c696e757a:20da66:0]: points ou=
t of the fs, region [2621239..2621439].
> >          Read twigs 3136
> >          Invaid extent pointers 1
> >          Time interval: Fri Jun 20 02:49:29 2014 - Fri Jun 20 02:49=
:29 2014
> > CHECKING THE SEMANTIC TREE
> >          Found 189973 objects (some could be encountered more then =
once).
> >          Time interval: Fri Jun 20 02:49:29 2014 - Fri Jun 20 02:49=
:33 2014
> > FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and=
 really used block bitmap differ.
> > ***** fsck.reiser4 finished at Fri Jun 20 02:49:33 2014
> > Closing fs...done
> >
> > 1 fatal corruptions were detected in FileSystem. Run with --build-f=
s option to fix them.
> >
> > =3D=3D=3D=3DEND LOG=3D=3D=3D=3D
> >
> > This seems invalid to me: why a [2621239; 2621439] region would be =
invalid
> > in a filesystem with 2621440 blocks?
> > Also, the file in question is intact and does not appear to be corr=
upted,
> > because this is my current vmlinuz. :)
> >
> > The following patch against reiser4progs shows precise location of =
this check.
> >
> > diff --git a/librepair/twig_scan.c b/librepair/twig_scan.c
> > index 39b747c..ca8607a 100644
> > --- a/librepair/twig_scan.c
> > +++ b/librepair/twig_scan.c
> > @@ -19,7 +19,7 @@ static errno_t cb_item_region_check(blk_t start, =
uint64_t count, void *data) {
> >   =09/* This must be fixed at the first pass. */
> >   =09if (start >=3D ts->bm_met->total ||
> >   =09    count > ts->bm_met->total ||
> > -=09    start >=3D ts->bm_met->total - count)
> > +=09    start > ts->bm_met->total - count)
> >   =09{
> >   =09=09ts->stat.bad_unfm_ptrs++;
> >   =09=09return RE_FATAL;
>=20
> Sometimes our fsck is overly suspicious ;)
> Does this fix help, BTW?
> Thanks!

Yes, it does -- after applying the same filesystem is reported as OK.

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1650893.yujjTTTVtO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOjnk0ACgkQxUKljSIMAnC+egD9H7Ym5IU7ygnhlMhC95kmd7Ne
P84MFTpM6aolUnTD4+UA/AgC3lNdSEOi9SssqcFNQITVdQQOY/p1WYTI4tZvihd2
=2tzG
-----END PGP SIGNATURE-----

--nextPart1650893.yujjTTTVtO--

