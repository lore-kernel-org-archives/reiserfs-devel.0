From: "Niek" <Art@chello.nl>
Subject: Hard disk crash and solution
Date: Wed, 22 Jan 2003 22:35:50 +0100
Message-ID: <IKENJBHCILNPNAGHKCHFOEDMCCAA.Art@chello.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12453-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Title: IBM DTLA 307045 Hard disk crash

I bought this disk (46 GB) about two years ago. One of the best they
claimed.
Anyway, I put it into my Linux box and yes it worked for a while.
After about 4 months it started to make weird noises. krrk-screech etc.
Shit, a lot of data gone. Send it to IBM and got a refurbished one back from
Taiwan.
This drive went back into my Linux box and it worked happily for more that
1.3
years. Then again it happened: Kkrr-screech etc. Shit happens.
What is the fucking MBTF of these drives?? Is it close to one year like I
experienced?

Anyway, I want my data back. I mailed Ontrack, a nice company specialized in
getting data back from crashed HD's. Their response (by phone) was very,
very quick!
(within 2 minutes after completing their online form).
It would cost me euro 96 for them to have a look and if I want the data back
it'll cost me about euro 700 - euro 1500 exclusive VAT. Since I'm not a
company,
they gave me 20% off their price).

Anyway, I'll try to do it myself.


First I reinstalled Linux Suse 8.1 on a new disk. Auto installed all the
patches (using YOU).
Then I attached the broken disk (with the kkkggrr sounds) on a free ide
port.
Fdisk showed me the partitions. I tried to mount all of them. I could mount
only
one of them. I rescued a few files.
But the bulk of the data was located at /dev/hdd9. A partition of around 32
GB.
I could not mount it. Mount could not mount it due to one bad block (well
there
must be thousands of them, but mount needs only one to bail out).

The following command created a image:

mymachine:/rescued # dd_rescue -b 32768 -B 512 -l dd_rescue_log -a -v
/dev/hdd9 hdd9.img

It took around 2 hours to make this image. This program reported many
errors,
the HD make awful noises but I got an image. Hum, now what?



mymachine:/rescued # l
total 29054814
drwxr-xr-x    2 root     root          104 Jan 22 17:18 ./
drwxr-xr-x   26 root     root          600 Jan 22 18:14 ../
-rw-r-----    1 root     root       741121 Jan 22 20:22 dd_rescue.log
-rw-r-----    1 root     root     32020627456 Jan 22 20:22 hdd9.img


>>>>>>>>>>Let's try to mount

mymachine:/rescued # mount -o loop -r hdd9.img /d9 -t reiserfs
mount: wrong fs type, bad option, bad superblock on /dev/loop0,
       or too many mounted file systems


>>>>>>>>>>Check it then....

mymachine:/rescued # reiserfsck  hdd9.img
reiserfsck 3.6.2 (2002)
Will read-only check consistency of the filesystem on hdd9.img
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Wed Jan 22 20:29:18 2003
###########
Replaying journal..
No transactions found
Checking S+tree../  1 (of 166)/ 82 (of  86)node (12285) with wrong level (0)
found in the tree (should be 1)
whole subtree skipped
/  2 (of 166)/ 19 (of  85)node (39901) with wrong level (0) found in the
tree (should be 1)
whole subtree skipped
/  7 (of 166)/ 14 (of 170)node (8381) with wrong level (0) found in the tree
(should be 1)

---- sniped lines -------

/152 (of 166)/152 (of 170)node (31645) with wrong level (0) found in the
tree (should be 1)
whole subtree skipped
ok
Comparing bitmaps..free block count 1718350 mismatches with a correct one
2289481.
on-disk bitmap does not match to the correct one.
Bad nodes were found, Semantic pass skipped
There were found 17 corruptions which can be fixed only
during --rebuild-tree
###########
reiserfsck finished at Wed Jan 22 20:29:33 2003
###########



>>>>>>> Well rebuild it then:

mymachine:/rescued # reiserfsck  --rebuild-tree hdd9.img
reiserfsck 3.6.2 (2002)
  **********************************************************
  ** This  is  an  experimental  version  of  reiserfsck, **
  **              !! MAKE A BACKUP FIRST !!               **
  ** Don't run this program unless something  is  broken. **
  ** Some types of random FS damage can be recovered from **
  ** by  this  program,   which  basically   throws  away **
  ** the internal nodes of the tree and then reconstructs **
  ** them. This program is for use only by the desperate, **
  ** and is  of only beta quality.  If you are using  the **
  ** latest  reiserfsprogs  and  it  fails  please  email **
  ** bug reports to reiserfs-list@namesys.com.            **
  **********************************************************

