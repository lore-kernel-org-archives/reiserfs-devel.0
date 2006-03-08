From: "zotyalpb" <zotyalpb@freemail.hu>
Subject: Re: crash / kernel 2.6.15.3 / reiserfs 3.6 (bugreport)
Date: Wed, 8 Mar 2006 03:44:21 +0100
Message-ID: <02ac01c6425a$3451be20$0301a8c0@foobar>
References: <123901c63fd3$280cba90$0301a8c0@foobar> <200603061445.04987.vitaly@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_02A9_01C64262.95E68AA0"
Return-path: <reiserfs-list-return-28232-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_02A9_01C64262.95E68AA0
Content-Type: text/plain;
	format=flowed;
	charset="koi8-r";
	reply-type=original
Content-Transfer-Encoding: 7bit

>> I have an amd64 box with debian/sarge.
>> it has two reiserfs, one for the root (sda1 - 36G), and one for home 
>> (md0 -
>> 500G / raid10).
>>
>> Since a week it randomly crashes. I got reiserfs panic in the syslog, and
>> the md0 is not responding, but the sda is working fine.
>> I have to reboot to make it working again.
>
> would you run reiserfsck on md0 please?
> it looks like an fs corruption.
>

it found lots of errors, output is attached

i hope it will be fine

thanks
zotyalpb

------=_NextPart_000_02A9_01C64262.95E68AA0
Content-Type: text/plain;
	format=flowed;
	name="reiserfsck-out.txt";
	reply-type=original
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="reiserfsck-out.txt"

root@free:~# reiserfsck /dev/md0
reiserfsck 3.6.19 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will read-only check consistency of the filesystem on /dev/md0
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you =
do):Yes
###########
reiserfsck --check started at Wed Mar  8 02:33:14 2006
###########
Replaying journal..
Trans replayed: mountid 33, transid 385964, desc 142, len 3, commit 146, =
next trans offset 129
Trans replayed: mountid 33, transid 385965, desc 147, len 10, commit =
158, next trans offset 141
Trans replayed: mountid 33, transid 385966, desc 159, len 2, commit 162, =
next trans offset 145
Trans replayed: mountid 33, transid 385967, desc 163, len 12, commit =
176, next trans offset 159
Trans replayed: mountid 33, transid 385968, desc 177, len 45, commit =
223, next trans offset 206
Reiserfs journal '/dev/md0' in blocks [18..8211]: 5 transactions =
replayed
Checking internal tree../  1 (of   5)/ 36 (of 128)/ 70 (of =
139)bad_directory_item: block 77169375: The directory item [10022 486654 =
0x25d63900 DIR (3)] has a broken entry (78)
bad_leaf: block 77169375, item 0: The corrupted item found (10022 486654 =
0x25d63900 DIR (3), len 4048, location 48 entry count 127, fsck need 0, =
format old)
/  3 (of   5)/ 74 (of 170)/  8 (of 152)bad_indirect_item: block =
87921962: The item (486654 816346 0x1 IND (1), len 172, location 1308 =
entry count 0, fsck need 0, format new) has the bad pointer (7) to the =
block (87856902), which is in tree already
finished                              =20
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps =
differs.
Fatal corruptions were found, Semantic pass skipped
1 found corruptions can be fixed only when running with --rebuild-tree
###########
reiserfsck finished at Wed Mar  8 02:41:27 2006

root@free:~# reiserfsck --rebuild-tree /dev/md0
reiserfsck 3.6.19 (2003 www.namesys.com)

