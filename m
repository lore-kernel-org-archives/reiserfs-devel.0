From: "Robert Harnaga" <rh@GriffinRUN.com>
Subject: why --rebuilt-tree says it's correcting errors but then those same exact errors show up again and again
Date: Sat, 22 Jan 2005 07:06:07 -0500
Message-ID: <196f01c5007a$c13fef50$6514a8c0@tower>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_196C_01C50050.D81D7500"
Return-path: <reiserfs-list-return-23190-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_196C_01C50050.D81D7500
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have a question about why --rebuilt-tree says it's correcting errors =
but then those same exact errors show up again and again after an =
immediate rerun and after a clean reboot.=20

I'm running SUSE 9.2 in 64-bit mode with reiserfsck 3.6.18.  I'm running =
with 15k RPM SCSI drives. Any ideas on how to get rebuild-tree to really =
correct the errors and keep them correct after boot?


Details below...

    Run #1: After rebooting into single user mode, I ran fsck.reiserfs =
--rebuild-tree and got ERRORS
    =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

    (none):~ # fsck.reiserfs --rebuild-tree /dev/sda4 -q
    reiserfsck 3.6.18 (2003 www.namesys.com)

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

    Will rebuild the filesystem (/dev/sda4) tree
    Will put log info to 'stdout'

    Do you want to run this program?[N/Yes] (note need to type Yes if =
you do):Yes
    Replaying journal..
    Reiserfs journal '/dev/sda4' in blocks [18..8211]: 0 transactions =
replayed
    ###########
    reiserfsck --rebuild-tree started at Sat Jan 22 05:19:17 2005
    ###########

    Pass 0:
    ####### Pass 0 #######
    Loading on-disk bitmap .. ok, 5757257 blocks marked used
    Skipping 8451 blocks (super block, journal, bitmaps) 5748806 blocks =
will be read
    0%.block 348919: The number of items (256) is incorrect, should be =
(1) - corrected
    block 348919: The free space (0) is incorrect, should be (4048) - =
corrected
    pass0: block 348919, item 0: StatData item of wrong length found =
1065353216 10 0x0 SD (0), len 0, location 4096 entry count 7680, fsck =
need 0, format BAD - deleted
    block 487094: The number of items (256) is incorrect, should be (1) =
- corrected
    block 487094: The free space (0) is incorrect, should be (4048) - =
corrected
    pass0: block 487094, item 0: StatData item of wrong length found =
1065353216 10 0x0 SD (0), len 0, location 4096 entry count 7680, fsck =
need 0, format BAD - deleted
    ...20%..block 2292973: The free space (49543) is incorrect, should =
be (4072) - corrected
    block 2297198: The free space (17616) is incorrect, should be (4072) =
- corrected
    block 2323041: The free space (18732) is incorrect, should be (4072) =
- corrected
    block 2328937: The free space (8242) is incorrect, should be (4072) =
- corrected
    block 2348193: The free space (54727) is incorrect, should be (4072) =
- corrected
    block 2371277: The number of items (12544) is incorrect, should be =
(1) - corrected
    block 2371277: The free space (35830) is incorrect, should be (4048) =
- corrected
    pass0: vpf-10110: block 2371277, item (0): Unknown item type found =
[3770748138 969408772 0x23740850 ??? (15)] - deleted
    ..40%block 3460718: The free space (11016) is incorrect, should be =
(4072) - corrected
    ..block 4104106: The number of items (63) is incorrect, should be =
(1) - corrected
    block 4104106: The free space (65280) is incorrect, should be (4048) =
- corrected
    pass0: vpf-10110: block 4104106, item (0): Unknown item type found =
[33488897 130816 0xff0001ff ??? (15)] - deleted
    block 4115015: The free space (2647) is incorrect, should be (4072) =
- corrected
    block 4179064: The free space (0) is incorrect, should be (4072) - =
corrected
    ..60%....80%...block 7583485: The number of items (33808) is =
incorrect, should be (1) - corrected
    block 7583485: The free space (0) is incorrect, should be (4048) - =
corrected
    pass0: vpf-10110: block 7583485, item (0): Unknown item type found =
[16799326 16777472 0x5e5000021042210 ??? (6)] - deleted
    .100%
    147053 directory entries were hashed with "r5" hash.
            "r5" hash is selected
    Flushing..finished
            Read blocks (but not data blocks) 5748806
                    Leaves among those 18655
                            - leaves all contents of which could not be =
saved and deleted 13
                    Objectids found 147055

    Pass 1 (will try to insert 18642 leaves):
    ####### Pass 1 #######
    Looking for allocable blocks .. finished
    0%....20%....40%....60%....80%....100%
    Flushing..finished
            18642 leaves read
                    18575 inserted
                    67 not inserted
    ####### Pass 2 #######

    Pass 2:
    0%....20%....40%....60%....80%....100%
    Flushing..finished
            Leaves inserted item by item 67
    Pass 3 (semantic):
    ####### Pass 3 #########
    Flushing..finished
            Files found: 62444
            Directories found: 6304
            Symlinks found: 78293
            Others: 13
    Pass 3a (looking for lost dir/files):
    ####### Pass 3a (lost+found pass) #########
    Looking for lost directories:
    Flushing..finished
    Pass 4 - finished
    Flushing..finished
    Syncing..finished
    ###########
    reiserfsck finished at Sat Jan 22 05:25:54 2005
    ###########
    (none):~ #=20




  Run #2: As a test to see if it fixed it, I did a 2nd single user mode =
reboot, I ran fsck.reiserfs --rebuild-tree =3D> ERRORS again (same ones)
  =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
    (none):~ # fsck.reiserfs --rebuild-tree /dev/sda4 -q
    reiserfsck 3.6.18 (2003 www.namesys.com)

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

    Will rebuild the filesystem (/dev/sda4) tree
    Will put log info to 'stdout'

    Do you want to run this program?[N/Yes] (note need to type Yes if =
you do):Yes
    Replaying journal..
    Reiserfs journal '/dev/sda4' in blocks [18..8211]: 0 transactions =
