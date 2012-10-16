From: Jeff Mahoney <jeffm@suse.com>
Subject: [ANNOUNCE] reiserfsprogs 3.6.22 released
Date: Tue, 16 Oct 2012 13:45:04 -0400
Message-ID: <507D9D20.4090207@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all -

I'm happy to announce the release of reiserfsprogs v3.6.22.

This is a minor maintenance release and contains the following changes
since v3.6.21:

- - Fix signedness issues for large file systems
- - fix use after free with fsck_progress
- - configure: use AC_MSG_NOTICE rather than `echo`
- - install standard {fsck,mkfs}.reiserfs symlinks

It is available via the kernel.org ftp site at:
http://ftp.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs/v3.6.22/

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.18 (Darwin)
Comment: GPGTools - http://gpgtools.org
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQIcBAEBAgAGBQJQfZ0gAAoJEB57S2MheeWywOcQALquhNlJcCFMXbIZ6BI8axiU
gadY2S8xbXVBu/3vaMj+QJzBGt60Y0nb8srlTxWN/o/1JdoK/28r99pTIGa8o0Ha
wFTQ9sTrejxK2GN2HKXDU4TmdGJ74mSUSlDnM9VwKwA8NCI8slfTY0N4/A3/dctA
wXPqX7A3GHw/p9YmuF7ElXRA8/Jj6dr2wEFiXft7TEUvEa1sDNytWjAGraLbMUsz
llJBm2l5lgSZ48bO9O1L2umNd49P4zB/Fb1KkDzHNiTc64r4gGBXBg1luFQ9j0Ep
QmwQwk4p/rNMcaZ8r4daErCG78BNG86l4KSyGsmT2IJJejQuifo0AK+OOjL2wkO7
8+xuAZ32mR2vhQZJZOQ36NvvGxM7glNrx/Ri3MITU8DhhLTp94Fgb//01RZBGQJ/
DUyAwFicTRPYk69QGhPw9+VMQdtzaTyOOqEHKIaHEVLuFpDuF4QEqTgQRH0T1mRJ
TEclNy1KGQPIWmubnVN3f02f4oD9nVvcXmDBgfwsWnq3xx4pe8r85HUG0A8Jlur0
Qqhm5qjJmSf7DFGVbWvw792iva8GKRA4zN7QQ1l6kyxyrxNHpGNL5StZjBcwqc6W
nLtWAUYoYii1Uu/eG++yynxPWsdycdE4+G/aagHomZMGSQX9HeyHmZ6IpkbXP4IG
afl7tl4hrJM7svzB5cct
=ZsW3
-----END PGP SIGNATURE-----