Will rebuild the filesystem (hdd9.img) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
Replaying journal..
No transactions found
###########
reiserfsck --rebuild-tree started at Wed Jan 22 20:29:53 2003
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 6099186 blocks marked used
Skipping 8449 blocks (super block, journal, bitmaps) 6090737 blocks will be
read
0%....20%....40%....60%....80%....100%                        left 0, 8627
/sec
"r5" got 96833 hits
        "r5" hash is selected
Flushing..done
        Read blocks (but not data blocks) 6090737
                Leaves among those 25618
                Objectids found 96822

Pass 1 (will try to insert 25618 leaves):
####### Pass 1 #######
Looking for allocable blocks .. ok
0%....20%....40%....60%....80%....100%                         left 0, 419
/sec
Flushing..done
        25618 leaves read
                25608 inserted
                10 not inserted
####### Pass 2 #######

Pass2:
0%....20%....40%....60%....80%....100%                          left 0, 20
/sec
Flushing..done
        Leaves inserted item by item 10
Pass 3 (semantic):
####### Pass 3 #########
name "cache3B65EDC20112F11.png" in directory 20882 21317 points to nowhere
21317 21321 - removed
dir 20882 21317 has wrong sd_size 316, has to be 196
name "04" in directory 189 20882 points to nowhere 20882 73124 - removed
name "config" in directory 20875 20883 points to nowhere 20883 20887 -
removed
dir 20875 20883 has wrong sd_size 188, has to be 146
/database/gotocode/SQLname "mysql_gotocode.sql" in directory 87643 88651
points to nowhere 88651 88654 - removed

----- snip a lot of errors ----


dir 73444 32462 has wrong sd_size 281, has to be 228
Flushing..done
        Files found: 92045
        Directories found: 4310
        Symlinks found: 24
        Others: 1
        Broken (of files/symlinks/others): 1
        Names pointing to nowhere (removed): 103
Pass 3a (looking for lost dir/files):
####### Pass 3a (lost+found pass) #########
Looking for lost directories:
/20883_20887name "kwriterc" in directory 20883 20887 points to nowhere 20887
9941 - removed

---- snip again loads of errors -----

/22523_36802get_next_directory_item: 22523 36802 0x1 DIR (3): ".." points to
[20884 22523], should point to [2 206] - fixed
Looking for lost files:1 /sec
Flushing..done 9137, 147 /sec
        Objects without names 112
        Empty lost dirs removed 390
        Dirs linked to /lost+found: 11
                Dirs without stat data found 1
        Files linked to /lost+found 71
Pass 4 - done     done 16947, 264 /sec
        Deleted unreachable items 179
Flushing..done
Syncing..done
###########
reiserfsck finished at Wed Jan 22 20:43:58 2003
###########
mymachine:/rescued #


>>>>>>> Now I tried to mount it again.

mymachine:/rescued # mount -treiserfs -o loop -r hdd9.img /d9
mount: wrong fs type, bad option, bad superblock on /dev/loop0,
       or too many mounted file systems


>>>>>>> What is wrong?????


debugreiserfs hdd9.img
debugreiserfs 3.6.2 (2002)

Filesystem state: consistent

Reiserfs super block in block 16 on 0x0 of format 3.5 with standard journal
Count of blocks on the device: 7817536
Number of bitmaps: 239
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 1884129
Root block: 8222
Filesystem is clean
Tree height: 4
Hash function used to sort names: "r5"
Objectid map size 196, max 1004
Journal parameters:
        Device [0x0]
        Magic [0x0]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0
sb_version: 0




>>>>>>>> There is nothing wrong !!!!!!!, Let's update the reiserfs utilities
>>>>>>>>  from their website and try again


mymachine:/rescued # debugreiserfs hdd9.img

<-------------debugreiserfs, 2002------------->
reiserfsprogs 3.6.4


Filesystem state: consistent

Reiserfs super block in block 16 on 0x0 of format 3.5 with standard journal
Count of blocks on the device: 7817536
Number of bitmaps: 239
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 1884129
Root block: 8222
Filesystem is cleanly umounted
Tree height: 4
Hash function used to sort names: "r5"
Objectid map size 196, max 1004
Journal parameters:
        Device [0x0]
        Magic [0x0]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0
sb_version: 0


>>>>>>>>>>> Hummm, there is still nothing wrong, both debugreiserfs reports
the same
>>>>>>>>>>> Let's recheck with the new utility