replayed
    ###########
    reiserfsck --rebuild-tree started at Sat Jan 22 05:30:10 2005
    ###########

    Pass 0:
    ####### Pass 0 #######
    Loading on-disk bitmap .. ok, 5757259 blocks marked used
    Skipping 8451 blocks (super block, journal, bitmaps) 5748808 blocks =
will be read
    0%.block 348919: The number of items (256) is incorrect, should be =
(1) - corrected
    block 348919: The free space (0) is incorrect, should be (4048) - =
corrected
    pass0: block 348919, item 0: StatData item of wrong length found =
1065353216 10 0x0 SD (0), len 0, location 4096 entry count 7680, fsck =
need 0, format BAD - deleted
    block 487094: The number of items (256) is incorrect, should be (1) =
- corrected
    block 487094: The free space (0) is incorrect, should be (4048) - =
corrected
    pass0: block 487094, item 0: StatData item of wrong length found =
1065353216 10 0x0 SD (0), len 0, location 4096 entry count 7680, fsck =
need 0, format BAD - deleted
    ...20%..block 2292973: The free space (49543) is incorrect, should =
be (4072) - corrected
    block 2297198: The free space (17616) is incorrect, should be (4072) =
- corrected
    block 2323041: The free space (18732) is incorrect, should be (4072) =
- corrected
    block 2328937: The free space (8242) is incorrect, should be (4072) =
- corrected
    block 2348193: The free space (54727) is incorrect, should be (4072) =
- corrected
    block 2371277: The number of items (12544) is incorrect, should be =
(1) - corrected
    block 2371277: The free space (35830) is incorrect, should be (4048) =
- corrected
    pass0: vpf-10110: block 2371277, item (0): Unknown item type found =
[3770748138 969408772 0x23740850 ??? (15)] - deleted
    ..40%block 3460718: The free space (11016) is incorrect, should be =
(4072) - corrected
    ..block 4104106: The number of items (63) is incorrect, should be =
(1) - corrected
    block 4104106: The free space (65280) is incorrect, should be (4048) =
- corrected
    pass0: vpf-10110: block 4104106, item (0): Unknown item type found =
[33488897 130816 0xff0001ff ??? (15)] - deleted
    block 4115015: The free space (2647) is incorrect, should be (4072) =
- corrected
    block 4179064: The free space (0) is incorrect, should be (4072) - =
corrected
    ..60%....80%...block 7583485: The number of items (33808) is =
incorrect, should be (1) - corrected
    block 7583485: The free space (0) is incorrect, should be (4048) - =
corrected
    pass0: vpf-10110: block 7583485, item (0): Unknown item type found =
[16799326 16777472 0x5e5000021042210 ??? (6)] - deleted
    .100%
    147053 directory entries were hashed with "r5" hash.
            "r5" hash is selected
    Flushing..finished
            Read blocks (but not data blocks) 5748808
                    Leaves among those 18653
                            - leaves all contents of which could not be =
saved and deleted 13
                    Objectids found 147055

    Pass 1 (will try to insert 18640 leaves):
    ####### Pass 1 #######
    Looking for allocable blocks .. finished
    0%....20%....40%....60%....80%....100%
    Flushing..finished
            18640 leaves read
                    18586 inserted
                    54 not inserted
    ####### Pass 2 #######

    Pass 2:
    0%....20%....40%....60%....80%....100%
    Flushing..finished
            Leaves inserted item by item 54
    Pass 3 (semantic):
    ####### Pass 3 #########
    Flushing..finished
            Files found: 62444
            Directories found: 6304
            Symlinks found: 78293
            Others: 13
    Pass 3a (looking for lost dir/files):
    ####### Pass 3a (lost+found pass) #########
    Looking for lost directories:
    Flushing..finished
    Pass 4 - finished
    Flushing..finished
    Syncing..finished
    ###########
    reiserfsck finished at Sat Jan 22 05:36:46 2005
    ###########
    (none):~ #



  Run #3: After 3rd single user mode reboot, I ran fsck.reiserfs --check =
=3D> OK, fsck.reiserfs --fix-fixable =3D> OK, fsck.reiserfs =
--rebuild-tree =3D> ERRORS
  =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
    (none):~ # fsck.reiserfs /dev/sda4 -q
    reiserfsck 3.6.18 (2003 www.namesys.com)

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

    Will read-only check consistency of the filesystem on /dev/sda4
    Will put log info to 'stdout'

    Do you want to run this program?[N/Yes] (note need to type Yes if =
you do):Yes
    ###########
    reiserfsck --check started at Sat Jan 22 05:41:43 2005
    ###########
    Replaying journal..
    Reiserfs journal '/dev/sda4' in blocks [18..8211]: 0 transactions =
replayed
    Checking internal tree..finished
    Comparing bitmaps..finished
    Checking Semantic tree:
    finished
    No corruptions found
    There are on the filesystem:
            Leaves 18637
            Internal nodes 130
            Directories 6304
            Other files 140750
            Data block pointers 5730036 (0 of them are zero)
            Safe links 0
    ###########
    reiserfsck finished at Sat Jan 22 05:42:10 2005
    ###########
    (none):~ # fsck.reiserfs --fix-fixable /dev/sda4 -q
    reiserfsck 3.6.18 (2003 www.namesys.com)

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

    Will check consistency of the filesystem on /dev/sda4
    and will fix what can be fixed without --rebuild-tree
    Will put log info to 'stdout'

    Do you want to run this program?[N/Yes] (note need to type Yes if =
you do):Yes
    ###########
    reiserfsck --fix-fixable started at Sat Jan 22 05:42:51 2005
    ###########
    Replaying journal..
    Reiserfs journal '/dev/sda4' in blocks [18..8211]: 0 transactions =
