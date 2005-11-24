From: Martin Sarsale <martin@malditainternet.com>
Subject: reiser3 in cryptoloop
Date: Thu, 24 Nov 2005 12:54:06 -0300
Message-ID: <fe11eda90511240754k2ae211e8j9d1be51c43465171@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27132-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: martin.sarsale@gmail.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Dear all:

Im using (the great) reiser3 in a 20gb, twofish crypted file which I
use for backups.
I mount it every night and run pdumpfs, so the FS has a huge number of
hardlinks (pdumpfs links files which were not modified between backups
to create a browseable, per day, snapshot).

Every 2 or 3 days, I receive an email from pdumpfs saying
"pdumpfs: File exists - /opt/backup/2005/11/04"

and I know time has come to run reiserfsck on this file.
I setup a loopback device and run reiserfsck --fix-fixable (and
--rebuild-tree when needed) and everything works good for 2 or 3 days
more.

Im using a similar setup on the same machine for my homedir, but I use
reiser4 and the cryptoloop is never umounted (the backup one gets
mounted and umounted every night). This one works much better: I never
had this kind of problems.

Im running this on a debian testing/unstable/experimental amd64 box, runnin=
g
Linux camem64 2.6.12-cko2 #1 Thu Aug 18 10:56:59 ART 2005 x86_64 GNU/Linux

# reiserfsck -V
reiserfsck 3.6.19 (2003 www.namesys.com)

The output for reiserfsck is the following:
camem64:/home/martin# losetup -e twofish /dev/loop2 /opt/backup.img.crypto
Password:
camem64:/home/martin# reiserfsck --fix-fixable /dev/loop2
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

Will check consistency of the filesystem on /dev/loop2
and will fix what can be fixed without --rebuild-tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Y=
es
###########
reiserfsck --fix-fixable started at Thu Nov 24 10:52:38 2005
###########
Replaying journal..
Reiserfs journal '/dev/loop2' in blocks [18..8211]: 0 transactions replayed
Checking internal tree../  1 (of   8)/  3 (of 152)/ 10 (of
118)bad_stat_data: The objectid (8) is shared by at least two files.
Can be fixed with --rebuild-tree only.
/ 31 (of 152)/  8 (of 137)bad_stat_data: The objectid (16929) is
shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16931) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16932) is shared by at least two files.
Can be fixed with --rebuild-tree only.
/  9 (of 137)bad_stat_data: The objectid (16933) is shared by at least
two files. Can be fixed with --rebuild-tree only.
/ 10 (of 137)bad_stat_data: The objectid (16938) is shared by at least
two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16940) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16941) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16942) is shared by at least two files.
Can be fixed with --rebuild-tree only.
/ 12 (of 137)bad_stat_data: The objectid (16943) is shared by at least
two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16944) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16945) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16946) is shared by at least two files.
Can be fixed with --rebuild-tree only.
/ 13 (of 137)bad_stat_data: The objectid (16947) is shared by at least
two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16952) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16956) is shared by at least two files.
Can be fixed with --rebuild-tree only.
/ 15 (of 137)bad_stat_data: The objectid (16948) is shared by at least
two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16949) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16951) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16950) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16953) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16954) is shared by at least two files.
Can be fixed with --rebuild-tree only.
/ 16 (of 137)bad_stat_data: The objectid (16955) is shared by at least
two files. Can be fixed with --rebuild-tree only.
/ 17 (of 137)bad_stat_data: The objectid (16957) is shared by at least
two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16958) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16959) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16961) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16962) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16964) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16965) is shared by at least two files.
Can be fixed with --rebuild-tree only.
/ 61 (of 152)block 4594226: The level of the node (2314) is not
correct, (2) expected
 the problem in the internal node occured (4594226), whole subtree is skipp=
ed
/  8 (of   8)/157 (of 160)/ 93 (of 149)bad_stat_data: The objectid
(1068348) is shared by at least two files. Can be fixed with
--rebuild-tree only.
/ 94 (of 149)bad_stat_data: The objectid (1068350) is shared by at
least two files. Can be fixed with --rebuild-tree only.
/104 (of 149)bad_stat_data: The objectid (1068352) is shared by at
least two files. Can be fixed with --rebuild-tree only.
/105 (of 149)bad_stat_data: The objectid (1068353) is shared by at
least two files. Can be fixed with --rebuild-tree only.
/114 (of 149)bad_stat_data: The objectid (16928) is shared by at least
two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (16934) is shared by at least two files.
Can be fixed with --rebuild-tree only.
/117 (of 149)bad_stat_data: The objectid (1068354) is shared by at
least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068355) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068356) is shared by at least two files.
Can be fixed with --rebuild-tree only.
/118 (of 149)bad_stat_data: The objectid (1068357) is shared by at
least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068358) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068359) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068360) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068361) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068362) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068363) is shared by at least two files.
Can be fixed with --rebuild-tree only.
/119 (of 149)bad_stat_data: The objectid (1068364) is shared by at
least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068365) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068366) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068367) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068368) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068369) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068370) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068371) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068372) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068373) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068374) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068378) is shared by at least two files.
Can be fixed with --rebuild-tree only.
/122 (of 149)bad_stat_data: The objectid (1068376) is shared by at
least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068377) is shared by at least two files.
Can be fixed with --rebuild-tree only.
/125 (of 149)bad_stat_data: The objectid (1068379) is shared by at
least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068380) is shared by at least two files.
Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (1068381) is shared by at least two files.
Can be fixed with --rebuild-tree only.
finished
Comparing bitmaps..vpf-10630: The on-disk and the correct bitmaps
differs. Will be fixed later.
Bad nodes were found, Semantic pass skipped
1 found corruptions can be fixed only when running with --rebuild-tree
###########
reiserfsck finished at Thu Nov 24 10:57:39 2005
###########


And
camem64:/home/martin# reiserfsck --rebuild-tree /dev/loop2
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

