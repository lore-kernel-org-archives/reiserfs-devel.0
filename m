From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Sat, 11 May 2013 15:03:37 +0000 (UTC)
Message-ID: <20130511150337.E3DD711FA6B@bugzilla.kernel.org>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D29162





--- Comment #45 from Ra=C3=BAl <rasasi78@gmail.com>  2013-05-11 15:03:3=
6 ---
Hi:

I've run into a series of locks of this kind. I can't add much more to =
what
I've already reported. I haven't found a method of reliably reproduce t=
his
lock, my impression so far is that this one is related to:
a) wake up from suspend to ram (maybe also to disk) and=20
b) certain /corruption/ layout in disk

Latest locks happened after I resume from ram. Disk was not much loaded=
 at the
lock moment, there was a high user activity though: like running and cl=
osing
apps, email and an important amount of download threads in the backgrou=
nd. I
had the lock there.

As usual, the cleanest way to get out of this was alt-sysrq-E that term=
s all
processes. Then three finger salute.

On a fresh boot, I tried the same usage pattern, soon after I had the l=
ock
again. In this case STR or STD (Suspend to Disk) weren't involved.

I decided to go into a reiserfsck --rebuild-tree in my home partition. =
This is
a log excerpt:
"""
Replaying journal: Done.
Reiserfs journal '/dev/mapper/portaka-home' in blocks [18..8211]: 0
transactions replayed
###########
reiserfsck --rebuild-tree started at Fri May 10 11:04:30 2013
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 43532529 blocks marked used
Skipping 9574 blocks (super block, journal, bitmaps) 43522955 blocks wi=
ll be
read
0%...block 6328224: The number of items (34381) is incorrect, should be=
 (1) -
corrected
block 6328224: The free space (15751) is incorrect, should be (2256) -
corrected
pass0: vpf-10110: block 6328224, item (0): Unknown item type found [213=
0706432
1023807744 0x3d970000 ??? (13)] - deleted
block 6343857: The number of items (34381) is incorrect, should be (1) =
-
corrected
block 6343857: The free space (15751) is incorrect, should be (2256) -
corrected
pass0: vpf-10110: block 6343857, item (0): Unknown item type found [213=
0706432
1023807744 0x3d970000 ??? (13)] - deleted
=2E20%...block 15040910: The number of items (34826) is incorrect, shou=
ld be (1)
- corrected
block 15040910: The free space (2) is incorrect, should be (4048) - cor=
rected
pass0: vpf-10110: block 15040910, item (0): Unknown item type found [35=
06543104
3523215796 0xa3000784 ??? (15)] - deleted
=2Eblock 16215906: The number of items (287) is incorrect, should be (1=
) -
corrected
block 16215906: The free space (0) is incorrect, should be (4048) - cor=
rected
pass0: vpf-10200: block 16215906, item 0: The item [218104576 203714 0x=
790e01
IND (1)] with wrong offset is deleted
block 17156098: The number of items (12648) is incorrect, should be (1)=
 -
corrected
block 17156098: The free space (0) is incorrect, should be (4048) - cor=
rected
40%block 18917377: The number of items (6) is incorrect, should be (0) =
-
corrected
block 18917377: The free space (15481) is incorrect, should be (4072) -
corrected
block 19611181: The number of items (6) is incorrect, should be (0) - c=
orrected
block 19611181: The free space (15481) is incorrect, should be (4072) -
corrected
=2Eblock 20333852: The number of items (15) is incorrect, should be (1)=
 -
corrected
block 20333852: The free space (0) is incorrect, should be (3792) - cor=
rected
pass0: vpf-10210: block 20333852, item 0: The item with wrong offset or=
 length
found [4608 16778752 0x63030000 DRCT (2)], len 256 - deleted
=2E.block 25257511: The number of items (287) is incorrect, should be (=
1) -
corrected
block 25257511: The free space (29793) is incorrect, should be (4048) -
corrected
pass0: vpf-10200: block 25257511, item 0: The item [218103998 65810 0x6=
e0e01
IND (1)] with wrong offset is deleted
=2E60%block 28012850: The number of items (41488) is incorrect, should =
be (1) -
corrected
block 28012850: The free space (24) is incorrect, should be (4048) - co=
rrected
pass0: vpf-10110: block 28012850, item (0): Unknown item type found [38=
049792
1032720128 0x10010002 ??? (15)] - deleted
=2Eblock 30356195: The number of items (282) is incorrect, should be (1=
) -
corrected
block 30356195: The free space (0) is incorrect, should be (2256) - cor=
rected
pass0: vpf-10110: block 30356195, item (0): Unknown item type found [20=
5917185
285212679 0x1 ??? (15)] - deleted
=2Eblock 30911284: The number of items (12648) is incorrect, should be =
(1) -
corrected
block 30911284: The free space (0) is incorrect, should be (4048) - cor=
rected
block 31013511: The number of items (6) is incorrect, should be (0) - c=
orrected
block 31013511: The free space (1472) is incorrect, should be (4072) -
corrected
block 31038991: The number of items (6) is incorrect, should be (0) - c=
orrected
block 31038991: The free space (1472) is incorrect, should be (4072) -
corrected
=2Eblock 33620308: The number of items (15) is incorrect, should be (1)=
 -
corrected
block 33620308: The free space (0) is incorrect, should be (3792) - cor=
rected
pass0: vpf-10210: block 33620308, item 0: The item with wrong offset or=
 length
found [4608 16778752 0x63030000 DRCT (2)], len 256 - deleted
=2Eblock 34356027: The number of items (282) is incorrect, should be (1=
) -
corrected
block 34356027: The free space (0) is incorrect, should be (2256) - cor=
rected
pass0: vpf-10110: block 34356027, item (0): Unknown item type found [20=
5917185
285212679 0x1 ??? (15)] - deleted
block 34621658: The number of items (4352) is incorrect, should be (1) =
-
corrected
block 34621658: The free space (39937) is incorrect, should be (207) -
corrected
pass0: vpf-10110: block 34621658, item (0): Unknown item type found [21=
8169345
114 0x1180001 ??? (15)] - deleted
"""

I wonder if those "Unknown item type found" or several of those poiting=
 to same
block, e.g.: 205917185 mean anything or could trigger the unexpected lo=
ck.

HTH,

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
