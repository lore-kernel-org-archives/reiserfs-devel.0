From: "Robin H. Johnson" <robbat2@orbis-terrarum.net>
Subject: possible bug - fsck shows perfect results, linux refuses to mount
Date: Sun, 30 Mar 2003 23:22:50 -0800
Message-ID: <20030331072250.GC22731@cherenkov.orbis-terrarum.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Return-path: <reiserfs-list-return-13453-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings,

A server of mine suddenly started acting very wonky and spontaneously
rebooting. I've been pulling my hair out trying to narrow down what the
problem was.

Today after one of the reboots, it showed a lot of damage to several of
the data partitions (not the system ones luckily), so I ran fsck on them
to see about cleaning up. For two of them, /dev/hde[56], I only had to
get down to --rebuild-tree to fix them up. However for the last one,
/dev/hdb1, looks to be far worse.=20

The system refused to mount it originally, so I ran just plain
--fix-fixable. It showed nothing wrong at all. By a fluke of terminals,
I have a copy of this first output
[http://www.orbis-terrarum.net/~robbat2/reiserfs/hdb1.first].

However the system still refused to mount the drive, showing this in
syslog:
Mar 30 22:14:22 [kernel] read_super_block: can't find a reiserfs
filesystem on (dev 03:41, block 64, size 1024)
Mar 30 22:14:22 [kernel] read_super_block: can't find a reiserfs
filesystem on (dev 03:41, block 8, size 1024)

Mount showed this:
server1 kernel # mount /dev/hdb1
mount: wrong fs type, bad option, bad superblock on /dev/hdb1,
       or too many mounted file systems

This baffled me, so I decided it wouldn't hurt to run --rebuild-sb and
--rebuild-tree. For rebuild-sb, I don't have the full output, but I did
get: "Super block seems to be correct"

I ran rebuild-tree, and saw no errors.=20

The drive still refused to mount.

I dug in fsck.reiserfs --help, and saw '--scan-whole-partition'. Tried
--rebuild-tree with that on. It showed a LOT of stuff about StatDatas,
and completed successfully.

Still no joy in mounting it.

I repeated this, and still got a massive piles of errors
[http://www.orbis-terrarum.net/~robbat2/reiserfs/hdb1.later].

Kernel: 2.4.20-gentoo-r1 (Amongst the patches are: 3.5G-address-space,
rmap-14a, futuxes, imon, missing.list, preempt-ac, supermount, freeswan,
and lots of netfilter stuff)
however I don't see much at a glance that should affect things I think)
Hardware: Pentium III (Katmai) 500mhz CPU (replaced with identical known
good one in hardware testing). 512Mb PC133 SDRAM (replaced with identical k=
nown
good part).
Motherboard: Abit AH6 Rev 1.01 (was Rev 1.00 previously) [Intel 440bx].
reiserfsprogs: 3.6.4

I'm not exactly sure what had the partition open at the time, but I am
reasonably confidident that it was NFS.

The partition (~10GiB in size) hosts several dedicated game server
binaries and related files (NFS, exported readonly+async) to other
diskless machines that actually run the games.  (Logs are written to a
different NFS server).

I'm going to wipe the seemingly corrupt contents of the drive later this
week if I don't manage to fix it. But as with all data it would make
life as a SysAdmin so much easier if data just came back magically 8-).
(I think I've spent too much of the weekend playing AD&D).

I just find that there is something definetly wrong if fsck says the
partition is fine, but Linux refuses to mount it. Either this is a bug
in Linux, or the reiserfsprogs. Either way, somebody has a bug :-)

--=20
Robin Hugh Johnson
E-Mail     : robbat2@orbis-terrarum.net
Home Page  : http://www.orbis-terrarum.net/?l=3Dpeople.robbat2
ICQ#       : 30269588 or 41961639
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks

iD8DBQE+h+zKsnuUTjSIToURAqbyAKCYUBQmcci6zAIQWoApJ68u4sdYfwCgjLbF
TVzFS6++vPleQfx+injZtV8=
=du4m
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
