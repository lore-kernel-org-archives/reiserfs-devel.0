From: "Lamont R. Peterson" <lamont@gurulabs.com>
Subject: Re: Bug report: slab error at module removal
Date: Sat, 14 Aug 2004 12:51:42 -0600
Message-ID: <1092509502.13269.5.camel@frontdesk.gurulabs.com>
References: <87pt5uibur.fsf@barad-dur.crans.org>
Reply-To: lamont@gurulabs.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-+zacC0q86HhsEL6Dj+sj"
Return-path: <reiserfs-list-return-20292-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87pt5uibur.fsf@barad-dur.crans.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-+zacC0q86HhsEL6Dj+sj
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-08-13 at 22:26, Mathieu Segaud wrote:
> I don't know if this is the right place, but I just saw a kernel message
> in my dmesg. =20
[SNIP]
> After several hours of running some moderatly high load stuff=20
> on each of them (big transfert of data, long repacker runs...).
> I decided to umount them and unload reiser4.ko module.
> dmesg gave this message:

I thought that building reiser4 as a module was still not ready.  Is
that true?

Is it safe to build and load as a module but does not remove cleanly
yet?  Is that the reason reiser4 as a kernel module was not ready?

> slab error in kmem_cache_destroy(): cache `plugin_set': Can't free all ob=
jects
>  [<c0135c41>] kmem_cache_destroy+0xd1/0x130
>  [<f99bf57a>] plugin_set_done+0xa/0x30 [reiser4]
>  [<f99b9194>] shutdown_reiser4+0xf4/0x210 [reiser4]
>  [<c012a004>] sys_delete_module+0x144/0x180
>  [<c013ea9e>] unmap_vma_list+0xe/0x20
>  [<c013edcf>] do_munmap+0xef/0x150
>  [<c0103afd>] sysenter_past_esp+0x52/0x71
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
> SLAB: cache with size 64 has lost its name
>=20
> The FSes are still consistent (fsck'ed with no --fix needed).
> Unfortunatly, I turned off debugging options to test latest snapshot
> performance. I can rebuild the module with debugging options on,
> and try to give you a more accurate report to help find the memory leak.
>=20
> Regards,
--=20
Lamont R. Peterson <lamont@gurulabs.com>
Senior Instructor
Guru Labs http://www.gurulabs.com/

--=-+zacC0q86HhsEL6Dj+sj
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBHl89RK8Q4zt1QRURAlm3AKC07iWIwtRTevEocp08+nQ+FHvYGwCeNcTi
ZGU4egJel8L+joDB3cQ1prc=
=LI2o
-----END PGP SIGNATURE-----

--=-+zacC0q86HhsEL6Dj+sj--

