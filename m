From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: why --rebuilt-tree says it's correcting errors but then those same exact errors show up again and again
Date: Mon, 24 Jan 2005 13:29:15 +0300
Message-ID: <200501241328.08492.vitaly@namesys.com>
References: <196f01c5007a$c13fef50$6514a8c0@tower>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_73M9B95CqH9G74M"
Return-path: <reiserfs-list-return-23200-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <196f01c5007a$c13fef50$6514a8c0@tower>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Robert Harnaga <rh@GriffinRUN.com>, reiserfs-list@namesys.com

--Boundary-00=_73M9B95CqH9G74M
Content-Type: text/plain;
  charset="windows-1251"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 22 January 2005 15:06, Robert Harnaga wrote:
> I have a question about why --rebuilt-tree says it's correcting errors but
> then those same exact errors show up again and again after an immediate
> rerun and after a clean reboot.

Hopefully the attached email will clarify this.

> I'm running SUSE 9.2 in 64-bit mode with reiserfsck 3.6.18.  I'm running
> with 15k RPM SCSI drives. Any ideas on how to get rebuild-tree to really
> correct the errors and keep them correct after boot?
>
>
> Details below...
>
>     Run #1: After rebooting into single user mode, I ran fsck.reiserfs
> --rebuild-tree and got ERRORS
> ===========================================================================
>==
>
>     (none):~ # fsck.reiserfs --rebuild-tree /dev/sda4 -q
>     reiserfsck 3.6.18 (2003 www.namesys.com)
>
>     *************************************************************
>     ** Do not  run  the  program  with  --rebuild-tree  unless **
>     ** something is broken and MAKE A BACKUP  before using it. **
>     ** If you have bad sectors on a drive  it is usually a bad **
>     ** idea to continue using it. Then you probably should get **
>     ** a working hard drive, copy the file system from the bad **
>     ** drive  to the good one -- dd_rescue is  a good tool for **
>     ** that -- and only then run this program.                 **
>     ** If you are using the latest reiserfsprogs and  it fails **
>     ** please  email bug reports to reiserfs-list@namesys.com, **
>     ** providing  as  much  information  as  possible --  your **
>     ** hardware,  kernel,  patches,  settings,  all reiserfsck **
>     ** messages  (including version),  the reiserfsck logfile, **
>     ** check  the  syslog file  for  any  related information. **
>     ** If you would like advice on using this program, support **
>     ** is available  for $25 at  www.namesys.com/support.html. **
>     *************************************************************
>
>     Will rebuild the filesystem (/dev/sda4) tree
>     Will put log info to 'stdout'
>
>     Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes Replaying journal..
>     Reiserfs journal '/dev/sda4' in blocks [18..8211]: 0 transactions
> replayed ###########
>     reiserfsck --rebuild-tree started at Sat Jan 22 05:19:17 2005
>     ###########
>
>     Pass 0:
>     ####### Pass 0 #######
>     Loading on-disk bitmap .. ok, 5757257 blocks marked used
>     Skipping 8451 blocks (super block, journal, bitmaps) 5748806 blocks
> will be read 0%.block 348919: The number of items (256) is incorrect,
> should be (1) - corrected block 348919: The free space (0) is incorrect,
> should be (4048) - corrected pass0: block 348919, item 0: StatData item of
> wrong length found 1065353216 10 0x0 SD (0), len 0, location 4096 entry
> count 7680, fsck need 0, format BAD - deleted block 487094: The number of
> items (256) is incorrect, should be (1) - corrected block 487094: The free
> space (0) is incorrect, should be (4048) - corrected pass0: block 487094,
> item 0: StatData item of wrong length found 1065353216 10 0x0 SD (0), len
> 0, location 4096 entry count 7680, fsck need 0, format BAD - deleted
> ...20%..block 2292973: The free space (49543) is incorrect, should be
> (4072) - corrected block 2297198: The free space (17616) is incorrect,
> should be (4072) - corrected block 2323041: The free space (18732) is
> incorrect, should be (4072) - corrected block 2328937: The free space
> (8242) is incorrect, should be (4072) - corrected block 2348193: The free
> space (54727) is incorrect, should be (4072) - corrected block 2371277: The
> number of items (12544) is incorrect, should be (1) - corrected block
> 2371277: The free space (35830) is incorrect, should be (4048) - corrected
> pass0: vpf-10110: block 2371277, item (0): Unknown item type found
> [3770748138 969408772 0x23740850 ??? (15)] - deleted ..40%block 3460718:
> The free space (11016) is incorrect, should be (4072) - corrected ..block
> 4104106: The number of items (63) is incorrect, should be (1) - corrected
> block 4104106: The free space (65280) is incorrect, should be (4048) -
> corrected pass0: vpf-10110: block 4104106, item (0): Unknown item type
> found [33488897 130816 0xff0001ff ??? (15)] - deleted block 4115015: The
> free space (2647) is incorrect, should be (4072) - corrected block 4179064:
> The free space (0) is incorrect, should be (4072) - corrected
> ..60%....80%...block 7583485: The number of items (33808) is incorrect,
> should be (1) - corrected block 7583485: The free space (0) is incorrect,
> should be (4048) - corrected pass0: vpf-10110: block 7583485, item (0):
> Unknown item type found [16799326 16777472 0x5e5000021042210 ??? (6)] -
> deleted .100%
>     147053 directory entries were hashed with "r5" hash.
>             "r5" hash is selected
>     Flushing..finished
>             Read blocks (but not data blocks) 5748806
>                     Leaves among those 18655
>                             - leaves all contents of which could not be
> saved and deleted 13 Objectids found 147055
>
>     Pass 1 (will try to insert 18642 leaves):
>     ####### Pass 1 #######
>     Looking for allocable blocks .. finished
>     0%....20%....40%....60%....80%....100%
>     Flushing..finished
>             18642 leaves read
>                     18575 inserted
>                     67 not inserted
>     ####### Pass 2 #######
>
>     Pass 2:
>     0%....20%....40%....60%....80%....100%
>     Flushing..finished
>             Leaves inserted item by item 67
>     Pass 3 (semantic):
>     ####### Pass 3 #########
>     Flushing..finished
>             Files found: 62444
>             Directories found: 6304
>             Symlinks found: 78293
>             Others: 13
>     Pass 3a (looking for lost dir/files):
>     ####### Pass 3a (lost+found pass) #########
>     Looking for lost directories:
>     Flushing..finished
>     Pass 4 - finished
>     Flushing..finished
>     Syncing..finished
>     ###########
>     reiserfsck finished at Sat Jan 22 05:25:54 2005
>     ###########
>     (none):~ #
>
>
>
>
>   Run #2: As a test to see if it fixed it, I did a 2nd single user mode
> reboot, I ran fsck.reiserfs --rebuild-tree => ERRORS again (same ones)
> ===========================================================================
>============================ (none):~ # fsck.reiserfs --rebuild-tree
> /dev/sda4 -q
>     reiserfsck 3.6.18 (2003 www.namesys.com)
>
>     *************************************************************
>     ** Do not  run  the  program  with  --rebuild-tree  unless **
>     ** something is broken and MAKE A BACKUP  before using it. **
>     ** If you have bad sectors on a drive  it is usually a bad **
>     ** idea to continue using it. Then you probably should get **
>     ** a working hard drive, copy the file system from the bad **
>     ** drive  to the good one -- dd_rescue is  a good tool for **
>     ** that -- and only then run this program.                 **
>     ** If you are using the latest reiserfsprogs and  it fails **
>     ** please  email bug reports to reiserfs-list@namesys.com, **
>     ** providing  as  much  information  as  possible --  your **
>     ** hardware,  kernel,  patches,  settings,  all reiserfsck **
>     ** messages  (including version),  the reiserfsck logfile, **
>     ** check  the  syslog file  for  any  related information. **
>     ** If you would like advice on using this program, support **
>     ** is available  for $25 at  www.namesys.com/support.html. **
>     *************************************************************
>
>     Will rebuild the filesystem (/dev/sda4) tree
>     Will put log info to 'stdout'
>
>     Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes Replaying journal..
>     Reiserfs journal '/dev/sda4' in blocks [18..8211]: 0 transactions
> replayed ###########
>     reiserfsck --rebuild-tree started at Sat Jan 22 05:30:10 2005
>     ###########
>
>     Pass 0:
>     ####### Pass 0 #######
>     Loading on-disk bitmap .. ok, 5757259 blocks marked used
>     Skipping 8451 blocks (super block, journal, bitmaps) 5748808 blocks
> will be read 0%.block 348919: The number of items (256) is incorrect,
> should be (1) - corrected block 348919: The free space (0) is incorrect,
> should be (4048) - corrected pass0: block 348919, item 0: StatData item of
> wrong length found 1065353216 10 0x0 SD (0), len 0, location 4096 entry
> count 7680, fsck need 0, format BAD - deleted block 487094: The number of
> items (256) is incorrect, should be (1) - corrected block 487094: The free
> space (0) is incorrect, should be (4048) - corrected pass0: block 487094,
> item 0: StatData item of wrong length found 1065353216 10 0x0 SD (0), len
> 0, location 4096 entry count 7680, fsck need 0, format BAD - deleted
> ...20%..block 2292973: The free space (49543) is incorrect, should be
> (4072) - corrected block 2297198: The free space (17616) is incorrect,
> should be (4072) - corrected block 2323041: The free space (18732) is
> incorrect, should be (4072) - corrected block 2328937: The free space
> (8242) is incorrect, should be (4072) - corrected block 2348193: The free
> space (54727) is incorrect, should be (4072) - corrected block 2371277: The
> number of items (12544) is incorrect, should be (1) - corrected block
> 2371277: The free space (35830) is incorrect, should be (4048) - corrected
> pass0: vpf-10110: block 2371277, item (0): Unknown item type found
> [3770748138 969408772 0x23740850 ??? (15)] - deleted ..40%block 3460718:
> The free space (11016) is incorrect, should be (4072) - corrected ..block
> 4104106: The number of items (63) is incorrect, should be (1) - corrected
> block 4104106: The free space (65280) is incorrect, should be (4048) -
> corrected pass0: vpf-10110: block 4104106, item (0): Unknown item type
> found [33488897 130816 0xff0001ff ??? (15)] - deleted block 4115015: The
> free space (2647) is incorrect, should be (4072) - corrected block 4179064:
> The free space (0) is incorrect, should be (4072) - corrected
> ..60%....80%...block 7583485: The number of items (33808) is incorrect,
> should be (1) - corrected block 7583485: The free space (0) is incorrect,
> should be (4048) - corrected pass0: vpf-10110: block 7583485, item (0):
> Unknown item type found [16799326 16777472 0x5e5000021042210 ??? (6)] -
> deleted .100%
>     147053 directory entries were hashed with "r5" hash.
>             "r5" hash is selected
>     Flushing..finished
>             Read blocks (but not data blocks) 5748808
>                     Leaves among those 18653
>                             - leaves all contents of which could not be
> saved and deleted 13 Objectids found 147055
>
>     Pass 1 (will try to insert 18640 leaves):
>     ####### Pass 1 #######
>     Looking for allocable blocks .. finished
>     0%....20%....40%....60%....80%....100%
>     Flushing..finished
>             18640 leaves read
>                     18586 inserted
>                     54 not inserted
>     ####### Pass 2 #######
>
>     Pass 2:
>     0%....20%....40%....60%....80%....100%
>     Flushing..finished
>             Leaves inserted item by item 54
>     Pass 3 (semantic):
>     ####### Pass 3 #########
>     Flushing..finished
>             Files found: 62444
>             Directories found: 6304
>             Symlinks found: 78293
>             Others: 13
>     Pass 3a (looking for lost dir/files):
>     ####### Pass 3a (lost+found pass) #########
>     Looking for lost directories:
>     Flushing..finished
>     Pass 4 - finished
>     Flushing..finished
>     Syncing..finished
>     ###########
>     reiserfsck finished at Sat Jan 22 05:36:46 2005
>     ###########
>     (none):~ #
>
>
>
>   Run #3: After 3rd single user mode reboot, I ran fsck.reiserfs --check =>
> OK, fsck.reiserfs --fix-fixable => OK, fsck.reiserfs --rebuild-tree =>
> ERRORS
> ===========================================================================
>=============================== (none):~ # fsck.reiserfs /dev/sda4 -q
>     reiserfsck 3.6.18 (2003 www.namesys.com)
>
>     *************************************************************
>     ** If you are using the latest reiserfsprogs and  it fails **
>     ** please  email bug reports to reiserfs-list@namesys.com, **
>     ** providing  as  much  information  as  possible --  your **
>     ** hardware,  kernel,  patches,  settings,  all reiserfsck **
>     ** messages  (including version),  the reiserfsck logfile, **
>     ** check  the  syslog file  for  any  related information. **
>     ** If you would like advice on using this program, support **
>     ** is available  for $25 at  www.namesys.com/support.html. **
>     *************************************************************
>
>     Will read-only check consistency of the filesystem on /dev/sda4
>     Will put log info to 'stdout'
>
>     Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes ###########
>     reiserfsck --check started at Sat Jan 22 05:41:43 2005
>     ###########
>     Replaying journal..
>     Reiserfs journal '/dev/sda4' in blocks [18..8211]: 0 transactions
> replayed Checking internal tree..finished
>     Comparing bitmaps..finished
>     Checking Semantic tree:
>     finished
>     No corruptions found
>     There are on the filesystem:
>             Leaves 18637
>             Internal nodes 130
>             Directories 6304
>             Other files 140750
>             Data block pointers 5730036 (0 of them are zero)
>             Safe links 0
>     ###########
>     reiserfsck finished at Sat Jan 22 05:42:10 2005
>     ###########
>     (none):~ # fsck.reiserfs --fix-fixable /dev/sda4 -q
>     reiserfsck 3.6.18 (2003 www.namesys.com)
>
>     *************************************************************
>     ** If you are using the latest reiserfsprogs and  it fails **
>     ** please  email bug reports to reiserfs-list@namesys.com, **
>     ** providing  as  much  information  as  possible --  your **
>     ** hardware,  kernel,  patches,  settings,  all reiserfsck **
>     ** messages  (including version),  the reiserfsck logfile, **
>     ** check  the  syslog file  for  any  related information. **
>     ** If you would like advice on using this program, support **
>     ** is available  for $25 at  www.namesys.com/support.html. **
>     *************************************************************
>
>     Will check consistency of the filesystem on /dev/sda4
>     and will fix what can be fixed without --rebuild-tree
>     Will put log info to 'stdout'
>
>     Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes ###########
>     reiserfsck --fix-fixable started at Sat Jan 22 05:42:51 2005
>     ###########
>     Replaying journal..
>     Reiserfs journal '/dev/sda4' in blocks [18..8211]: 0 transactions
> replayed Checking internal tree..finished
>     Comparing bitmaps..finished
>     Checking Semantic tree:
>     finished
>     No corruptions found
>     There are on the filesystem:
>             Leaves 18637
>             Internal nodes 130
>             Directories 6304
>             Other files 140750
>             Data block pointers 5730036 (0 of them are zero)
>             Safe links 0
>     ###########
>     reiserfsck finished at Sat Jan 22 05:43:19 2005
>     ###########
>
>     (none):~ # fsck.reiserfs --rebuild-tree /dev/sda4 -q
>     reiserfsck 3.6.18 (2003 www.namesys.com)
>
>     *************************************************************
>     ** Do not  run  the  program  with  --rebuild-tree  unless **
>     ** something is broken and MAKE A BACKUP  before using it. **
>     ** If you have bad sectors on a drive  it is usually a bad **
>     ** idea to continue using it. Then you probably should get **
>     ** a working hard drive, copy the file system from the bad **
>     ** drive  to the good one -- dd_rescue is  a good tool for **
>     ** that -- and only then run this program.                 **
>     ** If you are using the latest reiserfsprogs and  it fails **
>     ** please  email bug reports to reiserfs-list@namesys.com, **
>     ** providing  as  much  information  as  possible --  your **
>     ** hardware,  kernel,  patches,  settings,  all reiserfsck **
>     ** messages  (including version),  the reiserfsck logfile, **
>     ** check  the  syslog file  for  any  related information. **
>     ** If you would like advice on using this program, support **
>     ** is available  for $25 at  www.namesys.com/support.html. **
>     *************************************************************
>
>     Will rebuild the filesystem (/dev/sda4) tree
>     Will put log info to 'stdout'
>
>     Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes Replaying journal..
>     Reiserfs journal '/dev/sda4' in blocks [18..8211]: 0 transactions
> replayed ###########
>     reiserfsck --rebuild-tree started at Sat Jan 22 05:43:41 2005
>     ###########
>
>     Pass 0:
>     ####### Pass 0 #######
>     Loading on-disk bitmap .. ok, 5757254 blocks marked used
>     Skipping 8451 blocks (super block, journal, bitmaps) 5748803 blocks
> will be read 0%.block 348919: The number of items (256) is incorrect,
> should be (1) - corrected block 348919: The free space (0) is incorrect,
> should be (4048) - corrected pass0: block 348919, item 0: StatData item of
> wrong length found 1065353216 10 0x0 SD (0), len 0, location 4096 entry
> count 7680, fsck need 0, format BAD - deleted block 487094: The number of
> items (256) is incorrect, should be (1) - corrected block 487094: The free
> space (0) is incorrect, should be (4048) - corrected pass0: block 487094,
> item 0: StatData item of wrong length found 1065353216 10 0x0 SD (0), len
> 0, location 4096 entry count 7680, fsck need 0, format BAD - deleted
> ...20%..block 2292973: The free space (49543) is incorrect, should be
> (4072) - corrected block 2297198: The free space (17616) is incorrect,
> should be (4072) - corrected block 2323041: The free space (18732) is
> incorrect, should be (4072) - corrected block 2328937: The free space
> (8242) is incorrect, should be (4072) - corrected block 2348193: The free
> space (54727) is incorrect, should be (4072) - corrected block 2371277: The
> number of items (12544) is incorrect, should be (1) - corrected block
> 2371277: The free space (35830) is incorrect, should be (4048) - corrected
> pass0: vpf-10110: block 2371277, item (0): Unknown item type found
> [3770748138 969408772 0x23740850 ??? (15)] - deleted ..40%block 3460718:
> The free space (11016) is incorrect, should be (4072) - corrected ..block
> 4104106: The number of items (63) is incorrect, should be (1) - corrected
> block 4104106: The free space (65280) is incorrect, should be (4048) -
> corrected pass0: vpf-10110: block 4104106, item (0): Unknown item type
> found [33488897 130816 0xff0001ff ??? (15)] - deleted block 4115015: The
> free space (2647) is incorrect, should be (4072) - corrected block 4179064:
> The free space (0) is incorrect, should be (4072) - corrected
> ..60%....80%...block 7583485: The number of items (33808) is incorrect,
> should be (1) - corrected block 7583485: The free space (0) is incorrect,
> should be (4048) - corrected pass0: vpf-10110: block 7583485, item (0):
> Unknown item type found [16799326 16777472 0x5e5000021042210 ??? (6)] -
> deleted .100%
>     147053 directory entries were hashed with "r5" hash.
>             "r5" hash is selected
>     Flushing..finished
>             Read blocks (but not data blocks) 5748803
>                     Leaves among those 18650
>                             - leaves all contents of which could not be
> saved and deleted 13 Objectids found 147055
>
>     Pass 1 (will try to insert 18637 leaves):
>     ####### Pass 1 #######
>     Looking for allocable blocks .. finished
>     0%....20%....40%....60%....80%....100%
>     Flushing..finished
>             18637 leaves read
>                     18591 inserted
>                     46 not inserted
>     ####### Pass 2 #######
>
>     Pass 2:
>     0%....20%....40%....60%....80%....100%
>     Flushing..finished
>             Leaves inserted item by item 46
>     Pass 3 (semantic):
>     ####### Pass 3 #########
>     Flushing..finished
>             Files found: 62444
>             Directories found: 6304
>             Symlinks found: 78293
>             Others: 13
>     Pass 3a (looking for lost dir/files):
>     ####### Pass 3a (lost+found pass) #########
>     Looking for lost directories:
>     Flushing..finished
>     Pass 4 - finished
>     Flushing..finished
>     Syncing..finished
>     ###########
>     reiserfsck finished at Sat Jan 22 05:50:19 2005
>     ###########
>     (none):~ #
>
>
>
>   Also, further testing on a 2nd mirror copied disk shows the same exact
> errors even after I run it twice in a row.
>
>
> Best Regards,
> Rob
>
> --
> Robert Harnaga
> www.GriffinRUN.com
> Game server hosting for serious players

