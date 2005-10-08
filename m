From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck --rebuild-tree fails with "out of space"
Date: Sat, 8 Oct 2005 12:25:31 +0400
Message-ID: <200510081225.32069.vitaly@namesys.com>
References: <43471111.1090106@atmos.washington.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26429-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43471111.1090106@atmos.washington.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: reiserfs-list@namesys.com
Cc: Harry Edmon <harry@atmos.washington.edu>

Hello

On Saturday 08 October 2005 04:21, Harry Edmon wrote:
> Today 04:21:37
>=20
>=20
> A disk I am trying to fix fails a "reiserfsck --rebuild-tree" with the=20
> message "out of space". =9AI have enclosed the log, and the output to the=
=20
> terminal. =9AThe system is running Debian "sarge" with all released=20
> patches. =9AKernel is 2.6.8. =9AReiserfsck is 3.6.19. =9ANo disk errors i=
n any=20
> log files.
>=20
>=20
>=20
> condense:~# reiserfsck --logfile /var/tmp/reiser.log --rebuild-tree /dev/=
hdg1
> reiserfsck 3.6.19 (2003 www.namesys.com)
>=20
> Will rebuild the filesystem (/dev/hdg1) tree
> Will put log info to '/var/tmp/reiser.log'
>=20
> Do you want to run this program?[N/Yes] (note need to type Yes if you do)=
:Yes
> Replaying journal..
> Reiserfs journal '/dev/hdg1' in blocks [18..8211]: 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Fri Oct =9A7 15:46:17 2005
> ###########
>=20
> Pass 0:
> Loading on-disk bitmap .. ok, 61048992 blocks marked used
> Skipping 10074 blocks (super block, journal, bitmaps) 61038918 blocks wil=
l be read
> 0%....20%....40%....60%.. =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A=
 =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9Alef =9A =9A =9A =9A=
 =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =
=9A =9A =9Aleft 0, 13223 /secccseccccc
> =9A =9A =9A =9A "r5" hash is selected
> Flushing..finished
> =9A =9A =9A =9A Read blocks (but not data blocks) 61038918
> =9A =9A =9A =9A =9A =9A =9A =9A Leaves among those 141109
> =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A - leaves all contents of =
which could not be saved and deleted 5
> =9A =9A =9A =9A =9A =9A =9A =9A Objectids found 414533
>=20
> Pass 1 (will try to insert 141104 leaves):
> Looking for allocable blocks .. finished
> 0%....20%....40%....60%....80%....Not enough allocable blocks,=20
> checking bitmap...there are 1 allocable blocks, btw=20

you need to get a larger partition, dd hdg1 there, run 'reiserfsck --rebuil=
d-sb'=20
on the copy to enlarge the fs size and after that run 'reiserfsck --rebuild=
-tree'=20
on it. or you can enlarge the existent hdg1.

Note: some disk space will be added to the current partition, if there was =
a=20
reiserfs before, that fs metadata will be mixed with the current fs. to avo=
id=20
it, zero the added disk space first (dd if=3D/dev/zero ...)

--=20
Vitaly
