From: Boyd Waters <bwaters+moz@nrao.edu>
Subject: Re: getting UUID and label of a filesystem
Date: Mon, 10 Nov 2003 10:22:49 -0700
Message-ID: <3FAFC969.4080401@nrao.edu>
References: <3FAAB330.5040503@nrao.edu> <20031106140747.Z10197@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16035-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031106140747.Z10197@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andreas Dilger wrote:

|>As non-root user?
|
|
| If you have a recent e2fsprogs (1.33+ I think), you can use "blkid" to
dump
| the UUID/LABEL of most filesystem types (including reiserfs, XFS, JFS,
ext*).
| If run as root it will create a cache of available block devices and
| their UUID/LABEL that non-root users can access even if they can't read
| the block device, so it doesn't need to be suid or anything.  You can also
| use it to locate specific devices by LABEL/UUID/TYPE from scripts, etc.

Great!

as non-root user:

$ /sbin/blkid /dev/loop5
/dev/loop5: LABEL="35" UUID="c9923c3f-da67-464f-ad55-6b4da22dabf0"\
TYPE="reiserfs"


So in a script:

#/bin/bash
FS_DEV=/dev/hda1
FS_UUID=`/sbin/blkid $FS_DEV | cut -d '"' -f4`


And this seems to work on non-reiser partitions, as well.
Nice, thanks!

~ - boyd


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE/r8lp0is8k1r0QeURAis3AJ9eX0nboz9sp+gDQOjKW6WatSntBgCgj1jm
UQKh+2tCqO5EdBLomleG8MA=
=dUTb
-----END PGP SIGNATURE-----