mymachine:/rescued # reiserfsck hdd9.img

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.4

  *************************************************************
  ** If you are using the latest reiserfsprogs and  it fails **
  ** please  email bug reports to reiserfs-list@namesys.com, **
  ** providing  as  much  information  as  possible --  your **
  ** hardware,  kernel,  patches,  settings,  all  reiserfsk **
  ** messages  (including version),  the reiserfsck logfile, **
  ** check  the  syslog file  for  any  related information. **
  ** If you would like advice on using this program, support **
  ** is available  for $25 at  www.namesys.com/support.html. **
  *************************************************************

Will read-only check consistency of the filesystem on hdd9.img
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
###########
reiserfsck --check started at Wed Jan 22 21:31:19 2003
###########
Replaying journal..
trans replayed: mountid 126, transid 167823, desc 4265, len 3, commit 4269,
next trans offset 4252
1 transactions replayed
Checking internal tree../ 34 (of 165)/ 79 (of 105)bad_item: vpf-10570: block
11065: The item header (6) has not cleaned flags.
finished
Comparing bitmaps..finished
Checking Semantic tree:
/n/qcad-1.4.7-i386-setup.tar.gzvpf-10680: The file [3 21341] has the wrong
block count in the StatData (7464), should be (2104)
/n/windows_vmware/win98.dskvpf-10680: The file [21732 21734] has the wrong
block count in the StatData (1365888), should be (1354496)
/n/papers.part1.rarvpf-10680: The file [3 70216] has the wrong block count
in the StatData (1269536), should be (56040)
/data_2/f4.bakvpf-10680: The file [10533 10585] has the wrong block count in
the StatData (3656), should be (744)
finished
5 found corruptions can be fixed with --fix-fixable
###########
reiserfsck finished at Wed Jan 22 21:31:55 2003
###########


>>>>>>>> Heee, still errors? What did I miss? Debug reiserfs thinks it's ok
and the
>>>>>>>> newer reiserfsck found some more errors. Stupid program........



mymachine:/rescued # reiserfsck --fix-fixable hdd9.img

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.4

  *************************************************************
  ** If you are using the latest reiserfsprogs and  it fails **
  ** please  email bug reports to reiserfs-list@namesys.com, **
  ** providing  as  much  information  as  possible --  your **
  ** hardware,  kernel,  patches,  settings,  all  reiserfsk **
  ** messages  (including version),  the reiserfsck logfile, **
  ** check  the  syslog file  for  any  related information. **
  ** If you would like advice on using this program, support **
  ** is available  for $25 at  www.namesys.com/support.html. **
  *************************************************************

Will check consistency of the filesystem on hdd9.img
and will fix what can be fixed w/o --rebuild-tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
###########
reiserfsck --fix-fixable started at Wed Jan 22 21:32:47 2003
###########
Replaying journal..
0 transactions replayed
Checking internal tree../ 34 (of 165)/ 79 (of 105)bad_item: vpf-10580: block
11065: Flags in the item header (6) were cleaned
finished
Comparing bitmaps..finished
Checking Semantic tree:
/n/qcad-1.4.7-i386-setup.tar.gzvpf-10680: The file [3 21341] has the wrong
block count in the StatData (7464) - corrected to (2104)
/n/windows_vmware/win98.dskvpf-10680: The file [21732 21734] has the wrong
block count in the StatData (1365888) - corrected to (1354496)
/n/papers.part1.rarvpf-10680: The file [3 70216] has the wrong block count
in the StatData (1269536) - corrected to (56040)
/data_2/f4.bakvpf-10680: The file [10533 10585] has the wrong block count in
the StatData (3656) - corrected to (744)
finished
No corruptions found
There are on the filesystem:
        Leaves 25460
        Internal nodes 166
        Directories 4340
        Other files 92460
        Data block pointers 5899332 (0 of them are zero)
        Safe links 0
###########
reiserfsck finished at Wed Jan 22 21:34:09 2003
###########

mymachine:/rescued # mount -treiserfs -o loop -r hdd9.img /d9
mymachine:/rescued #


------- Hee, no errors any more -------- let's check it's contents



Data is there. I'm very happy!!
What did we learn. A lot. One of them is that computers are more unreliable
than humans and they are
not very reliable. Look e.g. at Suse. Their auto update should have updated
the reiserfs programs to the
newest versions, but they forgot to put that in. I'll mail them.
One thing that Namesys should do is to make the software more user-friendly
and put this type of info in their webpages
Crashed HD's are a pain in the ass to repair. This type of IBM drives have a
flaw. Ibm confirmed this, but they did not remove them from the market.



Have a lot of fun,

Nick