replayed
    Checking internal tree..finished
    Comparing bitmaps..finished
    Checking Semantic tree:
    finished
    No corruptions found
    There are on the filesystem:
            Leaves 18637
            Internal nodes 130
            Directories 6304
            Other files 140750
            Data block pointers 5730036 (0 of them are zero)
            Safe links 0
    ###########
    reiserfsck finished at Sat Jan 22 05:43:19 2005
    ###########

    (none):~ # fsck.reiserfs --rebuild-tree /dev/sda4 -q
    reiserfsck 3.6.18 (2003 www.namesys.com)

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

    Will rebuild the filesystem (/dev/sda4) tree
    Will put log info to 'stdout'

    Do you want to run this program?[N/Yes] (note need to type Yes if =
you do):Yes
    Replaying journal..
    Reiserfs journal '/dev/sda4' in blocks [18..8211]: 0 transactions =
replayed
    ###########
    reiserfsck --rebuild-tree started at Sat Jan 22 05:43:41 2005
    ###########

    Pass 0:
    ####### Pass 0 #######
    Loading on-disk bitmap .. ok, 5757254 blocks marked used
    Skipping 8451 blocks (super block, journal, bitmaps) 5748803 blocks =
will be read
    0%.block 348919: The number of items (256) is incorrect, should be =
(1) - corrected
    block 348919: The free space (0) is incorrect, should be (4048) - =
corrected
    pass0: block 348919, item 0: StatData item of wrong length found =
1065353216 10 0x0 SD (0), len 0, location 4096 entry count 7680, fsck =
need 0, format BAD - deleted
    block 487094: The number of items (256) is incorrect, should be (1) =
- corrected
    block 487094: The free space (0) is incorrect, should be (4048) - =
corrected
    pass0: block 487094, item 0: StatData item of wrong length found =
1065353216 10 0x0 SD (0), len 0, location 4096 entry count 7680, fsck =
need 0, format BAD - deleted
    ...20%..block 2292973: The free space (49543) is incorrect, should =
be (4072) - corrected
    block 2297198: The free space (17616) is incorrect, should be (4072) =
- corrected
    block 2323041: The free space (18732) is incorrect, should be (4072) =
- corrected
    block 2328937: The free space (8242) is incorrect, should be (4072) =
- corrected
    block 2348193: The free space (54727) is incorrect, should be (4072) =
- corrected
    block 2371277: The number of items (12544) is incorrect, should be =
(1) - corrected
    block 2371277: The free space (35830) is incorrect, should be (4048) =
- corrected
    pass0: vpf-10110: block 2371277, item (0): Unknown item type found =
[3770748138 969408772 0x23740850 ??? (15)] - deleted
    ..40%block 3460718: The free space (11016) is incorrect, should be =
(4072) - corrected
    ..block 4104106: The number of items (63) is incorrect, should be =
(1) - corrected
    block 4104106: The free space (65280) is incorrect, should be (4048) =
- corrected
    pass0: vpf-10110: block 4104106, item (0): Unknown item type found =
[33488897 130816 0xff0001ff ??? (15)] - deleted
    block 4115015: The free space (2647) is incorrect, should be (4072) =
- corrected
    block 4179064: The free space (0) is incorrect, should be (4072) - =
corrected
    ..60%....80%...block 7583485: The number of items (33808) is =
incorrect, should be (1) - corrected
    block 7583485: The free space (0) is incorrect, should be (4048) - =
corrected
    pass0: vpf-10110: block 7583485, item (0): Unknown item type found =
[16799326 16777472 0x5e5000021042210 ??? (6)] - deleted
    .100%
    147053 directory entries were hashed with "r5" hash.
            "r5" hash is selected
    Flushing..finished
            Read blocks (but not data blocks) 5748803
                    Leaves among those 18650
                            - leaves all contents of which could not be =
saved and deleted 13
                    Objectids found 147055

    Pass 1 (will try to insert 18637 leaves):
    ####### Pass 1 #######
    Looking for allocable blocks .. finished
    0%....20%....40%....60%....80%....100%
    Flushing..finished
            18637 leaves read
                    18591 inserted
                    46 not inserted
    ####### Pass 2 #######

    Pass 2:
    0%....20%....40%....60%....80%....100%
    Flushing..finished
            Leaves inserted item by item 46
    Pass 3 (semantic):
    ####### Pass 3 #########
    Flushing..finished
            Files found: 62444
            Directories found: 6304
            Symlinks found: 78293
            Others: 13
    Pass 3a (looking for lost dir/files):
    ####### Pass 3a (lost+found pass) #########
    Looking for lost directories:
    Flushing..finished
    Pass 4 - finished
    Flushing..finished
    Syncing..finished
    ###########
    reiserfsck finished at Sat Jan 22 05:50:19 2005
    ###########
    (none):~ #



  Also, further testing on a 2nd mirror copied disk shows the same exact =
errors even after I run it twice in a row.


Best Regards,
Rob

--
Robert Harnaga
www.GriffinRUN.com
Game server hosting for serious players

------=_NextPart_000_196C_01C50050.D81D7500
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1479" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff><FONT face=3DArial size=3D2>
<DIV>I have a question about why --rebuilt-tree says it's correcting =
errors but=20
then those same exact errors show up again and again after an immediate =
rerun=20
and after a clean reboot. </DIV>
<DIV>&nbsp;</DIV>
<DIV>I'm running SUSE 9.2 in 64-bit mode with reiserfsck 3.6.18.&nbsp; =
I'm=20
running with 15k RPM SCSI drives. Any ideas on how to get rebuild-tree =
to really=20
correct the errors and keep them correct after boot?</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Details below...</DIV>
<DIV>&nbsp;</DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV>
  <BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
    <DIV><STRONG><U>Run #1: After&nbsp;rebooting into single user mode,=20
    I&nbsp;ran fsck.reiserfs --rebuild-tree and got =
