From: Gerrit Hannaert <degerrit@web.de>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Thu, 15 Aug 2002 23:29:40 +0200
Message-ID: <200208152329.40707.degerrit@web.de>
References: <200208152007.42370.degerrit@web.de> <200208152036.35333.degerrit@web.de> <200208152253.40413.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11201-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200208152253.40413.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Hi again,

Well, I decided to give rebuild-tree a try now, since the trouble was not w=
ith=20
my binaries and I didn't know what else to do (maybe I should have waited).=
=20
Unfortunately, it went bad after 60% or so.

What is there left to do? Will rebuilding again help this time around?

=2D Gerrit


reiserfsck --rebuild-tree /dev/hda9=20

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.3
=2E..
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Thu Aug 15 23:00:03 2002
###########

Pass 0:
Loading on-disk bitmap .. ok, 12812325 blocks marked used
Skipping 8749 blocks (super block, journal, bitmaps) 12803576 blocks will b=
e=20
read
0%....20%....40%....60%..                               left 3639489, 9322=
=20
/sec
bread: Cannot read a block # 10146373.



####### Pass 0 #######
pass0: block 740209, item 3051935 2479726 0x1 DIR (3), len 168, location 26=
60=20
entry count 7, fsck need 0, format old: 5 entries were deleted of
pass0: vpf-10480: block 983630, item (61), wrong order of items object_id o=
f=20
4460761 4460887 0x1 DRCT (2) fixed to 4462153
pass0: vpf-10500: block 983630, item (61), wrong order of items dir_id of=20
4460761 4462153 0x1 DRCT (2) fixed to 4459536
pass0: vpf-10440: block 993396, item (44), wrong order of items dir_id of=20
4597406 4601527 0x0 SD (0) fixed to 4601502

=2D-

luna:/usr/src/reiserfsprogs-3.6.3 # reiserfsck /dev/hda9

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.3

Will read-only check consistency of the filesystem on /dev/hda9
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Thu Aug 15 23:24:57 2002
###########
Replaying journal..
0 transactions replayed
Checking S+tree..

Bad root block 4294967295. (--rebuild-tree did not complete)



Aborted