-- 
Thanks,
Vitaly Fertman



--Boundary-00=_73M9B95CqH9G74M
Content-Type: message/rfc822;
  name="--rebuild-tree always finds errors --check is ok"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="--rebuild-tree always finds errors --check is ok"


=46rom vitaly@namesys.com Mon Jan 10 15:50:34 2005
Return-Path: <reiserfs-list-return-23105-vitaly=3Dnamesys.com@namesys.com>
Delivered-To: vitaly@namesys.com
Received: (qmail 29856 invoked by uid 501); 10 Jan 2005 12:56:40 -0000
Mailing-List: contact reiserfs-list-help@namesys.com; run by ezmlm
Precedence: bulk
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
X-Mailing-List: reiserfs-list@namesys.com
Delivered-To: mailing list reiserfs-list@namesys.com
Received: (qmail 29827 invoked by uid 85); 10 Jan 2005 12:56:37 -0000
Received: from vitaly@namesys.com by thebsh.namesys.com by uid 82 with qmai=

l-scanner-1.15=20
 (spamassassin: 2.43-cvs.  Clear:SA:0(0.0/2.0 tests=3Dnone autolearn=3Dno v=
ersion=3D2.60):.=20
 Processed in 0.540273 secs); 10 Jan 2005 12:56:37 -0000