ERRORS</U></STRONG></DIV>
    =
<DIV>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>(none):~ # fsck.reiserfs --rebuild-tree /dev/sda4 =
-q<BR>reiserfsck=20
    3.6.18 (2003 <A =
href=3D"http://www.namesys.com/">www.namesys.com</A>)</DIV>
    <DIV>&nbsp;</DIV>
    =
<DIV>*************************************************************<BR>** =
Do=20
    not&nbsp; run&nbsp; the&nbsp; program&nbsp; with&nbsp; =
--rebuild-tree&nbsp;=20
    unless **<BR>** something is broken and MAKE A BACKUP&nbsp; before =
using it.=20
    **<BR>** If you have bad sectors on a drive&nbsp; it is usually a =
bad=20
    **<BR>** idea to continue using it. Then you probably should get =
**<BR>** a=20
    working hard drive, copy the file system from the bad **<BR>** =
drive&nbsp;=20
    to the good one -- dd_rescue is&nbsp; a good tool for **<BR>** that =
-- and=20
    only then run this=20
    =
program.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    **<BR>** If you are using the latest reiserfsprogs and&nbsp; it =
fails=20
    **<BR>** please&nbsp; email bug reports to <A=20
    =
href=3D"mailto:reiserfs-list@namesys.com">reiserfs-list@namesys.com</A>, =

    **<BR>** providing&nbsp; as&nbsp; much&nbsp; information&nbsp; =
as&nbsp;=20
    possible --&nbsp; your **<BR>** hardware,&nbsp; kernel,&nbsp; =
patches,&nbsp;=20
    settings,&nbsp; all reiserfsck **<BR>** messages&nbsp; (including=20
    version),&nbsp; the reiserfsck logfile, **<BR>** check&nbsp; =
the&nbsp;=20
    syslog file&nbsp; for&nbsp; any&nbsp; related information. **<BR>** =
If you=20
    would like advice on using this program, support **<BR>** is =
available&nbsp;=20
    for $25 at&nbsp; <A=20
    =
href=3D"http://www.namesys.com/support.html">www.namesys.com/support.html=
</A>.=20
    =
**<BR>*************************************************************</DIV>=

    <DIV>&nbsp;</DIV>
    <DIV>Will rebuild the filesystem (/dev/sda4) tree<BR>Will put log =
info to=20
    'stdout'</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Do you want to run this program?[N/Yes] (note need to type Yes =
if you=20
    do):Yes<BR>Replaying journal..<BR>Reiserfs journal '/dev/sda4' in =
blocks=20
    [18..8211]: 0 transactions replayed<BR>###########<BR>reiserfsck=20
    --rebuild-tree started at Sat Jan 22 05:19:17 =
2005<BR>###########</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Pass 0:<BR>####### Pass 0 #######<BR>Loading on-disk bitmap .. =
ok,=20
    5757257 blocks marked used<BR>Skipping 8451 blocks (super block, =
journal,=20
    bitmaps) 5748806 blocks will be read<BR>0%.block 348919: The number =
of items=20
    (256) is incorrect, should be (1) - corrected<BR>block 348919: The =
free=20
    space (0) is incorrect, should be (4048) - corrected<BR>pass0: block =
348919,=20
    item 0: StatData item of wrong length found 1065353216 10 0x0 SD =
(0), len 0,=20
    location 4096 entry count 7680, fsck need 0, format BAD - =
deleted<BR>block=20
    487094: The number of items (256) is incorrect, should be (1) -=20
    corrected<BR>block 487094: The free space (0) is incorrect, should =
be (4048)=20
    - corrected<BR>pass0: block 487094, item 0: StatData item of wrong =
length=20
    found 1065353216 10 0x0 SD (0), len 0, location 4096 entry count =
7680, fsck=20
    need 0, format BAD - deleted<BR>...20%..block 2292973: The free =
space=20
    (49543) is incorrect, should be (4072) - corrected<BR>block 2297198: =
The=20
    free space (17616) is incorrect, should be (4072) - =
corrected<BR>block=20
    2323041: The free space (18732) is incorrect, should be (4072) -=20
    corrected<BR>block 2328937: The free space (8242) is incorrect, =
should be=20
    (4072) - corrected<BR>block 2348193: The free space (54727) is =
incorrect,=20
    should be (4072) - corrected<BR>block 2371277: The number of items =
(12544)=20
    is incorrect, should be (1) - corrected<BR>block 2371277: The free =
space=20
    (35830) is incorrect, should be (4048) - corrected<BR>pass0: =
vpf-10110:=20
    block 2371277, item (0): Unknown item type found [3770748138 =
969408772=20
    0x23740850 ??? (15)] - deleted<BR>..40%block 3460718: The free space =
(11016)=20
    is incorrect, should be (4072) - corrected<BR>..block 4104106: The =
number of=20
    items (63) is incorrect, should be (1) - corrected<BR>block 4104106: =
The=20
    free space (65280) is incorrect, should be (4048) - =
corrected<BR>pass0:=20
    vpf-10110: block 4104106, item (0): Unknown item type found =
[33488897 130816=20
    0xff0001ff ??? (15)] - deleted<BR>block 4115015: The free space =
(2647) is=20
    incorrect, should be (4072) - corrected<BR>block 4179064: The free =
space (0)=20
    is incorrect, should be (4072) - corrected<BR>..60%....80%...block =
7583485:=20
    The number of items (33808) is incorrect, should be (1) - =
corrected<BR>block=20
    7583485: The free space (0) is incorrect, should be (4048) -=20
    corrected<BR>pass0: vpf-10110: block 7583485, item (0): Unknown item =
