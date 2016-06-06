From: Jeff Mahoney <jeffm@suse.com>
Subject: reiserfsprogs v3.6.25
Date: Mon, 6 Jun 2016 14:23:53 -0400
Message-ID: <42434805-7b9f-bde1-e882-998f9f62676e@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="fDOOxgVLP0L7Xwi1WSJ9tuIpucvqAsFGQ"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fDOOxgVLP0L7Xwi1WSJ9tuIpucvqAsFGQ
Content-Type: multipart/mixed; boundary="9aN2ojoh72nL7f5vMNSMnXLexCLbNIeXe"
From: Jeff Mahoney <jeffm@suse.com>
To: reiserfs-devel@vger.kernel.org
Message-ID: <42434805-7b9f-bde1-e882-998f9f62676e@suse.com>
Subject: reiserfsprogs v3.6.25

--9aN2ojoh72nL7f5vMNSMnXLexCLbNIeXe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello all -

I've just released reiserfsprogs v3.6.25, which contains a rollup of
the commits that have accumulated since the last release.  The biggest
change is that libreiserfscore can now be used as a shared library for
use with other projects (e.g. btrfs-convert).

It is available now at:
https://www.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs/v3.6.2=
5/

The full changelog follows.

-Jeff

2016-06-06
        3.6.25 release.
        reiserfsprogs: use com_err in reiserfs_open
        reiserfscore: fix "new_insert_key may be used uninitialized..."
        reiserfsprogs: fix issues with inline functions
        man: Fixes a little glitch in the man page.
        manpages: escape dashes
        fsck: remove namesys.com reference in error text
        reiserfscore: constify struct pointer arguments
        reiserfscore: constify strings
        reiserfslib: add basic extended attribute helpers
        reiserfslib: add file data and directory iterators
        mkreiserfs: move block_size_ok out of reiserfscore
        debugreiserfs: fix incorrect memset size in unpack_stat_data
        reiserfsprogs: remove dead code
        debugreiserfs: fix use after free while closing log
        reiserfsprogs: add helpers for constant endian routines
        build: introduce shared libreiserfscore.so and export it
        reiserfsprogs: convert reiserfs_filsys_t from structure to pointe=
r-to-structure
        reiserfsprogs: annotate for endian safeness
        reiserfsprogs: fix remaining sparse warnings
        reiserfsprogs: Fix sparse "warning: Using plain integer as NULL p=
ointer"
        sparse: move bitops functions to include/misc.h
        reiserfscore: rename usearch_by_position to reiserfs_search_by_po=
sition
        reiserfscore: make reiserfs_open's filename argument const
        swab: protect le32_to_cpu and friends against being defined twice=

        reiserfs_fs.h: Eliminate overlays in offset_v2 helpers
        reiserfscore: move endian helpers for offset_v2 into header
        reiserfs_fs.h: Fix ifndef for multiple inclusion
        cleanup: remove unused argument to reiserfs_invalidate_buffer
        cleanup: remove dead code
        cleanup: remove unnecessary fs pointer passed with buffer_infos
        cleanup: factor out buffer_info initialization into helpers
        cleanup: rename key and item_head accessors to more friendly name=
s
        cleanup: remove trailing whitespace
        cleanup: run indent with the Linux Kernel style across all code
        cleanup: rename common structure names
--=20
Jeff Mahoney
SUSE Labs


--9aN2ojoh72nL7f5vMNSMnXLexCLbNIeXe--

--fDOOxgVLP0L7Xwi1WSJ9tuIpucvqAsFGQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJXVb+8AAoJEB57S2MheeWy+qkQAKNDJu9cPVkTnfn3gIDJdP88
/+3W0TFluipDBOmlSFCA6NYR6mGfLuA8++zWLFVQNpJ0Fsvy7K0jgCWWwJZaOxhh
oY2aFfim9unkfn9HrHyemaz5EifXkseZk91IZjwHD36zlN2AIssVT4uhxitCAAJa
XPnNxatIfLUI+YC0nPkxoAfGg9wahPoWzbB/qPlo87G+GNM2EsgYaGWwnE1qmTon
2Ra19NSwewoKDU5/9bckBOdQRUhS9HL37bFwxRnPsll8b7Ma7zK7T3dHPexwYPWm
56F8hvGZmnskmOvHIMFzNg0DE0PNeAA+bSgvAFyyv9KCqBtNCyQUC0+wAXwjk1Hc
ifLrdNOGKjvzT5TSvCg+MFI+kN0TlJgXLH68dNO7mUD8yO7Y0MrFFseBQEjWMIe4
SsWnTSVSQe5Z8y0F+htlrOcwcIdpemyUHXyCD5EHXOiknEFhEu31aJ1xo4xKzTvR
1/QA+RY5bkQ1wsvxKecQQPgeuEBwe7wvmI1vhcxWzwecmec0Y/2GMyKLPdKDz1aC
7McOnM84XK6ALuYne0leg4usw5rkW7lwJnKq/qgqT0qknNFWcJj8Jcg+zPauXjqU
21R1GFI1lHxHWcdw4/K+KdPzWD9sCbZMnREDuO9+ioERlCgs73vNBS+3P3AB1pWn
76tBmfHL8gLM6/ra1Nwv
=Ssfd
-----END PGP SIGNATURE-----

--fDOOxgVLP0L7Xwi1WSJ9tuIpucvqAsFGQ--