Will rebuild the filesystem (/dev/loop2) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Y=
es
Replaying journal..
Reiserfs journal '/dev/loop2' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Thu Nov 24 10:59:33 2005
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 5103846 blocks marked used
Skipping 8370 blocks (super block, journal, bitmaps) 5095476 blocks will be=
 read
0%....20%....40%....60%....80%....100%                        left 0, 6361 =
/sec
3108789 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 5095476
                Leaves among those 161946
                        - leaves all contents of which could not be
saved and deleted 5
                Objectids found 813170

Pass 1 (will try to insert 161941 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....100%                         left 0, 454 =
/sec
Flushing..finished
        161941 leaves read
                161020 inserted
                921 not inserted
####### Pass 2 #######

Pass 2:
0%....20%....40%....60%....80%....100%                          left 0, 87 =
/sec
Flushing..finished
        Leaves inserted item by item 921
Pass 3 (semantic):
####### Pass 3 #########
/2005/08/09/martin/www/XXX/XXXXXXXXXXX-pre_cdm/faces/XXXXXX/images/ratings
/2005/11relocate_dir: Moving [3 8 0x0 SD (0)] to [3 38818 0x0 SD (0)]
relocate_dir: Moving [3 8 0x1 DIR (3)] to [3 38818 0x1 DIR (3)]
/01get_next_directory_item: The entry ".." of the directory [8 59]
pointes to [3 8], instead of [3 38818] - corrected
/2005/11/02get_next_directory_item: The entry ".." of the directory [8
1066331] pointes to [3 8], instead of [3 38818] - corrected
/2005/11/03get_next_directory_item: The entry ".." of the directory [8
1068347] pointes to [3 8], instead of [3 38818] - corrected
/2005/11/05relocate_dir: Moving [8 1068348 0x0 SD (0)] to [8 38829 0x0 SD (=
0)]
relocate_dir: Moving [8 1068348 0x1 DIR (3)] to [8 38829 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [8 38829]
pointes to [3 8], instead of [3 38818] - corrected
The entry [8 38829] ("05") in directory [3 38818] updated to point to [8 38=
829]
/06relocate_dir: Moving [8 1068350 0x0 SD (0)] to [8 38830 0x0 SD (0)]
relocate_dir: Moving [8 1068350 0x1 DIR (3)] to [8 38830 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [8 38830]
pointes to [3 8], instead of [3 38818] - corrected
The entry [8 38830] ("06") in directory [3 38818] updated to point to [8 38=
830]
/07relocate_dir: Moving [8 1068352 0x0 SD (0)] to [8 38831 0x0 SD (0)]
relocate_dir: Moving [8 1068352 0x1 DIR (3)] to [8 38831 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [8 38831]
pointes to [3 8], instead of [3 38818] - corrected
/martinrelocate_dir: Moving [1068352 1068353 0x0 SD (0)] to [1068352
38832 0x0 SD (0)]
relocate_dir: Moving [1068352 1068353 0x1 DIR (3)] to [1068352 38832
0x1 DIR (3)]
relocate_dir: Moving [1068352 1068353 0xfa79500 DIR (3)] to [1068352
38832 0xfa79500 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068352
38832] pointes to [8 1068352], instead of [8 38831] - corrected
/.eget_next_directory_item: The entry ".." of the directory [1068353
19169] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
/.mcget_next_directory_item: The entry ".." of the directory [1068353
17378] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
/.qtget_next_directory_item: The entry ".." of the directory [1068353
16342] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
/binget_next_directory_item: The entry ".." of the directory [1068353
16201] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
/2005/11/07/martin/devget_next_directory_item: The entry ".." of the
directory [1068353 15898] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/2005/11/07/martin/.cvsget_next_directory_item: The entry ".." of the
directory [1068353 19189] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/.psiget_next_directory_item: The entry ".." of the directory [1068353
16343] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
/2005/11/07/martin/.sshget_next_directory_item: The entry ".." of the
directory [1068353 16326] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/.vimget_next_directory_item: The entry ".." of the directory [1068353
16301] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
/.vncget_next_directory_item: The entry ".." of the directory [1068353
16297] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
/.xncget_next_directory_item: The entry ".." of the directory [1068353
16254] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
/Appsget_next_directory_item: The entry ".." of the directory [1068353
16249] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
/miosget_next_directory_item: The entry ".." of the directory [1068353
14670] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
/2005/11/07/martin/projrelocate_dir: Moving [1068353 1068378 0x0 SD
(0)] to [1068353 38833 0x0 SD (0)]
relocate_dir: Moving [1068353 1068378 0x1 DIR (3)] to [1068353 38833
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068353
38833] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
/cvsget_next_directory_item: The entry ".." of the directory [1068378
14503] pointes to [1068353 1068378], instead of [1068353 38833] -
corrected
/itaget_next_directory_item: The entry ".." of the directory [1068378
14496] pointes to [1068353 1068378], instead of [1068353 38833] -
corrected
/ivrget_next_directory_item: The entry ".." of the directory [1068378
14494] pointes to [1068353 1068378], instead of [1068353 38833] -
corrected
/sapget_next_directory_item: The entry ".." of the directory [1068378
14424] pointes to [1068353 1068378], instead of [1068353 38833] -
corrected
/xulrelocate_dir: Moving [1068378 1068379 0x0 SD (0)] to [1068378
38834 0x0 SD (0)]
relocate_dir: Moving [1068378 1068379 0x1 DIR (3)] to [1068378 38834
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068378
38834] pointes to [1068353 1068378], instead of [1068353 38833] -
corrected
/chromerelocate_dir: Moving [1068379 1068380 0x0 SD (0)] to [1068379
38835 0x0 SD (0)]
relocate_dir: Moving [1068379 1068380 0x1 DIR (3)] to [1068379 38835
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068379
38835] pointes to [1068378 1068379], instead of [1068378 38834] -
corrected
/findfilerelocate_dir: Moving [1068380 1068381 0x0 SD (0)] to [1068380
38836 0x0 SD (0)]
relocate_dir: Moving [1068380 1068381 0x1 DIR (3)] to [1068380 38836
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068380
38836] pointes to [1068379 1068380], instead of [1068379 38835] -
corrected
/contentget_next_directory_item: The entry ".." of the directory
[1068381 14385] pointes to [1068380 1068381], instead of [1068380
38836] - corrected
The entry [1068380 38836] ("findfile") in directory [1068379 38835]
updated to point to [1068380 38836]
The entry [1068379 38835] ("chrome") in directory [1068378 38834]
updated to point to [1068379 38835]
The entry [1068378 38834] ("xul") in directory [1068353 38833] updated
to point to [1068378 38834]
/arteget_next_directory_item: The entry ".." of the directory [1068378
14507] pointes to [1068353 1068378], instead of [1068353 38833] -
corrected
/soapget_next_directory_item: The entry ".." of the directory [1068378
14407] pointes to [1068353 1068378], instead of [1068353 38833] -
corrected
/wikiget_next_directory_item: The entry ".." of the directory [1068378
14388] pointes to [1068353 1068378], instead of [1068353 38833] -
corrected
/iplanget_next_directory_item: The entry ".." of the directory
[1068378 14500] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
/mssqlget_next_directory_item: The entry ".." of the directory
[1068378 14442] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
/toolsget_next_directory_item: The entry ".." of the directory
[1068378 14397] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
/licenseget_next_directory_item: The entry ".." of the directory
[1068378 14481] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
/2005/11/07/martin/proj/knowledgebaseget_next_directory_item: The
entry ".." of the directory [1068378 14492] pointes to [1068353
1068378], instead of [1068353 38833] - corrected
/2005/11/07/martin/proj/countriesget_next_directory_item: The entry
".." of the directory [1068378 14504] pointes to [1068353 1068378],
instead of [1068353 38833] - corrected
/2005/11/07/martin/proj/tester-get_next_directory_item: The entry ".."
of the directory [1068378 14402] pointes to [1068353 1068378], instead
of [1068353 38833] - corrected
/dedicatedget_next_directory_item: The entry ".." of the directory
[1068378 14502] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
/webservicesget_next_directory_item: The entry ".." of the directory
[1068378 14390] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
/2005/11/07/martin/proj/empty_dbget_next_directory_item: The entry
".." of the directory [1068378 14501] pointes to [1068353 1068378],
instead of [1068353 38833] - corrected
/automatic_testingget_next_directory_item: The entry ".." of the
directory [1068378 14506] pointes to [1068353 1068378], instead of
[1068353 38833] - corrected
/tester.origget_next_directory_item: The entry ".." of the directory
[1068378 14401] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
/sharepointget_next_directory_item: The entry ".." of the directory
[1068378 14412] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
/viejo2nuevoget_next_directory_item: The entry ".." of the directory
[1068378 14394] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
/2005/11/07/martin/proj/presentacionesget_next_directory_item: The
entry ".." of the directory [1068378 14425] pointes to [1068353
1068378], instead of [1068353 38833] - corrected
/mantisconnectget_next_directory_item: The entry ".." of the directory
[1068378 14448] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
/2005/11/07/martin/proj/serverget_next_directory_item: The entry ".."
of the directory [1068378 14422] pointes to [1068353 1068378], instead
of [1068353 38833] - corrected
/wikimedia2pdfget_next_directory_item: The entry ".." of the directory
[1068378 14386] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
/testerget_next_directory_item: The entry ".." of the directory
[1068378 14405] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
/java_vs_phpget_next_directory_item: The entry ".." of the directory
[1068378 14493] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
/phpunitget_next_directory_item: The entry ".." of the directory
[1068378 14427] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
/measurements interfaceget_next_directory_item: The entry ".." of the
directory [1068378 14444] pointes to [1068353 1068378], instead of
[1068353 38833] - corrected
/2005/11/07/martin/proj/server dedicadoget_next_directory_item: The
entry ".." of the directory [1068378 14421] pointes to [1068353
1068378], instead of [1068353 38833] - corrected
/performanceget_next_directory_item: The entry ".." of the directory
[1068378 14435] pointes to [1068353 1068378], instead of [1068353
38833] - corrected
The entry [1068353 38833] ("proj") in directory [1068352 38832]
updated to point to [1068353 38833]
/.fluxspaceget_next_directory_item: The entry ".." of the directory
[1068353 19013] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.cddbget_next_directory_item: The entry ".." of the directory
[1068353 19194] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.gcvsget_next_directory_item: The entry ".." of the directory
[1068353 17738] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.javaget_next_directory_item: The entry ".." of the directory
[1068353 17664] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/2005/11/07/martin/.lftpget_next_directory_item: The entry ".." of the
directory [1068353 17659] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/.licqget_next_directory_item: The entry ".." of the directory
[1068353 17655] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.mcopget_next_directory_item: The entry ".." of the directory
[1068353 17377] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.lokiget_next_directory_item: The entry ".." of the directory
[1068353 17397] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.wineget_next_directory_item: The entry ".." of the directory
[1068353 16261] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.xineget_next_directory_item: The entry ".." of the directory
[1068353 16260] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.xmmsget_next_directory_item: The entry ".." of the directory
[1068353 16257] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.fluxboxget_next_directory_item: The entry ".." of the directory
[1068353 19078] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.anjutaget_next_directory_item: The entry ".." of the directory
[1068353 19198] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.gnome2_privateget_next_directory_item: The entry ".." of the
directory [1068353 17685] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/gconfget_next_directory_item: The entry ".." of the directory
[1068353 15858] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/2005/11/07/martin/gnomeget_next_directory_item: The entry ".." of the
directory [1068353 15802] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/2005/11/07/martin/linksget_next_directory_item: The entry ".." of the
directory [1068353 15801] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/.choiceget_next_directory_item: The entry ".." of the directory
[1068353 19191] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.dasherget_next_directory_item: The entry ".." of the directory
[1068353 19188] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.mplayerget_next_directory_item: The entry ".." of the directory
[1068353 16420] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.mozillaget_next_directory_item: The entry ".." of the directory
[1068353 17112] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/2005/11/07/martin/.elinksget_next_directory_item: The entry ".." of
the directory [1068353 19167] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/.gconfdget_next_directory_item: The entry ".." of the directory
[1068353 17740] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.gnome2get_next_directory_item: The entry ".." of the directory
[1068353 17686] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/2005/11/07/martin/.inkscapeget_next_directory_item: The entry ".." of
the directory [1068353 17679] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/.mldonkeyget_next_directory_item: The entry ".." of the directory
[1068353 17374] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.idlercget_next_directory_item: The entry ".." of the directory
[1068353 17680] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.gstreamer-0.8relocate_dir: Moving [1068353 1068354 0x0 SD (0)] to
[1068353 38837 0x0 SD (0)]
relocate_dir: Moving [1068353 1068354 0x1 DIR (3)] to [1068353 38837
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068353
38837] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
The entry [1068353 38837] (".gstreamer-0.8") in directory [1068352
38832] updated to point to [1068353 38837]
/.links2get_next_directory_item: The entry ".." of the directory
[1068353 17653] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.neverballget_next_directory_item: The entry ".." of the directory
[1068353 16415] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.qtorrent3get_next_directory_item: The entry ".." of the directory
[1068353 16339] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/2005/11/07/martin/.com.oxygenxmlget_next_directory_item: The entry
".." of the directory [1068353 19190] pointes to [1068352 1068353],
instead of [1068352 38832] - corrected
/.gpilotdget_next_directory_item: The entry ".." of the directory
[1068353 17683] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.gimp-2.2relocate_dir: Moving [1068353 1068355 0x0 SD (0)] to
[1068353 38838 0x0 SD (0)]
relocate_dir: Moving [1068353 1068355 0x1 DIR (3)] to [1068353 38838
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068353
38838] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
/tmprelocate_dir: Moving [1068355 1068357 0x0 SD (0)] to [1068355
38839 0x0 SD (0)]
relocate_dir: Moving [1068355 1068357 0x1 DIR (3)] to [1068355 38839
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38839] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38839] ("tmp") in directory [1068353 38838] updated
to point to [1068355 38839]
/gfigrelocate_dir: Moving [1068355 1068369 0x0 SD (0)] to [1068355
38840 0x0 SD (0)]
relocate_dir: Moving [1068355 1068369 0x1 DIR (3)] to [1068355 38840
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38840] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38840] ("gfig") in directory [1068353 38838]
updated to point to [1068355 38840]
/fontsrelocate_dir: Moving [1068355 1068371 0x0 SD (0)] to [1068355
38841 0x0 SD (0)]
relocate_dir: Moving [1068355 1068371 0x1 DIR (3)] to [1068355 38841
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38841] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38841] ("fonts") in directory [1068353 38838]
updated to point to [1068355 38841]
/tool-optionsrelocate_dir: Moving [1068355 1068356 0x0 SD (0)] to
[1068355 38842 0x0 SD (0)]
relocate_dir: Moving [1068355 1068356 0x1 DIR (3)] to [1068355 38842
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38842] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
/2005/11/07/martin/.gimp-2.2The entry [1068355 38842] ("tool-options")
in directory [1068353 38838] updated to point to [1068355 38842]
/scriptsrelocate_dir: Moving [1068355 1068360 0x0 SD (0)] to [1068355
38843 0x0 SD (0)]
relocate_dir: Moving [1068355 1068360 0x1 DIR (3)] to [1068355 38843
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38843] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38843] ("scripts") in directory [1068353 38838]
updated to point to [1068355 38843]
/palettesrelocate_dir: Moving [1068355 1068363 0x0 SD (0)] to [1068355
38844 0x0 SD (0)]
relocate_dir: Moving [1068355 1068363 0x1 DIR (3)] to [1068355 38844
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38844] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38844] ("palettes") in directory [1068353 38838]
updated to point to [1068355 38844]
/environrelocate_dir: Moving [1068355 1068372 0x0 SD (0)] to [1068355
38845 0x0 SD (0)]
relocate_dir: Moving [1068355 1068372 0x1 DIR (3)] to [1068355 38845
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38845] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38845] ("environ") in directory [1068353 38838]
updated to point to [1068355 38845]
/patternsrelocate_dir: Moving [1068355 1068362 0x0 SD (0)] to [1068355
38846 0x0 SD (0)]
relocate_dir: Moving [1068355 1068362 0x1 DIR (3)] to [1068355 38846
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38846] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38846] ("patterns") in directory [1068353 38838]
updated to point to [1068355 38846]
/curvesrelocate_dir: Moving [1068355 1068373 0x0 SD (0)] to [1068355
38847 0x0 SD (0)]
relocate_dir: Moving [1068355 1068373 0x1 DIR (3)] to [1068355 38847
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38847] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38847] ("curves") in directory [1068353 38838]
updated to point to [1068355 38847]
/gradientsrelocate_dir: Moving [1068355 1068366 0x0 SD (0)] to
[1068355 38848 0x0 SD (0)]
relocate_dir: Moving [1068355 1068366 0x1 DIR (3)] to [1068355 38848
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38848] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38848] ("gradients") in directory [1068353 38838]
updated to point to [1068355 38848]
/modulesrelocate_dir: Moving [1068355 1068364 0x0 SD (0)] to [1068355
38849 0x0 SD (0)]
relocate_dir: Moving [1068355 1068364 0x1 DIR (3)] to [1068355 38849
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38849] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38849] ("modules") in directory [1068353 38838]
updated to point to [1068355 38849]
/gflarerelocate_dir: Moving [1068355 1068368 0x0 SD (0)] to [1068355
38850 0x0 SD (0)]
relocate_dir: Moving [1068355 1068368 0x1 DIR (3)] to [1068355 38850
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38850] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38850] ("gflare") in directory [1068353 38838]
updated to point to [1068355 38850]
/fractalexplorerrelocate_dir: Moving [1068355 1068370 0x0 SD (0)] to
[1068355 38851 0x0 SD (0)]
relocate_dir: Moving [1068355 1068370 0x1 DIR (3)] to [1068355 38851
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38851] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38851] ("fractalexplorer") in directory [1068353
38838] updated to point to [1068355 38851]
/levelsrelocate_dir: Moving [1068355 1068365 0x0 SD (0)] to [1068355
38852 0x0 SD (0)]
relocate_dir: Moving [1068355 1068365 0x1 DIR (3)] to [1068355 38852
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38852] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38852] ("levels") in directory [1068353 38838]
updated to point to [1068355 38852]
/themesrelocate_dir: Moving [1068355 1068358 0x0 SD (0)] to [1068355
38853 0x0 SD (0)]
relocate_dir: Moving [1068355 1068358 0x1 DIR (3)] to [1068355 38853
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38853] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38853] ("themes") in directory [1068353 38838]
updated to point to [1068355 38853]
/gimpressionistrelocate_dir: Moving [1068355 1068367 0x0 SD (0)] to
[1068355 38854 0x0 SD (0)]
relocate_dir: Moving [1068355 1068367 0x1 DIR (3)] to [1068355 38854
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38854] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38854] ("gimpressionist") in directory [1068353
38838] updated to point to [1068355 38854]
/brushesrelocate_dir: Moving [1068355 1068374 0x0 SD (0)] to [1068355
38855 0x0 SD (0)]
relocate_dir: Moving [1068355 1068374 0x1 DIR (3)] to [1068355 38855
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38855] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38855] ("brushes") in directory [1068353 38838]
updated to point to [1068355 38855]
/plug-insrelocate_dir: Moving [1068355 1068361 0x0 SD (0)] to [1068355
38856 0x0 SD (0)]
relocate_dir: Moving [1068355 1068361 0x1 DIR (3)] to [1068355 38856
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38856] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38856] ("plug-ins") in directory [1068353 38838]
updated to point to [1068355 38856]
/templatesrelocate_dir: Moving [1068355 1068359 0x0 SD (0)] to
[1068355 38857 0x0 SD (0)]
relocate_dir: Moving [1068355 1068359 0x1 DIR (3)] to [1068355 38857
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068355
38857] pointes to [1068353 1068355], instead of [1068353 38838] -
corrected
The entry [1068355 38857] ("templates") in directory [1068353 38838]
updated to point to [1068355 38857]
The entry [1068353 38838] (".gimp-2.2") in directory [1068352 38832]
updated to point to [1068353 38838]
/.alsaplayerget_next_directory_item: The entry ".." of the directory
[1068353 19199] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.AbiSuiteget_next_directory_item: The entry ".." of the directory
[1068353 19222] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.mozilla-bkpget_next_directory_item: The entry ".." of the directory
[1068353 16934] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/2005/11/07/martin/.regexpget_next_directory_item: The entry ".." of
the directory [1068353 16327] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/.quake4get_next_directory_item: The entry ".." of the directory
[1068353 16335] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/public_htmlrelocate_dir: Moving [1068353 1068377 0x0 SD (0)] to
[1068353 38858 0x0 SD (0)]
relocate_dir: Moving [1068353 1068377 0x1 DIR (3)] to [1068353 38858
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068353
38858] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
The entry [1068353 38858] ("public_html") in directory [1068352 38832]
updated to point to [1068353 38858]
/.metacityget_next_directory_item: The entry ".." of the directory
[1068353 17375] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/Desktopget_next_directory_item: The entry ".." of the directory
[1068353 16214] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/2005/11/07/martin/.vmwareget_next_directory_item: The entry ".." of
the directory [1068353 16298] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/.BitTornadoget_next_directory_item: The entry ".." of the directory
[1068353 19206] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/2005/11/07/martin/.nautilusget_next_directory_item: The entry ".." of
the directory [1068353 16416] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/2005/11/07/martin/.evolutionget_next_directory_item: The entry ".."
of the directory [1068353 19084] pointes to [1068352 1068353], instead
of [1068352 38832] - corrected
/.tsclientget_next_directory_item: The entry ".." of the directory
[1068353 16306] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.openofficeget_next_directory_item: The entry ".." of the directory
[1068353 16373] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/2005/11/07/martin/.thumbnailsget_next_directory_item: The entry ".."
of the directory [1068353 16309] pointes to [1068352 1068353], instead
of [1068352 38832] - corrected
/2005/11/07/martin/.transgaming_globalget_next_directory_item: The
entry ".." of the directory [1068353 16307] pointes to [1068352
1068353], instead of [1068352 38832] - corrected
/mozilla-firefoxget_next_directory_item: The entry ".." of the
directory [1068353 14508] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/2005/11/07/martin/.etherealget_next_directory_item: The entry ".." of
the directory [1068353 19164] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/.quodlibetget_next_directory_item: The entry ".." of the directory
[1068353 16329] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/vmwarerelocate_dir: Moving [1068353 1068376 0x0 SD (0)] to [1068353
38859 0x0 SD (0)]
relocate_dir: Moving [1068353 1068376 0x1 DIR (3)] to [1068353 38859
0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [1068353
38859] pointes to [1068352 1068353], instead of [1068352 38832] -
corrected
The entry [1068353 38859] ("vmware") in directory [1068352 38832]
updated to point to [1068353 38859]
/.Trashget_next_directory_item: The entry ".." of the directory
[1068353 19200] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.mozilla-thunderbirdget_next_directory_item: The entry ".." of the
directory [1068353 16717] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/2005/11/07/martin/.ecoreget_next_directory_item: The entry ".." of
the directory [1068353 19168] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/.gajimget_next_directory_item: The entry ".." of the directory
[1068353 18992] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/2005/11/07/martin/.gconfget_next_directory_item: The entry ".." of
the directory [1068353 17743] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/2005/11/07/martin/.gnomeget_next_directory_item: The entry ".." of
the directory [1068353 17731] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/.gnupgget_next_directory_item: The entry ".." of the directory
[1068353 17684] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.iconsget_next_directory_item: The entry ".." of the directory
[1068353 17681] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.irssiget_next_directory_item: The entry ".." of the directory
[1068353 17678] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.kodosget_next_directory_item: The entry ".." of the directory
[1068353 17663] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.linksget_next_directory_item: The entry ".." of the directory
[1068353 17654] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.tconnget_next_directory_item: The entry ".." of the directory
[1068353 16318] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.sweepget_next_directory_item: The entry ".." of the directory
[1068353 16319] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.cddbslaveget_next_directory_item: The entry ".." of the directory
[1068353 19193] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.subversionget_next_directory_item: The entry ".." of the directory
[1068353 16320] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.xscorchget_next_directory_item: The entry ".." of the directory
[1068353 16253] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.aptitudeget_next_directory_item: The entry ".." of the directory
[1068353 19197] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.bluefishget_next_directory_item: The entry ".." of the directory
[1068353 19195] pointes to [1068352 1068353], instead of [1068352
38832] - corrected
/.mozilla-thunderbird-2get_next_directory_item: The entry ".." of the
directory [1068353 16421] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/2005/11/07/martin/.macromediaget_next_directory_item: The entry ".."
of the directory [1068353 17383] pointes to [1068352 1068353], instead
of [1068352 38832] - corrected
/2005/11/07/martin/.Azureusget_next_directory_item: The entry ".." of
the directory [1068353 19212] pointes to [1068352 1068353], instead of
[1068352 38832] - corrected
/2005/11/07/martin/lost+foundget_next_directory_item: The entry ".."
of the directory [1068353 15800] pointes to [1068352 1068353], instead
of [1068352 38832] - corrected
The entry [1068352 38832] ("martin") in directory [8 38831] updated to
point to [1068352 38832]
The entry [8 38831] ("07") in directory [3 38818] updated to point to [8 38=
831]
/08relocate_dir: Moving [8 16928 0x0 SD (0)] to [8 38860 0x0 SD (0)]
relocate_dir: Moving [8 16928 0x1 DIR (3)] to [8 38860 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [8 38860]
pointes to [3 8], instead of [3 38818] - corrected
/martinrelocate_dir: Moving [16928 16929 0x0 SD (0)] to [16928 38861 0x0 SD=
 (0)]
relocate_dir: Moving [16928 16929 0x1 DIR (3)] to [16928 38861 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16928 38861]
pointes to [8 16928], instead of [8 38860] - corrected
/wwwrewrite_file: 2 items of file [16929 16956] moved to [16929 38862]
The entry [16929 16956] ("www") in directory [16928 38861] updated to
point to [16929 38862]
/projrelocate_dir: Moving [16929 16959 0x0 SD (0)] to [16929 38863 0x0 SD (=
0)]
relocate_dir: Moving [16929 16959 0x1 DIR (3)] to [16929 38863 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16929 38863]
pointes to [16928 16929], instead of [16928 38861] - corrected
The entry [16929 38863] ("proj") in directory [16928 38861] updated to
point to [16929 38863]
/.gstreamer-0.8relocate_dir: Moving [16929 16931 0x0 SD (0)] to [16929
38864 0x0 SD (0)]
relocate_dir: Moving [16929 16931 0x1 DIR (3)] to [16929 38864 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16929 38864]
pointes to [16928 16929], instead of [16928 38861] - corrected
The entry [16929 38864] (".gstreamer-0.8") in directory [16928 38861]
updated to point to [16929 38864]
/.gimp-2.2relocate_dir: Moving [16929 16932 0x0 SD (0)] to [16929
38865 0x0 SD (0)]
relocate_dir: Moving [16929 16932 0x1 DIR (3)] to [16929 38865 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16929 38865]
pointes to [16928 16929], instead of [16928 38861] - corrected
/tmprelocate_dir: Moving [16932 16934 0x0 SD (0)] to [16932 38866 0x0 SD (0=
)]
relocate_dir: Moving [16932 16934 0x1 DIR (3)] to [16932 38866 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38866]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38866] ("tmp") in directory [16929 38865] updated to
point to [16932 38866]
/gfigrelocate_dir: Moving [16932 16950 0x0 SD (0)] to [16932 38867 0x0 SD (=
0)]
relocate_dir: Moving [16932 16950 0x1 DIR (3)] to [16932 38867 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38867]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38867] ("gfig") in directory [16929 38865] updated to
point to [16932 38867]
/fontsrelocate_dir: Moving [16932 16952 0x0 SD (0)] to [16932 38868 0x0 SD =
(0)]
relocate_dir: Moving [16932 16952 0x1 DIR (3)] to [16932 38868 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38868]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38868] ("fonts") in directory [16929 38865] updated
to point to [16932 38868]
/tool-optionsrelocate_dir: Moving [16932 16933 0x0 SD (0)] to [16932
38869 0x0 SD (0)]
relocate_dir: Moving [16932 16933 0x1 DIR (3)] to [16932 38869 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38869]
pointes to [16929 16932], instead of [16929 38865] - corrected
/2005/11/08/martin/.gimp-2.2The entry [16932 38869] ("tool-options")
in directory [16929 38865] updated to point to [16932 38869]
/scriptsrelocate_dir: Moving [16932 16941 0x0 SD (0)] to [16932 38870
0x0 SD (0)]
relocate_dir: Moving [16932 16941 0x1 DIR (3)] to [16932 38870 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38870]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38870] ("scripts") in directory [16929 38865] updated
to point to [16932 38870]
/palettesrelocate_dir: Moving [16932 16944 0x0 SD (0)] to [16932 38871
0x0 SD (0)]
relocate_dir: Moving [16932 16944 0x1 DIR (3)] to [16932 38871 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38871]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38871] ("palettes") in directory [16929 38865]
updated to point to [16932 38871]
/environrelocate_dir: Moving [16932 16953 0x0 SD (0)] to [16932 38872
0x0 SD (0)]
relocate_dir: Moving [16932 16953 0x1 DIR (3)] to [16932 38872 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38872]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38872] ("environ") in directory [16929 38865] updated
to point to [16932 38872]
/patternsrelocate_dir: Moving [16932 16943 0x0 SD (0)] to [16932 38873
0x0 SD (0)]
relocate_dir: Moving [16932 16943 0x1 DIR (3)] to [16932 38873 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38873]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38873] ("patterns") in directory [16929 38865]
updated to point to [16932 38873]
/curvesrelocate_dir: Moving [16932 16954 0x0 SD (0)] to [16932 38874 0x0 SD=
 (0)]