type=20
    found [16799326 16777472 0x5e5000021042210 ??? (6)] -=20
    deleted<BR>.100%<BR>147053 directory entries were hashed with "r5"=20
    hash.<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "r5" hash is=20
    =
selected<BR>Flushing..finished<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;=20
    Read blocks (but not data blocks)=20
    =
5748806<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    Leaves among those=20
    =
18655<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
    - leaves all contents of which could not be saved and deleted=20
    =
13<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=20
    Objectids found 147055</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Pass 1 (will try to insert 18642 leaves):<BR>####### Pass 1=20
    #######<BR>Looking for allocable blocks ..=20
    =
finished<BR>0%....20%....40%....60%....80%....100%<BR>Flushing..finished<=
BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    18642 leaves=20
    =
read<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;=20
    18575=20
    =
inserted<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    67 not inserted<BR>####### Pass 2 #######</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Pass=20
    =
2:<BR>0%....20%....40%....60%....80%....100%<BR>Flushing..finished<BR>&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    Leaves inserted item by item 67<BR>Pass 3 (semantic):<BR>####### =
Pass 3=20
    =
#########<BR>Flushing..finished<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
    Files found: 62444<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Directories=20
    found: 6304<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Symlinks =
found:=20
    78293<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Others: =
13<BR>Pass 3a=20
    (looking for lost dir/files):<BR>####### Pass 3a (lost+found pass)=20
    #########<BR>Looking for lost =
directories:<BR>Flushing..finished<BR>Pass 4 -=20
    =
finished<BR>Flushing..finished<BR>Syncing..finished<BR>###########<BR>rei=
serfsck=20
    finished at Sat Jan 22 05:25:54 2005<BR>###########<BR>(none):~ #=20
  </DIV></BLOCKQUOTE>
  <DIV>&nbsp;</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>
  <DIV><STRONG><U>Run #2: As a test to see if it fixed it, I did a 2nd =
single=20
  user mode reboot, I&nbsp;ran fsck.reiserfs --rebuild-tree =3D&gt; =
ERRORS again=20
  (same ones)</U></STRONG></DIV>
  =
<DIV>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D</DIV></DIV>
  <BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
    <DIV>(none):~ # fsck.reiserfs --rebuild-tree /dev/sda4 =
-q<BR>reiserfsck=20
    3.6.18 (2003 <A =
href=3D"http://www.namesys.com/">www.namesys.com</A>)</DIV>
    <DIV>&nbsp;</DIV>
    =
<DIV>*************************************************************<BR>** =
Do=20
    not&nbsp; run&nbsp; the&nbsp; program&nbsp; with&nbsp; =
--rebuild-tree&nbsp;=20
    unless **<BR>** something is broken and MAKE A BACKUP&nbsp; before =
using it.=20
    **<BR>** If you have bad sectors on a drive&nbsp; it is usually a =
bad=20
    **<BR>** idea to continue using it. Then you probably should get =
**<BR>** a=20
    working hard drive, copy the file system from the bad **<BR>** =
drive&nbsp;=20
    to the good one -- dd_rescue is&nbsp; a good tool for **<BR>** that =
-- and=20
    only then run this=20
    =
program.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    **<BR>** If you are using the latest reiserfsprogs and&nbsp; it =
fails=20
    **<BR>** please&nbsp; email bug reports to <A=20
    =
href=3D"mailto:reiserfs-list@namesys.com">reiserfs-list@namesys.com</A>, =

    **<BR>** providing&nbsp; as&nbsp; much&nbsp; information&nbsp; =
as&nbsp;=20
    possible --&nbsp; your **<BR>** hardware,&nbsp; kernel,&nbsp; =
patches,&nbsp;=20
    settings,&nbsp; all reiserfsck **<BR>** messages&nbsp; (including=20
    version),&nbsp; the reiserfsck logfile, **<BR>** check&nbsp; =
the&nbsp;=20
    syslog file&nbsp; for&nbsp; any&nbsp; related information. **<BR>** =
If you=20
    would like advice on using this program, support **<BR>** is =
available&nbsp;=20
    for $25 at&nbsp; <A=20
    =
href=3D"http://www.namesys.com/support.html">www.namesys.com/support.html=
</A>.=20
    =
**<BR>*************************************************************</DIV>=

    <DIV>&nbsp;</DIV>
    <DIV>Will rebuild the filesystem (/dev/sda4) tree<BR>Will put log =
info to=20
    'stdout'</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Do you want to run this program?[N/Yes] (note need to type Yes =
if you=20
    do):Yes<BR>Replaying journal..<BR>Reiserfs journal '/dev/sda4' in =
blocks=20
    [18..8211]: 0 transactions replayed<BR>###########<BR>reiserfsck=20
    --rebuild-tree started at Sat Jan 22 05:30:10 =
2005<BR>###########</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Pass 0:<BR>####### Pass 0 #######<BR>Loading on-disk bitmap .. =
ok,=20
    5757259 blocks marked used<BR>Skipping 8451 blocks (super block, =
journal,=20
    bitmaps) 5748808 blocks will be read<BR>0%.block 348919: The number =
of items=20
    (256) is incorrect, should be (1) - corrected<BR>block 348919: The =
free=20
    space (0) is incorrect, should be (4048) - corrected<BR>pass0: block =
348919,=20
    item 0: StatData item of wrong length found 1065353216 10 0x0 SD =
(0), len 0,=20
    location 4096 entry count 7680, fsck need 0, format BAD - =
deleted<BR>block=20
    487094: The number of items (256) is incorrect, should be (1) -=20
    corrected<BR>block 487094: The free space (0) is incorrect, should =
be (4048)=20
    - corrected<BR>pass0: block 487094, item 0: StatData item of wrong =