*************************************************************
** Do not  run  the  program  with  --rebuild-tree  unless **
** something is broken and MAKE A BACKUP  before using it. **
** If you have bad sectors on a drive  it is usually a bad **
** idea to continue using it. Then you probably should get **
** a working hard drive, copy the file system from the bad **
** drive  to the good one -- dd_rescue is  a good tool for **
** that -- and only then run this program.                 **
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will rebuild the filesystem (/dev/md0) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you =
do):Yes
Replaying journal..
Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions =
replayed
###########
reiserfsck --rebuild-tree started at Wed Mar  8 02:43:08 2006
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 36775934 blocks marked used
Skipping 11937 blocks (super block, journal, bitmaps) 36763997 blocks =
will be read
0%.block 18660120: The number of items (512) is incorrect, should be (1) =
- corrected
block 18660120: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 18660120, item (0): Unknown item type found =
[67108864 4194304 0x80 ??? (15)] - deleted
...20%block 40799859: The number of items (2560) is incorrect, should be =
(1) - corrected
block 40799859: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 40799859, item (0): Unknown item type found =
[134217792 2147485696 0x1 ??? (15)] - deleted
block 40818728: The number of items (2560) is incorrect, should be (1) - =
corrected
block 40818728: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 40818728, item (0): Unknown item type found =
[134217792 2147485696 0x1 ??? (15)] - deleted
block 40862627: The number of items (512) is incorrect, should be (1) - =
corrected
block 40862627: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 40862627, item (0): Unknown item type found =
[67108864 4194304 0x80 ??? (15)] - deleted
block 40881950: The number of items (512) is incorrect, should be (1) - =
corrected
block 40881950: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 40881950, item (0): Unknown item type found =
[67108864 4194304 0x80 ??? (15)] - deleted
block 41294447: The number of items (544) is incorrect, should be (1) - =
corrected
block 41294447: The free space (41) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 41294447, item (0): Unknown item type found [0 =
32768 0x0 ??? (15)] - deleted
block 41314448: The number of items (544) is incorrect, should be (1) - =
corrected
block 41314448: The free space (41) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 41314448, item (0): Unknown item type found [0 =
32768 0x0 ??? (15)] - deleted
.block 41689644: The number of items (512) is incorrect, should be (1) - =
corrected
block 41689644: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 41689644, item (0): Unknown item type found [0 =
4194304 0x80 ??? (15)] - deleted
block 41689645: The number of items (544) is incorrect, should be (1) - =
corrected
block 41689645: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 41689645, item (0): Unknown item type found [0 =
4194304 0x8000080 ??? (15)] - deleted
block 41709875: The number of items (512) is incorrect, should be (1) - =
corrected
block 41709875: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 41709875, item (0): Unknown item type found [0 =
4194304 0x80 ??? (15)] - deleted
block 41709876: The number of items (544) is incorrect, should be (1) - =
corrected
block 41709876: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 41709876, item (0): Unknown item type found [0 =
4194304 0x8000080 ??? (15)] - deleted
block 42291280: The number of items (2560) is incorrect, should be (1) - =
corrected
block 42291280: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 42291280, item (0): Unknown item type found =
[134217792 2147485696 0x1 ??? (15)] - deleted
block 42304296: The number of items (512) is incorrect, should be (1) - =
corrected
block 42304296: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 42304296, item (0): Unknown item type found =
[67108864 4194304 0x80 ??? (15)] - deleted
block 42314789: The number of items (2560) is incorrect, should be (1) - =
corrected
block 42314789: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 42314789, item (0): Unknown item type found =
[134217792 2147485696 0x1 ??? (15)] - deleted
block 42324263: The number of items (512) is incorrect, should be (1) - =
corrected
block 42324263: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 42324263, item (0): Unknown item type found =
[67108864 4194304 0x80 ??? (15)] - deleted
block 43147417: The number of items (512) is incorrect, should be (1) - =
corrected
block 43147417: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 43147417, item (0): Unknown item type found [0 =
4194304 0x80 ??? (15)] - deleted
block 43147418: The number of items (544) is incorrect, should be (1) - =
corrected
block 43147418: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 43147418, item (0): Unknown item type found [0 =
4194304 0x8000080 ??? (15)] - deleted
block 43171009: The number of items (512) is incorrect, should be (1) - =
corrected
block 43171009: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 43171009, item (0): Unknown item type found [0 =
4194304 0x80 ??? (15)] - deleted
block 43171010: The number of items (544) is incorrect, should be (1) - =
corrected
block 43171010: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 43171010, item (0): Unknown item type found [0 =
4194304 0x8000080 ??? (15)] - deleted
block 43256195: The number of items (544) is incorrect, should be (1) - =
corrected
block 43256195: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 43256195, item (0): Unknown item type found =
[67108864 4227072 0x80 ??? (15)] - deleted
block 43276067: The number of items (544) is incorrect, should be (1) - =
corrected
block 43276067: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 43276067, item (0): Unknown item type found =
[67108864 4227072 0x80 ??? (15)] - deleted
.block 43655245: The number of items (512) is incorrect, should be (1) - =
corrected
block 43655245: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10150: block 43655245: item 0: Wrong key [0 0 0x0 SD (0)], =
deleted
block 43675539: The number of items (512) is incorrect, should be (1) - =
corrected
block 43675539: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10150: block 43675539: item 0: Wrong key [0 0 0x0 SD (0)], =
deleted
block 43803577: The number of items (2560) is incorrect, should be (1) - =
corrected
block 43803577: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 43803577, item (0): Unknown item type found =
[134217792 2147485696 0x1 ??? (15)] - deleted
block 43827080: The number of items (2560) is incorrect, should be (1) - =
corrected
block 43827080: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 43827080, item (0): Unknown item type found =
[134217792 2147485696 0x1 ??? (15)] - deleted
block 43868910: The number of items (512) is incorrect, should be (1) - =
corrected
block 43868910: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 43868910, item (0): Unknown item type found [0 =
4194304 0x80 ??? (15)] - deleted
block 43868911: The number of items (544) is incorrect, should be (1) - =
corrected
block 43868911: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 43868911, item (0): Unknown item type found [0 =
4194304 0x8000080 ??? (15)] - deleted
block 43892666: The number of items (512) is incorrect, should be (1) - =
corrected
block 43892666: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 43892666, item (0): Unknown item type found [0 =
4194304 0x80 ??? (15)] - deleted
block 43892667: The number of items (544) is incorrect, should be (1) - =
corrected
block 43892667: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 43892667, item (0): Unknown item type found [0 =
4194304 0x8000080 ??? (15)] - deleted
verify_directory_item: block 77169375, item 10022 486654 0x25d63900 DIR =
(3), len 4048, location 48 entry count 127, fsck need 0, format old: =
Found a name "530437_big.jpg" for 79-th entry matching to the hash =
634981888.
..block 81749820: The number of items (512) is incorrect, should be (1) =
- corrected
block 81749820: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 81749820, item (0): Unknown item type found [0 =
4194304 0x80 ??? (15)] - deleted
block 81749821: The number of items (544) is incorrect, should be (1) - =
corrected
block 81749821: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 81749821, item (0): Unknown item type found [0 =
4194304 0x8000080 ??? (15)] - deleted
block 81877800: The number of items (512) is incorrect, should be (1) - =
corrected
block 81877800: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 81877800, item (0): Unknown item type found [0 =
4194304 0x80 ??? (15)] - deleted
block 81877801: The number of items (544) is incorrect, should be (1) - =
corrected
block 81877801: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 81877801, item (0): Unknown item type found [0 =
4194304 0x8000080 ??? (15)] - deleted
block 81945342: The number of items (512) is incorrect, should be (1) - =
corrected
block 81945342: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 81945342, item (0): Unknown item type found [0 =
4194304 0x80 ??? (15)] - deleted
block 81945343: The number of items (544) is incorrect, should be (1) - =
corrected
block 81945343: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 81945343, item (0): Unknown item type found [0 =
4194304 0x8000080 ??? (15)] - deleted
block 82012799: The number of items (512) is incorrect, should be (1) - =
corrected
block 82012799: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 82012799, item (0): Unknown item type found =
[67108864 4194304 0x80 ??? (15)] - deleted
40%block 82156109: The number of items (512) is incorrect, should be (1) =
- corrected
block 82156109: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 82156109, item (0): Unknown item type found =
[67108864 4194304 0x80 ??? (15)] - deleted
block 82602442: The number of items (512) is incorrect, should be (1) - =
corrected
block 82602442: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10150: block 82602442: item 0: Wrong key [0 0 0x0 SD (0)], =
deleted
block 82610803: The number of items (512) is incorrect, should be (1) - =
corrected
block 82610803: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10150: block 82610803: item 0: Wrong key [0 0 0x0 SD (0)], =
deleted
block 83009580: The number of items (2560) is incorrect, should be (1) - =
corrected
block 83009580: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 83009580, item (0): Unknown item type found =
[134217792 2147485696 0x1 ??? (15)] - deleted
.block 83876047: The number of items (512) is incorrect, should be (1) - =
corrected
block 83876047: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 83876047, item (0): Unknown item type found =
[67108864 4194304 0x80 ??? (15)] - deleted
block 84236594: The number of items (544) is incorrect, should be (1) - =
corrected
block 84236594: The free space (41) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 84236594, item (0): Unknown item type found [0 =
32768 0x0 ??? (15)] - deleted
..block 88345180: The number of items (544) is incorrect, should be (1) =
- corrected
block 88345180: The free space (41) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 88345180, item (0): Unknown item type found [0 =
32768 0x0 ??? (15)] - deleted
.block 88752171: The number of items (512) is incorrect, should be (1) - =
corrected
block 88752171: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 88752171, item (0): Unknown item type found [0 =
4194304 0x80 ??? (15)] - deleted
block 88752172: The number of items (544) is incorrect, should be (1) - =
corrected
block 88752172: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 88752172, item (0): Unknown item type found [0 =
4194304 0x8000080 ??? (15)] - deleted
60%..block 94537114: The number of items (2560) is incorrect, should be =
(1) - corrected
block 94537114: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 94537114, item (0): Unknown item type found =
[134217792 2147485696 0x1 ??? (15)] - deleted
.block 95936789: The number of items (544) is incorrect, should be (1) - =
corrected
block 95936789: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 95936789, item (0): Unknown item type found =
[67108864 4227072 0x80 ??? (15)] - deleted
block 96036235: The number of items (512) is incorrect, should be (1) - =
corrected
block 96036235: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 96036235, item (0): Unknown item type found [0 =
4194304 0x80 ??? (15)] - deleted
block 96036236: The number of items (544) is incorrect, should be (1) - =
corrected
block 96036236: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 96036236, item (0): Unknown item type found [0 =
4194304 0x8000080 ??? (15)] - deleted
.block 98212308: The number of items (2560) is incorrect, should be (1) =
- corrected
block 98212308: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 98212308, item (0): Unknown item type found =
[134217792 2147485696 0x1 ??? (15)] - deleted
80%block 99693133: The number of items (512) is incorrect, should be (1) =
- corrected
block 99693133: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 99693133, item (0): Unknown item type found [0 =
4194304 0x80 ??? (15)] - deleted
block 99693134: The number of items (544) is incorrect, should be (1) - =
corrected
block 99693134: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 99693134, item (0): Unknown item type found [0 =
4194304 0x8000080 ??? (15)] - deleted
...block 103340909: The number of items (512) is incorrect, should be =
(1) - corrected
block 103340909: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 103340909, item (0): Unknown item type found =
[67108864 4194304 0x80 ??? (15)] - deleted
block 104223645: The number of items (2560) is incorrect, should be (1) =
- corrected
block 104223645: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 104223645, item (0): Unknown item type found =
[134217792 2147485696 0x1 ??? (15)] - deleted
block 104256153: The number of items (2560) is incorrect, should be (1) =
- corrected
block 104256153: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 104256153, item (0): Unknown item type found =
[134217792 2147485696 0x1 ??? (15)] - deleted
block 104288518: The number of items (2560) is incorrect, should be (1) =
- corrected
block 104288518: The free space (0) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 104288518, item (0): Unknown item type found =
[134217792 2147485696 0x1 ??? (15)] - deleted
block 104473732: The number of items (544) is incorrect, should be (1) - =
corrected
block 104473732: The free space (33) is incorrect, should be (2000) - =
corrected
pass0: vpf-10110: block 104473732, item (0): Unknown item type found =
[67108864 4227072 0x80 ??? (15)] - deleted
.100%                       left 0, 16231 /sec
2087007 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 36763997
                Leaves among those 107118
                        - leaves all contents of which could not be =
