From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: New Reiser4 snapshot slower?
Date: Fri, 26 Mar 2004 17:34:20 -0700
Message-ID: <1080347660.5515.15.camel@localhost.localdomain>
References: <1080334838.23552.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-zdXhJ7YusTqLi0qqq49U"
Return-path: <reiserfs-list-return-17518-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080334838.23552.2.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

--=-zdXhJ7YusTqLi0qqq49U
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-03-26 at 14:00, Jonathan Briggs wrote:
> This command:
> # dd if=3D/dev/zero of=3Dtestfile bs=3D4k count=3D256k
> seems to take longer than it did before.  The difference seems to be all
> system time.
>=20
> I will have to reboot to an old version later, to get accurate numbers.
>=20
> I don't have debugging turned on, so that's not it.  Has something
> changed that would have made this slower?

I have some numbers for the previous snapshot vs the current
snapshot.  It doesn't look like there was much of a difference really.=20
The real difference seems to be between a empty filesystem and one
that's been used as a home directory for several months.  That's where
my impression of slowness comes from: the last time I speed tested it,
my home directory was empty.

In /home:
With new R4 snapshot:
1 GB from /dev/zero into testfile
real: 38.301 s
system: 6.508 s
=20
With old snapshot:
1 GB
real: 33 s
sys: 6.9 s
=20
In fresh built R4 filesystem on loopback
Old snapshot
real: 24.2
system: 6.7
=20
New snapshot
real: 22.7
system: 6.5

I also booted the new snapshot with profile=3D2 and created a 1 GB
testfile in my home directory and sorted the output of readprofile.=20
Here are the interesting bits of that:
   132 handle_IRQ_event                           1.1786
    51 jnode_set_type                             1.5938
   175 clear_user                                 2.1875
  2311 protect_extent_nodes                       2.5340
  1060 do_softirq                                 6.6250
  1114 protect_reloc_node                        13.9250
  3503 __copy_from_user_ll                       27.3672
  8710 unprotect_extent_nodes                    45.3646
 12285 jlookup                                   54.8438
 33297 default_idle                             693.6875

--=20
Jonathan Briggs
jbriggs@esoft.com

--=-zdXhJ7YusTqLi0qqq49U
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAZMwMG8fHaOLTWwgRAr4EAJ96qlyVdSRsx8/eR+72d+XcMi4LcwCcDWs+
I4Rz1B9TspTeReGwBFmfJ4k=
=wNfg
-----END PGP SIGNATURE-----

--=-zdXhJ7YusTqLi0qqq49U--