length=20
    found 1065353216 10 0x0 SD (0), len 0, location 4096 entry count =
7680, fsck=20
    need 0, format BAD - deleted<BR>...20%..block 2292973: The free =
space=20
    (49543) is incorrect, should be (4072) - corrected<BR>block 2297198: =
The=20
    free space (17616) is incorrect, should be (4072) - =
corrected<BR>block=20
    2323041: The free space (18732) is incorrect, should be (4072) -=20
    corrected<BR>block 2328937: The free space (8242) is incorrect, =
should be=20
    (4072) - corrected<BR>block 2348193: The free space (54727) is =
incorrect,=20
    should be (4072) - corrected<BR>block 2371277: The number of items =
(12544)=20
    is incorrect, should be (1) - corrected<BR>block 2371277: The free =
space=20
    (35830) is incorrect, should be (4048) - corrected<BR>pass0: =
vpf-10110:=20
    block 2371277, item (0): Unknown item type found [3770748138 =
969408772=20
    0x23740850 ??? (15)] - deleted<BR>..40%block 3460718: The free space =
(11016)=20
    is incorrect, should be (4072) - corrected<BR>..block 4104106: The =
number of=20
    items (63) is incorrect, should be (1) - corrected<BR>block 4104106: =
The=20
    free space (65280) is incorrect, should be (4048) - =
corrected<BR>pass0:=20
    vpf-10110: block 4104106, item (0): Unknown item type found =
[33488897 130816=20
    0xff0001ff ??? (15)] - deleted<BR>block 4115015: The free space =
(2647) is=20
    incorrect, should be (4072) - corrected<BR>block 4179064: The free =
space (0)=20
    is incorrect, should be (4072) - corrected<BR>..60%....80%...block =
7583485:=20
    The number of items (33808) is incorrect, should be (1) - =
corrected<BR>block=20
    7583485: The free space (0) is incorrect, should be (4048) -=20
    corrected<BR>pass0: vpf-10110: block 7583485, item (0): Unknown item =
type=20
    found [16799326 16777472 0x5e5000021042210 ??? (6)] -=20
    deleted<BR>.100%<BR>147053 directory entries were hashed with "r5"=20
    hash.<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "r5" hash is=20
    =
selected<BR>Flushing..finished<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;=20
    Read blocks (but not data blocks)=20
    =
5748808<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    Leaves among those=20
    =
18653<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
    - leaves all contents of which could not be saved and deleted=20
    =
13<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=20
    Objectids found 147055</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Pass 1 (will try to insert 18640 leaves):<BR>####### Pass 1=20
    #######<BR>Looking for allocable blocks ..=20
    =
finished<BR>0%....20%....40%....60%....80%....100%<BR>Flushing..finished<=
BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    18640 leaves=20
    =
read<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;=20
    18586=20
    =
inserted<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    54 not inserted<BR>####### Pass 2 #######</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Pass=20
    =
2:<BR>0%....20%....40%....60%....80%....100%<BR>Flushing..finished<BR>&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    Leaves inserted item by item 54<BR>Pass 3 (semantic):<BR>####### =
Pass 3=20
    =
#########<BR>Flushing..finished<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
    Files found: 62444<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Directories=20
    found: 6304<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Symlinks =
found:=20
    78293<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Others: =
13<BR>Pass 3a=20
    (looking for lost dir/files):<BR>####### Pass 3a (lost+found pass)=20
    #########<BR>Looking for lost =
directories:<BR>Flushing..finished<BR>Pass 4 -=20
    =
finished<BR>Flushing..finished<BR>Syncing..finished<BR>###########<BR>rei=
serfsck=20
    finished at Sat Jan 22 05:36:46 2005<BR>###########<BR>(none):~=20
  #<BR></DIV></BLOCKQUOTE>
  <DIV><STRONG><U></U></STRONG>&nbsp;</DIV>
  <DIV><STRONG><U></U></STRONG>&nbsp;</DIV>
  <DIV><STRONG><U>Run #3:&nbsp;After 3rd single user mode reboot, =
I&nbsp;ran=20
  fsck.reiserfs --check =3D&gt; OK, fsck.reiserfs --fix-fixable =3D&gt; =
OK,=20
  fsck.reiserfs --rebuild-tree =3D&gt; ERRORS</U></STRONG></DIV>
  =
<DIV>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D</DIV>
  <BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
    <DIV>(none):~ # fsck.reiserfs /dev/sda4 -q<BR>reiserfsck 3.6.18 =
(2003 <A=20
    href=3D"http://www.namesys.com/">www.namesys.com</A>)</DIV>
    <DIV>&nbsp;</DIV>
    =
<DIV>*************************************************************<BR>** =
If=20
    you are using the latest reiserfsprogs and&nbsp; it fails **<BR>**=20
    please&nbsp; email bug reports to <A=20
    =
href=3D"mailto:reiserfs-list@namesys.com">reiserfs-list@namesys.com</A>, =

    **<BR>** providing&nbsp; as&nbsp; much&nbsp; information&nbsp; =
as&nbsp;=20
    possible --&nbsp; your **<BR>** hardware,&nbsp; kernel,&nbsp; =
patches,&nbsp;=20
    settings,&nbsp; all reiserfsck **<BR>** messages&nbsp; (including=20
    version),&nbsp; the reiserfsck logfile, **<BR>** check&nbsp; =
the&nbsp;=20
    syslog file&nbsp; for&nbsp; any&nbsp; related information. **<BR>** =
If you=20
    would like advice on using this program, support **<BR>** is =
available&nbsp;=20
    for $25 at&nbsp; <A=20
    =
href=3D"http://www.namesys.com/support.html">www.namesys.com/support.html=
</A>.=20
    =
**<BR>*************************************************************</DIV>=

    <DIV>&nbsp;</DIV>
    <DIV>Will read-only check consistency of the filesystem on =
