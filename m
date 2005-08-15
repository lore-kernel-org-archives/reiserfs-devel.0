From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Strange problems/bugs with reiserfs and reiserfschk
Date: Mon, 15 Aug 2005 17:20:09 +0400
Message-ID: <200508151720.09411.vitaly@namesys.com>
References: <42F684EE.7010201@muenning.com> <b14e81f0050807152830555213@mail.gmail.com> <42FDE93B.30807@muenning.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25476-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FDE93B.30807@muenning.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Konstantin =?iso-8859-1?q?M=FCnning?= <konstantin@muenning.com>

On Saturday 13 August 2005 16:36, Konstantin M=FCnning wrote:
> Hi Everyone.
>=20
> OK, there seems definitely to be some kind of bug in reiserfsck 3.6.19.
> Or is it a feature? ;-)
>=20
> I tried once again with reiserfsck --rebuild-tree to repair the FS and
> here it is again. About the end of pass 2 (about 20h after starting)
> counting stopped at "left 32022, 500 /sec" but there was heavy acccess
> of the drive. After about an hour reiserfsck started consuming 100% CPU
> and is doning some minimal access to the drive (the drive light blinks
> every second or so, SCSI reports about 40 commands for each of these
> accesses).
>=20
> What could be causing this? Is the drive too large for reiserfsck? I
> wouldn't believe that 0,6TB are but it is consuming at least quite a lot
> of memory:
>=20
>   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
> 15185 root      39  19 76304  51m  688 R 99.9 10.3   4591:30 reiserfsck
>=20
> I have left it like this the last 3 days just to make sure that it's not
> my lack of patience. But now still... So any advices? How to find out
> what is causing reiserfsck to hang? Or would I have to build a debug
> version and check for myself?

if some file item offsets are corrupted, fsck can work for too long on=20
pass2. or it also can be a bug. I will send you a version of reiserfsprogs =

that has an optimization fix for former. if it fails email me and provide=20
the metadata please:
	debugreiserfs -p <device> | bzip2 -c > <device>.bz2

> The drive itself is working, I checked several times, the server is
> working all the time as well. Here some reiserfs output it it helps
> somebody to have an idea:
>=20
> (***snip***)
> block 125371211: The number of items (1) is incorrect, should be (0) -
> corrected
> block 125371211: The free space (0) is incorrect, should be (4072) -
> corrected
> block 125506454: The number of items (1) is incorrect, should be (0) -
> corrected
> block 125506454: The free space (0) is incorrect, should be (4072) -
> corrected
> pass0: vpf-10160: block 129485584: item 2: No "." entry found in the
> first item
> of a directory
> pass0: vpf-10160: block 129485584: item 4: No "." entry found in the
> first item
> of a directory
> pass0: vpf-10160: block 133169584: item 14: No "." entry found in the
> first item
>  of a directory
> pass0: vpf-10160: block 133169648: item 25: No "." entry found in the
> first item
>  of a directory
> pass0: vpf-10160: block 133170064: item 10: No "." entry found in the
> first item
>  of a directory
> pass0: vpf-10160: block 134316400: item 18: No "." entry found in the
> first item
>  of a directory
> pass0: vpf-10560: block 145031172, item 7: Wrong order of items - change
> the obj
> ect_id of the key [2237738 2237741 0x1 DRCT (2)] to 2237740
> pass0: vpf-10160: block 145817616: item 1: No "." entry found in the
> first item
> of a directory
>                                                           left 0, 2623 /s=
ec
> 914346 directory entries were hashed with "r5" hash.
>         "r5" hash is selected
> Flushing..finished
>         Read blocks (but not data blocks) 94209553
>                 Leaves among those 3522616
>                         - corrected leaves 319
>                         - leaves all contents of which could not be
> saved and de
> leted 15
>                 pointers in indirect items to wrong area 24 (zeroed)
>                 Objectids found 984719
>=20
> Pass 1 (will try to insert 3522601 leaves):
> ####### Pass 1 #######
> Looking for allocable blocks .. finished
> 0%....20%....40%....is_leaf_bad: block 35452246, item 25: The corrupted
> item fou
> nd (878203 878203 0x0 SD (0), len 44, location 3056 entry count 65535,
> fsck need
>  1, format new)
> is_leaf_bad: block 35452246, item 26: The corrupted item found (878203
> 878203 0x
> 1 DRCT (2), len 1464, location 1592 entry count 65535, fsck need 1,
> format new)
> is_leaf_bad: WARNING: The leaf (35452246) is formatted badly. Will be
> handled on
>  the the pass2.
> 60%....80%....100%                         left 0, 701 /sec
> Flushing..finished
>         3522601 leaves read
>                 3489821 inserted
>                 32780 not inserted
>         non-unique pointers in indirect items (zeroed) 656
> ####### Pass 2 #######
>=20
> Pass 2:
> 0%....20%....40%..rewrite_file: 2 items of file [2340286 2340312] moved
> to [2340
> 286 16]
> vpf-10260: The file we are inserting the new item (432679 432760 0xf001
> IND (1),
>  len 160, location 3936 entry count 0, fsck need 1, format new) into has
> no Stat
> Data, insertion was skipped
> vpf-10260: The file we are inserting the new item (432679 432828 0x2a001
> IND (1)
> , len 132, location 3964 entry count 0, fsck need 1, format new) into
> has no Sta
> tData, insertion was skipped
> (***snip***)
> vpf-10260: The file we are inserting the new item (526132 526780 0x1 IND
> (1), len 8, location 4088 entry count 0, fsck need 1, format new) into
> has no StatData, insertion was skipped
> vpf-10260: The file we are inserting the new item (557044 557073 0x1 IND
> (1), len 4, location 4092 entry count 0, fsck need 3, format new) into
> has no StatData, insertion was skipped
> vpf-10260: The file we are inserting the new item (558483 558492 0x20001
> IND (1), len 96, location 4000 entry count 0, fsck need 1, format new)
> into has no StatData, insertion was skipped
> vpf-10260: The file we are inserting the new item (759159 759160 0x1 IND
> (1), len 3208, location 888 entry count 0, fsck need 1, format new) into
> has no StatData, insertion was skipped
>                                          left 32022, 500 /sec
>=20
>=20
>=20

--=20
Thanks,
Vitaly Fertman