relocate_dir: Moving [16932 16954 0x1 DIR (3)] to [16932 38874 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38874]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38874] ("curves") in directory [16929 38865] updated
to point to [16932 38874]
/gradientsrelocate_dir: Moving [16932 16947 0x0 SD (0)] to [16932
38875 0x0 SD (0)]
relocate_dir: Moving [16932 16947 0x1 DIR (3)] to [16932 38875 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38875]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38875] ("gradients") in directory [16929 38865]
updated to point to [16932 38875]
/modulesrelocate_dir: Moving [16932 16945 0x0 SD (0)] to [16932 38876
0x0 SD (0)]
relocate_dir: Moving [16932 16945 0x1 DIR (3)] to [16932 38876 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38876]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38876] ("modules") in directory [16929 38865] updated
to point to [16932 38876]
/gflarerelocate_dir: Moving [16932 16949 0x0 SD (0)] to [16932 38877 0x0 SD=
 (0)]
relocate_dir: Moving [16932 16949 0x1 DIR (3)] to [16932 38877 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38877]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38877] ("gflare") in directory [16929 38865] updated
to point to [16932 38877]
/fractalexplorerrelocate_dir: Moving [16932 16951 0x0 SD (0)] to
[16932 38878 0x0 SD (0)]
relocate_dir: Moving [16932 16951 0x1 DIR (3)] to [16932 38878 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38878]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38878] ("fractalexplorer") in directory [16929 38865]
updated to point to [16932 38878]
/levelsrelocate_dir: Moving [16932 16946 0x0 SD (0)] to [16932 38879 0x0 SD=
 (0)]