/dev/sda4<BR>Will=20
    put log info to 'stdout'</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Do you want to run this program?[N/Yes] (note need to type Yes =
if you=20
    do):Yes<BR>###########<BR>reiserfsck --check started at Sat Jan 22 =
05:41:43=20
    2005<BR>###########<BR>Replaying journal..<BR>Reiserfs journal =
'/dev/sda4'=20
    in blocks [18..8211]: 0 transactions replayed<BR>Checking internal=20
    tree..finished<BR>Comparing bitmaps..finished<BR>Checking Semantic=20
    tree:<BR>finished<BR>No corruptions found<BR>There are on the=20
    filesystem:<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Leaves=20
    18637<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Internal nodes=20
    130<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Directories=20
    6304<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Other files=20
    140750<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Data block =
pointers=20
    5730036 (0 of them are =
zero)<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    Safe links 0<BR>###########<BR>reiserfsck finished at Sat Jan 22 =
05:42:10=20
    2005<BR>###########<BR>(none):~ # fsck.reiserfs --fix-fixable =
/dev/sda4=20
    -q<BR>reiserfsck 3.6.18 (2003 <A=20
    href=3D"http://www.namesys.com/">www.namesys.com</A>)</DIV>
    <DIV>&nbsp;</DIV>
    =
<DIV>*************************************************************<BR>** =
If=20
    you are using the latest reiserfsprogs and&nbsp; it fails **<BR>**=20
    please&nbsp; email bug reports to <A=20
    =
href=3D"mailto:reiserfs-list@namesys.com">reiserfs-list@namesys.com</A>, =

    **<BR>** providing&nbsp; as&nbsp; much&nbsp; information&nbsp; =
as&nbsp;=20
    possible --&nbsp; your **<BR>** hardware,&nbsp; kernel,&nbsp; =
patches,&nbsp;=20
    settings,&nbsp; all reiserfsck **<BR>** messages&nbsp; (including=20
    version),&nbsp; the reiserfsck logfile, **<BR>** check&nbsp; =
the&nbsp;=20
    syslog file&nbsp; for&nbsp; any&nbsp; related information. **<BR>** =
If you=20
    would like advice on using this program, support **<BR>** is =
available&nbsp;=20
    for $25 at&nbsp; <A=20
    =
href=3D"http://www.namesys.com/support.html">www.namesys.com/support.html=
</A>.=20
    =
**<BR>*************************************************************</DIV>=

    <DIV>&nbsp;</DIV>
    <DIV>Will check consistency of the filesystem on /dev/sda4<BR>and =
will fix=20
    what can be fixed without --rebuild-tree<BR>Will put log info to=20
    'stdout'</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Do you want to run this program?[N/Yes] (note need to type Yes =
if you=20
    do):Yes<BR>###########<BR>reiserfsck --fix-fixable started at Sat =
Jan 22=20
    05:42:51 2005<BR>###########<BR>Replaying journal..<BR>Reiserfs =
journal=20
    '/dev/sda4' in blocks [18..8211]: 0 transactions =
replayed<BR>Checking=20
    internal tree..finished<BR>Comparing bitmaps..finished<BR>Checking =
Semantic=20
    tree:<BR>finished<BR>No corruptions found<BR>There are on the=20
    filesystem:<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Leaves=20
    18637<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Internal nodes=20
    130<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Directories=20
    6304<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Other files=20
    140750<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Data block =
pointers=20
    5730036 (0 of them are =
zero)<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    Safe links 0<BR>###########<BR>reiserfsck finished at Sat Jan 22 =
05:43:19=20
    2005<BR>###########<BR></DIV>
    <DIV>(none):~ # fsck.reiserfs --rebuild-tree /dev/sda4 =
-q<BR>reiserfsck=20
    3.6.18 (2003 <A =
href=3D"http://www.namesys.com/">www.namesys.com</A>)</DIV>
    <DIV>&nbsp;</DIV>
    =
<DIV>*************************************************************<BR>** =
Do=20
    not&nbsp; run&nbsp; the&nbsp; program&nbsp; with&nbsp; =
--rebuild-tree&nbsp;=20
    unless **<BR>** something is broken and MAKE A BACKUP&nbsp; before =
using it.=20
    **<BR>** If you have bad sectors on a drive&nbsp; it is usually a =
bad=20
    **<BR>** idea to continue using it. Then you probably should get =
**<BR>** a=20
    working hard drive, copy the file system from the bad **<BR>** =
drive&nbsp;=20
    to the good one -- dd_rescue is&nbsp; a good tool for **<BR>** that =
-- and=20
    only then run this=20
    =
program.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    **<BR>** If you are using the latest reiserfsprogs and&nbsp; it =
fails=20
    **<BR>** please&nbsp; email bug reports to <A=20
    =
href=3D"mailto:reiserfs-list@namesys.com">reiserfs-list@namesys.com</A>, =

    **<BR>** providing&nbsp; as&nbsp; much&nbsp; information&nbsp; =
as&nbsp;=20
    possible --&nbsp; your **<BR>** hardware,&nbsp; kernel,&nbsp; =
patches,&nbsp;=20
    settings,&nbsp; all reiserfsck **<BR>** messages&nbsp; (including=20
    version),&nbsp; the reiserfsck logfile, **<BR>** check&nbsp; =
the&nbsp;=20
    syslog file&nbsp; for&nbsp; any&nbsp; related information. **<BR>** =
If you=20
    would like advice on using this program, support **<BR>** is =
available&nbsp;=20
    for $25 at&nbsp; <A=20
    =
href=3D"http://www.namesys.com/support.html">www.namesys.com/support.html=
</A>.=20
    =
**<BR>*************************************************************</DIV>=

    <DIV>&nbsp;</DIV>
    <DIV>Will rebuild the filesystem (/dev/sda4) tree<BR>Will put log =