Received: from nospam.wplus.net (HELO emaile.wplus.net) (195.131.104.155)
  by thebsh.namesys.com with SMTP; 10 Jan 2005 12:56:36 -0000
Envelope-to: reiserfs-list@namesys.com
Received: by emaile.wplus.net with drweb-scanned (WebPlus antispam mailer )
	id 1Cnz58-000BD6-00; Mon, 10 Jan 2005 15:55:38 +0300
Received: from [195.131.124.64] (helo=3Dip64.124.adsl.wplus.ru)
	by emaile.wplus.net with esmtp (WebPlus antispam mailer )
	id 1Cnz57-000BCh-00; Mon, 10 Jan 2005 15:55:37 +0300
=46rom: Vitaly Fertman <vitaly@namesys.com>
Organization: NAMESYS
To: hanasaki <hanasaki@hanaden.com>,
 reiserfs-list@namesys.com
Subject: Re: --rebuild-tree always finds errors --check is ok
Date: Mon, 10 Jan 2005 15:50:34 +0300
User-Agent: KMail/1.5.4
References: <41D71C4E.6000209@hanaden.com> <200501072343.08374.vitaly@names=
ys.com> <41DF2CD6.7040800@hanaden.com>
In-Reply-To: <41DF2CD6.7040800@hanaden.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset=3D"koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200501101550.34403.vitaly@namesys.com>
X-IP: 195.131.124.64
X-From: vitaly@namesys.com
X-Spam-Checker-Version: SpamAssassin 2.60 (1.212-2003-09-23-exp) on=20
	thebsh.namesys.com