relocate_dir: Moving [16932 16946 0x1 DIR (3)] to [16932 38879 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38879]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38879] ("levels") in directory [16929 38865] updated
to point to [16932 38879]
/themesrelocate_dir: Moving [16932 16938 0x0 SD (0)] to [16932 38880 0x0 SD=
 (0)]
relocate_dir: Moving [16932 16938 0x1 DIR (3)] to [16932 38880 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38880]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38880] ("themes") in directory [16929 38865] updated
to point to [16932 38880]
/gimpressionistrelocate_dir: Moving [16932 16948 0x0 SD (0)] to [16932
38881 0x0 SD (0)]
relocate_dir: Moving [16932 16948 0x1 DIR (3)] to [16932 38881 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38881]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38881] ("gimpressionist") in directory [16929 38865]
updated to point to [16932 38881]
/brushesrelocate_dir: Moving [16932 16955 0x0 SD (0)] to [16932 38882
0x0 SD (0)]
relocate_dir: Moving [16932 16955 0x1 DIR (3)] to [16932 38882 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38882]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38882] ("brushes") in directory [16929 38865] updated
to point to [16932 38882]
/plug-insrelocate_dir: Moving [16932 16942 0x0 SD (0)] to [16932 38883
0x0 SD (0)]
relocate_dir: Moving [16932 16942 0x1 DIR (3)] to [16932 38883 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38883]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38883] ("plug-ins") in directory [16929 38865]
updated to point to [16932 38883]
/templatesrelocate_dir: Moving [16932 16940 0x0 SD (0)] to [16932
38884 0x0 SD (0)]
relocate_dir: Moving [16932 16940 0x1 DIR (3)] to [16932 38884 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16932 38884]
pointes to [16929 16932], instead of [16929 38865] - corrected
The entry [16932 38884] ("templates") in directory [16929 38865]
updated to point to [16932 38884]
The entry [16929 38865] (".gimp-2.2") in directory [16928 38861]
updated to point to [16929 38865]
/public_htmlrelocate_dir: Moving [16929 16958 0x0 SD (0)] to [16929
38885 0x0 SD (0)]
relocate_dir: Moving [16929 16958 0x1 DIR (3)] to [16929 38885 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16929 38885]
pointes to [16928 16929], instead of [16928 38861] - corrected
The entry [16929 38885] ("public_html") in directory [16928 38861]
updated to point to [16929 38885]
/vmwarerelocate_dir: Moving [16929 16957 0x0 SD (0)] to [16929 38886 0x0 SD=
 (0)]