saved and deleted 71
                Objectids found 2087010

Pass 1 (will try to insert 107047 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....100%                         left 0, =
154 /sec
Flushing..finished
        107047 leaves read
                105463 inserted
                1584 not inserted
        non-unique pointers in indirect items (zeroed) 1
####### Pass 2 #######

Pass 2:
0%....20%....40%....60%....80%....100%                          left 0, =
45 /sec
Flushing..finished
        Leaves inserted item by item 1584
Pass 3 (semantic):
####### Pass 3 #########
/www/www.photoalbum.hu/im_pic_picrebuild_semantic_pass: The entry =
[486654 47621320] ("98220_big.jpg") in directory [10022 486654] points =
to nowhere - is removed
/1811_big.jpgvpf-10680: The file [486654 816346] has the wrong block =
count in the StatData (344) - corrected to (336)
/www/www.site.hu/im_pic_picvpf-10650: The directory [10022 486654] has =
the wrong size in the StatData (30134840) - corrected to (30134808)
Flushing..finished                                                       =
     =20
        Files found: 2085470
        Directories found: 1511
        Symlinks found: 27
        Names pointing to nowhere (removed): 1
Pass 3a (looking for lost dir/files):
####### Pass 3a (lost+found pass) #########
Looking for lost directories:
Looking for lost files:0 /sec
Flushing..finishede 0, 0 /sec
        Objects without names 1
        Files linked to /lost+found 1
Pass 4 - finished done 80623, 134 /sec
Flushing..finished
###########
reiserfsck finished at Wed Mar  8 03:43:07 2006
###########

------=_NextPart_000_02A9_01C64262.95E68AA0--