info to=20
    'stdout'</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Do you want to run this program?[N/Yes] (note need to type Yes =
if you=20
    do):Yes<BR>Replaying journal..<BR>Reiserfs journal '/dev/sda4' in =
blocks=20
    [18..8211]: 0 transactions replayed<BR>###########<BR>reiserfsck=20
    --rebuild-tree started at Sat Jan 22 05:43:41 =
2005<BR>###########</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Pass 0:<BR>####### Pass 0 #######<BR>Loading on-disk bitmap .. =
ok,=20
    5757254 blocks marked used<BR>Skipping 8451 blocks (super block, =
journal,=20
    bitmaps) 5748803 blocks will be read<BR>0%.block 348919: The number =
of items=20
    (256) is incorrect, should be (1) - corrected<BR>block 348919: The =
free=20
    space (0) is incorrect, should be (4048) - corrected<BR>pass0: block =
348919,=20
    item 0: StatData item of wrong length found 1065353216 10 0x0 SD =
(0), len 0,=20
    location 4096 entry count 7680, fsck need 0, format BAD - =
deleted<BR>block=20
    487094: The number of items (256) is incorrect, should be (1) -=20
    corrected<BR>block 487094: The free space (0) is incorrect, should =
be (4048)=20
    - corrected<BR>pass0: block 487094, item 0: StatData item of wrong =
length=20
    found 1065353216 10 0x0 SD (0), len 0, location 4096 entry count =
7680, fsck=20
    need 0, format BAD - deleted<BR>...20%..block 2292973: The free =
space=20
    (49543) is incorrect, should be (4072) - corrected<BR>block 2297198: =
The=20
    free space (17616) is incorrect, should be (4072) - =
corrected<BR>block=20
    2323041: The free space (18732) is incorrect, should be (4072) -=20
    corrected<BR>block 2328937: The free space (8242) is incorrect, =
should be=20
    (4072) - corrected<BR>block 2348193: The free space (54727) is =
incorrect,=20
    should be (4072) - corrected<BR>block 2371277: The number of items =
(12544)=20
    is incorrect, should be (1) - corrected<BR>block 2371277: The free =
space=20
    (35830) is incorrect, should be (4048) - corrected<BR>pass0: =
vpf-10110:=20
    block 2371277, item (0): Unknown item type found [3770748138 =
969408772=20
    0x23740850 ??? (15)] - deleted<BR>..40%block 3460718: The free space =
(11016)=20
    is incorrect, should be (4072) - corrected<BR>..block 4104106: The =
number of=20
    items (63) is incorrect, should be (1) - corrected<BR>block 4104106: =
The=20
    free space (65280) is incorrect, should be (4048) - =
corrected<BR>pass0:=20
    vpf-10110: block 4104106, item (0): Unknown item type found =
[33488897 130816=20
    0xff0001ff ??? (15)] - deleted<BR>block 4115015: The free space =
(2647) is=20
    incorrect, should be (4072) - corrected<BR>block 4179064: The free =
space (0)=20
    is incorrect, should be (4072) - corrected<BR>..60%....80%...block =
7583485:=20
    The number of items (33808) is incorrect, should be (1) - =
corrected<BR>block=20
    7583485: The free space (0) is incorrect, should be (4048) -=20
    corrected<BR>pass0: vpf-10110: block 7583485, item (0): Unknown item =
type=20
    found [16799326 16777472 0x5e5000021042210 ??? (6)] -=20
    deleted<BR>.100%<BR>147053 directory entries were hashed with "r5"=20
    hash.<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "r5" hash is=20
    =
selected<BR>Flushing..finished<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;=20
    Read blocks (but not data blocks)=20
    =
5748803<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    Leaves among those=20
    =
18650<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
    - leaves all contents of which could not be saved and deleted=20
    =
13<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=20
    Objectids found 147055</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Pass 1 (will try to insert 18637 leaves):<BR>####### Pass 1=20
    #######<BR>Looking for allocable blocks ..=20
    =
finished<BR>0%....20%....40%....60%....80%....100%<BR>Flushing..finished<=
BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    18637 leaves=20
    =
read<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;=20
    18591=20
    =
inserted<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    46 not inserted<BR>####### Pass 2 #######</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Pass=20
    =
2:<BR>0%....20%....40%....60%....80%....100%<BR>Flushing..finished<BR>&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    Leaves inserted item by item 46<BR>Pass 3 (semantic):<BR>####### =
Pass 3=20
    =
#########<BR>Flushing..finished<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
    Files found: 62444<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Directories=20
    found: 6304<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Symlinks =
found:=20
    78293<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Others: =
13<BR>Pass 3a=20
    (looking for lost dir/files):<BR>####### Pass 3a (lost+found pass)=20
    #########<BR>Looking for lost =
directories:<BR>Flushing..finished<BR>Pass 4 -=20
    =
finished<BR>Flushing..finished<BR>Syncing..finished<BR>###########<BR>rei=
serfsck=20
    finished at Sat Jan 22 05:50:19 2005<BR>###########<BR>(none):~=20
  #<BR></DIV></BLOCKQUOTE>
  <DIV><BR>&nbsp;</DIV>
  <DIV>Also, further testing on a 2nd mirror copied disk shows the same =
exact=20
  errors even after I run it twice in a row.</DIV></DIV></BLOCKQUOTE>
<DIV>&nbsp;</DIV>
<DIV><BR>Best Regards,<BR>Rob</DIV>
<DIV>&nbsp;</DIV>
<DIV>--<BR>Robert Harnaga<BR><A=20
href=3D"http://www.GriffinRUN.com">www.GriffinRUN.com</A><BR>Game server =
hosting=20
for serious players<BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_196C_01C50050.D81D7500--