relocate_dir: Moving [16929 16957 0x1 DIR (3)] to [16929 38886 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16929 38886]
pointes to [16928 16929], instead of [16928 38861] - corrected
The entry [16929 38886] ("vmware") in directory [16928 38861] updated
to point to [16929 38886]
The entry [16928 38861] ("martin") in directory [8 38860] updated to
point to [16928 38861]
The entry [8 38860] ("08") in directory [3 38818] updated to point to [8 38=
860]
/09relocate_dir: Moving [8 16961 0x0 SD (0)] to [8 38887 0x0 SD (0)]
relocate_dir: Moving [8 16961 0x1 DIR (3)] to [8 38887 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [8 38887]
pointes to [3 8], instead of [3 38818] - corrected
/martinrelocate_dir: Moving [16961 16962 0x0 SD (0)] to [16961 38888 0x0 SD=
 (0)]
relocate_dir: Moving [16961 16962 0x1 DIR (3)] to [16961 38888 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16961 38888]
pointes to [8 16961], instead of [8 38887] - corrected
The entry [16961 38888] ("martin") in directory [8 38887] updated to
point to [16961 38888]
The entry [8 38887] ("09") in directory [3 38818] updated to point to [8 38=
887]
/10relocate_dir: Moving [8 16964 0x0 SD (0)] to [8 38889 0x0 SD (0)]
relocate_dir: Moving [8 16964 0x1 DIR (3)] to [8 38889 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [8 38889]
pointes to [3 8], instead of [3 38818] - corrected
/martinrelocate_dir: Moving [16964 16965 0x0 SD (0)] to [16964 38890 0x0 SD=
 (0)]
relocate_dir: Moving [16964 16965 0x1 DIR (3)] to [16964 38890 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [16964 38890]
pointes to [8 16964], instead of [8 38889] - corrected
The entry [16964 38890] ("martin") in directory [8 38889] updated to
point to [16964 38890]
The entry [8 38889] ("10") in directory [3 38818] updated to point to [8 38=
889]
/11get_next_directory_item: The entry ".." of the directory [8 14384]
pointes to [3 8], instead of [3 38818] - corrected
/2005/11/12get_next_directory_item: The entry ".." of the directory [8
33436] pointes to [3 8], instead of [3 38818] - corrected
/2005/11/13get_next_directory_item: The entry ".." of the directory [8
35328] pointes to [3 8], instead of [3 38818] - corrected
/2005/11/15get_next_directory_item: The entry ".." of the directory [8
37216] pointes to [3 8], instead of [3 38818] - corrected
... /11/15/martin/.mozilla-thunderbird/283pn7o5.default/Mail/Local
Folders/Sentvpf-10680: The file [38789 38815] has the wrong block
count in the StatData (37680) - corrected to (37184)
/2005/11/15/martin/.mozilla-thunderbird/283pn7o5.default/Mail/Local
Foldersrebuild_semantic_pass: The entry [38789 38827] ("Inbox.msf") in
directory [38690 38789] points to nowhere - is removed
/2005/11/15/martin/.mozilla-thunderbird/283pn7o5.default/Mail/Local
Foldersrebuild_semantic_pass: The entry [38789 38820] ("Inbox.sbd") in
directory [38690 38789] points to nowhere - is removed
/2005/11/15/martin/.mozilla-thunderbird/283pn7o5.default/Mail/Local
Foldersrebuild_semantic_pass: The entry [38789 38828] ("Inbox") in
directory [38690 38789] points to nowhere - is removed
/2005/11/15/martin/.mozilla-thunderbird/283pn7o5.default/Mail/Local
Foldersrebuild_semantic_pass: The entry [38789 38816] ("ML.sbd") in
directory [38690 38789] points to nowhere - is removed
/2005/11/15/martin/.mozilla-thunderbird/283pn7o5.default/Mail/Local
Foldersvpf-10650: The directory [38690 38789] has the wrong size in
the StatData (1360) - corrected to (1248)
/2005/11/16relocate_dir: Moving [8 38809 0x0 SD (0)] to [8 38891 0x0 SD (0)=
]
relocate_dir: Moving [8 38809 0x1 DIR (3)] to [8 38891 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [8 38891]
pointes to [3 8], instead of [3 38818] - corrected
The entry [8 38891] ("16") in directory [3 38818] updated to point to [8 38=
891]
/17relocate_dir: Moving [8 38811 0x0 SD (0)] to [8 38892 0x0 SD (0)]
relocate_dir: Moving [8 38811 0x1 DIR (3)] to [8 38892 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [8 38892]
pointes to [3 8], instead of [3 38818] - corrected
The entry [8 38892] ("17") in directory [3 38818] updated to point to [8 38=
892]
/18relocate_dir: Moving [8 38813 0x0 SD (0)] to [8 38893 0x0 SD (0)]
relocate_dir: Moving [8 38813 0x1 DIR (3)] to [8 38893 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [8 38893]
pointes to [3 8], instead of [3 38818] - corrected
The entry [8 38893] ("18") in directory [3 38818] updated to point to [8 38=
893]
/21relocate_dir: Moving [8 38815 0x0 SD (0)] to [8 38894 0x0 SD (0)]
relocate_dir: Moving [8 38815 0x1 DIR (3)] to [8 38894 0x1 DIR (3)]
get_next_directory_item: The entry ".." of the directory [8 38894]
pointes to [3 8], instead of [3 38818] - corrected
The entry [8 38894] ("21") in directory [3 38818] updated to point to [8 38=
894]
/22get_next_directory_item: The entry ".." of the directory [8 38817]
pointes to [3 8], instead of [3 38818] - corrected
/23get_next_directory_item: The entry ".." of the directory [8 38819]
pointes to [3 8], instead of [3 38818] - corrected
The entry [3 38818] ("11") in directory [2 3] updated to point to [3 38818]
/lost+foundvpf-10680: The directory [2 418896] has the wrong block
count in the StatData (42) - corrected to (1)vpf-10650: The directory
[2 418896] has the wrong size in the StatData (21392) - corrected to
(48)
Flushing..finished
        Files found: 452456
        Directories found: 330869
        Symlinks found: 25928
        Names pointing to nowhere (removed): 4
        Objects having used objectids: 67
                files fixed 1
                dirs fixed 66
Pass 3a (looking for lost dir/files):
####### Pass 3a (lost+found pass) #########
Looking for lost directories:
Looking for lost files:7 /sec
Flushing..finished60, 85 /sec
        Objects without names 668
        Empty lost dirs removed 10
        Dirs linked to /lost+found: 663
        Files linked to /lost+found 5
Pass 4 - finisheddone 161812, 100 /sec
        Deleted unreachable items 16
Flushing..finished
Syncing..finished
###########
reiserfsck finished at Thu Nov 24 11:45:47 2005
###########

thanks :)

--
Martin Sarsale - martin@malditainternet.com