X-Spam-DCC: :=20
X-Spam-Status: No, hits=3D0.0 required=3D2.0 tests=3Dnone autolearn=3Dno ve=
rsion=3D2.60
Status: R=20
X-Status: N
X-KMail-EncryptionState: =20
X-KMail-SignatureState: =20

On Saturday 08 January 2005 03:44, hanasaki wrote:
> Could you outline exactly what takes place on a rebuild-tree?

reiserfs has two types of blocks. There are unformatted nodes. They
contain plain user file data. And there are formatted nodes. These may=20
contain both user file data and filesystem metadata. --rebuild-tree scans
all blocks looking for filesystem metadata, e.g. for formatted nodes.=20
However you can put a reiserfs image into a file, then file data (e.g.=20
unformatted nodes of the host fs) will contain formatted nodes of the=20
fs image, and rebuilding of the host fs will be screwed up as there is=20
no way to distinguish image fs metadata kept in unformatted nodes=20
of the host fs from the host fs metadata.

> I was under the incorrect assumption that if a rebuild-tree is 100%
> successful then the FS is ok and a subsequent rebuild-tree will have
> nothing to fix/report.  .....

In your case, some unformatted nodes look like formatted ones for the=20
first sight, however after fixing all the corruptions in these nodes fsck=20
realises that there is no valid metadata left and that they are either=20
completely broken nodes or file data ones. To not corrupt file data fsck=20
does not flush the made changes on disk. And as nothing gets changed=20
the same attempt of fixing these nodes repeats again on the next rebuild.

> Vitaly Fertman wrote:
> > On Tuesday 04 January 2005 20:25, hanasaki wrote:
> >>Version of reiserfsk
> >>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>=3D=3D From debian sarge
> >>/sbin/reiserfsck -V
> >>reiserfsck 3.6.19 (2003 www.namesys.com)
> >>=3D=3D also used the version in knoppix 3.7 with similar results
> >>
> >>the output of two consecutive runs of --rebuild-tree on the same
> >>unmounted partition are attached.  Below is the diff
> >
> > rebuild-tree finds some blocks that looks like reiserfs formatted
> > blocks for the first sight whereas they are not and just belongs to
> > some file bodies. The consistency check reveals no valid metadata
> > in them, so they are considered as not valid reiserfs formatted blocks
> > and left not modified on disk. This is why the second run of rebuild-tr=
ee
> > finds them again and tries to do all the stuff again.

=2D-=20
Thanks,
Vitaly Fertman





--Boundary-00=_73M9B95CqH9G74M--


