From: David Greaves <david@dgreaves.com>
Subject: support for Reiserfs 3.6 failed on ~1Tb lvm2 lv on 2.6.6?
Date: Tue, 08 Jun 2004 17:08:13 +0100
Message-ID: <40C5E46D.7050108@dgreaves.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19089-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

resend

Hi

I wonder if someone can help :)

I tried the support@namesys.com yesterday morning but didn't get a 
response yet - I don't know if it's still working? I gave them a day 
(well 23hrs, I have to leave for a meeting RSN :) ) to ack just in 
case... (not checked if my $25 has gone yet)


Summary:
* 2.6.6
* I built a degraded raid 5 array to about a terrabyte and ran 
mkfs.reiserfs on it
* Copied on data
* cold-installed final disk, hot-added final disk
* resync started
* 2hrs after resync finished cleanly the system crashed dead (lots of 
reiser stuff on screen - nothing logged)
* fsck check needed a -build-tree which I ran
* eventually finished - no critical data lost

But I now have little confidence in the setup :(


Anyway, here's the email I sent...

This is a home system (don't sigh!, I'm not that dense) and I use it for 
storing tv programs from a mythtv (cf Tivo) system.
The family are going to kill me if I've lost all their tv programs after 
saying how much safer it'd be if we had raid and a reiserfs system.
No, I don't have a backup (home system, 1Tb?) that's why I'm using raid5.
<sigh>

<snip worldpay info>

OK, the original subject was "What the hell happened?" but I re-thought 
that one :)
I actually want to know what's up and how to stop this happening again. 
Essentially I've lost confidence in the setup and need to know if I can 
rely on it in the future.


Environment:
Core system is Debian
I have a standard kernel.org 2.6.6 with the raid5 resync patch from a 
few days ago 
(http://marc.theaimsgroup.com/?l=linux-raid&m=108635099921570&w=2)

What I did:
I built a raid 5 array to about a terrabyte.
HW is a promise TX4, 4x250Gb sata + 1 x 300Gb pata
I built the array degraded (4 sata disks)
I put a lvm2 volume on it.
I formatted it with reiserfs
If you want the (almost) exact commands then see: 
http://www.mythtv.info/moin.cgi/AdministrationSoftware_2fLvmRaid

I rsync'ed over my data from the 300Gb pata on another box
I shut down and moved the 300Gb disk to the new machine
I added (mdadm -a) the final disk and waited for the resync to start - 
that worked fine. I adjusted the peak rate to abou 8000K/sec max to 
improve responsiveness.

I left it syncing and found it dead in the morning :(
I didn't note the errors properly - I assumed they would have been 
logged - d'oh!
The sync had finished cleanly at 4 and it died at 6

(nb HTML email as I've annotated my comments from here on in to make 
them easier to see)

*== I rebooted and looked at the logs
== (extract from kern.log - nothing removed between these times)
*Jun  6 20:36:48 cu kernel: md: using maximum available idle IO bandwith 
(but not more than 200000 KB/sec) for reconstruction.
Jun  6 20:36:48 cu kernel: md: using 128k window, over a total of 
245111552 blocks.
Jun  6 20:42:26 cu kernel: nfs warning: mount version older than kernel
Jun  6 20:42:26 cu last message repeated 4 times
Jun  6 21:02:29 cu kernel: nfsd: last server has exited
Jun  6 21:02:29 cu kernel: nfsd: unexporting all filesystems
Jun  6 21:05:12 cu kernel: nfs_stat_to_errno: bad nfs status return 
value: 11
Jun  6 21:05:13 cu last message repeated 362 times
Jun  6 21:05:14 cu kernel: nfs warning: mount version older than kernel
Jun  6 21:05:14 cu last message repeated 4 times
Jun  7 04:25:48 cu kernel: md: md0: sync done.
Jun  7 04:25:48 cu kernel: RAID5 conf printout:
Jun  7 04:25:48 cu kernel:  --- rd:5 wd:5 fd:0
Jun  7 04:25:48 cu kernel:  disk 0, o:1, dev:sda1
Jun  7 04:25:48 cu kernel:  disk 1, o:1, dev:sdc1
Jun  7 04:25:48 cu kernel:  disk 2, o:1, dev:sdb1
Jun  7 04:25:48 cu kernel:  disk 3, o:1, dev:sdd1
Jun  7 04:25:48 cu kernel:  disk 4, o:1, dev:hdb1

*== 2 hours later it went down
== Nothing in the message logs at all:
== (from log/messages)
*Jun  7 06:19:16 cu rpc.mountd: export request from 10.0.0.95
Jun  7 06:23:37 cu rpc.mountd: export request from 10.0.0.95
Jun  7 06:23:53 cu rpc.mountd: export request from 10.0.0.105
Jun  7 09:17:32 cu syslogd 1.4.1#10: restart.
Jun  7 09:17:32 cu kernel: klogd 1.4.1#10, log source = /proc/kmsg started.
Jun  7 09:17:32 cu kernel: Inspecting /boot/System.map-2.6.6
Jun  7 09:17:32 cu kernel: Loaded 27572 symbols from /boot/System.map-2.6.6.
Jun  7 09:17:32 cu kernel: Symbols match kernel version 2.6.6.


*== I remounted and it processed it's journal

== I looked around the fs and noticed a directory was empty and gave an 
I/O error on an ls

== I fairly quickly stopped nfs and unmounted to run fsck
*
Jun  7 10:33:45 cu rpc.mountd: export request from 10.0.0.95
Jun  7 10:34:36 cu kernel: is_tree_node: node level 65535 does not match 
to the expected one 1
Jun  7 10:34:36 cu kernel: vs-5150: search_by_key: invalid format found 
in block 27361280. Fsck?
Jun  7 10:34:38 cu kernel: is_tree_node: node level 65535 does not match 
to the expected one 1
Jun  7 10:34:38 cu kernel: vs-5150: search_by_key: invalid format found 
in block 27361280. Fsck?
Jun  7 10:37:16 cu rpc.mountd: export request from 10.0.0.95
Jun  7 10:37:33 cu rpc.mountd: export request from 10.0.0.105
Jun  7 10:39:21 cu kernel: is_tree_node: node level 65535 does not match 
to the expected one 1
Jun  7 10:39:21 cu kernel: vs-5150: search_by_key: invalid format found 
in block 27361280. Fsck?
Jun  7 10:42:17 cu kernel: nfsd: last server has exited
Jun  7 10:42:17 cu kernel: nfsd: unexporting all filesystems



cu:~# fsck.reiserfs /dev/video_vg/video_lv
reiserfsck 3.6.17 (2003 www.namesys.com)

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

Will read-only check consistency of the filesystem on /dev/video_vg/video_lv
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
###########
reiserfsck --check started at Mon Jun  7 10:51:52 2004
###########
Replaying journal..
Reiserfs journal '/dev/video_vg/video_lv' in blocks [18..8211]: 0 
transactions replayed
Checking internal tree../  1 (of   5)/  1 (of  93)bad_internal: 
vpf-10330: block 143523743, item 7: The internal item points to the not 
legal block (27361280)
 the problem in the internal node occured (143523743), whole subtree is 
skipped
/  2 (of   5)/ 81 (of 170)/ 80 (of 170)bad_indirect_item: block 
73591905: The item (243 3605 0xa0e0001 IND (1), len 4048, location 48 
entry count 0, fsck need 0, format new) has the bad pointer (261) to the 
block (75279590), which is in tree already
bad_indirect_item: block 73591905: The item (243 3605 0xa0e0001 IND (1), 
len 4048, location 48 entry count 0, fsck need 0, format new) has the 
bad pointer (262) to the block (75279591), which is in tree already
bad_indirect_item: block 73591905: The item (243 3605 0xa0e0001 IND (1), 
len 4048, location 48 entry count 0, fsck need 0, format new) has the 
bad pointer (263) to the block (75279592), which is in tree already
bad_indirect_item: block 73591905: The item (243 3605 0xa0e0001 IND (1), 
len 4048, location 48 entry count 0, fsck need 0, format new) has the 
bad pointer (264) to the block (75279593), which is in tree already
bad_indirect_item: block 73591905: The item (243 3605 0xa0e0001 IND (1), 
len 4048, location 48 entry count 0, fsck need 0, format new) has the 
bad pointer (265) to the block (75279594), which is in tree already
bad_indirect_item: block 73591905: The item (243 3605 0xa0e0001 IND (1), 
len 4048, location 48 entry count 0, fsck need 0, format new) has the 
bad pointer (266) to the block (75279595), which is in tree already
bad_indirect_item: block 73591905: The item (243 3605 0xa0e0001 IND (1), 
len 4048, location 48 entry count 0, fsck need 0, format new) has the 
bad pointer (267) to the block (75279596), which is in tree already
/102 (of 170)/ 44 (of 170)bad_indirect_item: block 69237223: The item 
[243 3625 0x290ad001 IND (1)] has the bad pointer (5) to the block 
(822719925)
bad_indirect_item: block 69237223: The item [243 3625 0x290ad001 IND 
(1)] has the bad pointer (6) to the block (2773119094)
bad_indirect_item: block 69237223: The item [243 3625 0x290ad001 IND 
(1)] has the bad pointer (7) to the block (3044205366)
bad_indirect_item: block 69237223: The item [243 3625 0x290ad001 IND 
(1)] has the bad pointer (8) to the block (1148320669)
bad_indirect_item: block 69237223: The item [243 3625 0x290ad001 IND 
(1)] has the bad pointer (9) to the block (1984969190)
bad_indirect_item: block 69237223: The item [243 3625 0x290ad001 IND 
(1)] has the bad pointer (10) to the block (4014921266)
bad_indirect_item: block 69237223: The item [243 3625 0x290ad001 IND 
(1)] has the bad pointer (11) to the block (2439969720)
/138 (of 170)/ 23 (of 170)bad_indirect_item: block 76872417: The item 
(243 3660 0x2f1d7001 IND (1), len 4048, location 48 entry count 0, fsck 
need 0, format new) has the bad pointer (197) to the block (77067219), 
which is in tree already
bad_indirect_item: block 76872417: The item (243 3660 0x2f1d7001 IND 
(1), len 4048, location 48 entry count 0, fsck need 0, format new) has 
the bad pointer (198) to the block (77067220), which is in tree already
bad_indirect_item: block 76872417: The item (243 3660 0x2f1d7001 IND 
(1), len 4048, location 48 entry count 0, fsck need 0, format new) has 
the bad pointer (199) to the block (77067221), which is in tree already
bad_indirect_item: block 76872417: The item (243 3660 0x2f1d7001 IND 
(1), len 4048, location 48 entry count 0, fsck need 0, format new) has 
the bad pointer (200) to the block (77067222), which is in tree already
bad_indirect_item: block 76872417: The item (243 3660 0x2f1d7001 IND 
(1), len 4048, location 48 entry count 0, fsck need 0, format new) has 
the bad pointer (201) to the block (77067223), which is in tree already
bad_indirect_item: block 76872417: The item (243 3660 0x2f1d7001 IND 
(1), len 4048, location 48 entry count 0, fsck need 0, format new) has 
the bad pointer (202) to the block (77067224), which is in tree already
bad_indirect_item: block 76872417: The item (243 3660 0x2f1d7001 IND 
(1), len 4048, location 48 entry count 0, fsck need 0, format new) has 
the bad pointer (203) to the block (77067225), which is in tree already
/160 (of 170)/ 22 (of  85)bad_indirect_item: block 83542269: The item 
[243 3683 0xba3d001 IND (1)] has the bad pointer (278) to the block 
(1965879297)
bad_indirect_item: block 83542269: The item [243 3683 0xba3d001 IND (1)] 
has the bad pointer (279) to the block (3551564059)
bad_indirect_item: block 83542269: The item [243 3683 0xba3d001 IND (1)] 
has the bad pointer (280) to the block (3912859713)
bad_indirect_item: block 83542269: The item [243 3683 0xba3d001 IND (1)] 
has the bad pointer (281) to the block (3338570251)
bad_indirect_item: block 83542269: The item [243 3683 0xba3d001 IND (1)] 
has the bad pointer (282) to the block (1633457546)
bad_indirect_item: block 83542269: The item [243 3683 0xba3d001 IND (1)] 
has the bad pointer (283) to the block (831056460)
/161 (of 170)/ 69 (of 170)bad_indirect_item: block 83676269: The item 
[243 3683 0x2c40d001 IND (1)] has the bad pointer (133) to the block 
(2302524575)
bad_indirect_item: block 83676269: The item [243 3683 0x2c40d001 IND 
(1)] has the bad pointer (134) to the block (4055321528)
bad_indirect_item: block 83676269: The item [243 3683 0x2c40d001 IND 
(1)] has the bad pointer (135) to the block (1075217203)
bad_indirect_item: block 83676269: The item [243 3683 0x2c40d001 IND 
(1)] has the bad pointer (136) to the block (3875172755)
bad_indirect_item: block 83676269: The item [243 3683 0x2c40d001 IND 
(1)] has the bad pointer (137) to the block (889190064)
bad_indirect_item: block 83676269: The item [243 3683 0x2c40d001 IND 
(1)] has the bad pointer (138) to the block (3603217321)
bad_indirect_item: block 83676269: The item [243 3683 0x2c40d001 IND 
(1)] has the bad pointer (139) to the block (3730289255)
/  3 (of   5)/ 55 (of 169)/ 10 (of 170)bad_indirect_item: block 
88516572: The item [243 3729 0xe802001 IND (1)] has the bad pointer (85) 
to the block (534175760)
bad_indirect_item: block 88516572: The item [243 3729 0xe802001 IND (1)] 
has the bad pointer (86) to the block (4123471330)
bad_indirect_item: block 88516572: The item [243 3729 0xe802001 IND (1)] 
has the bad pointer (88) to the block (1302319135)
bad_indirect_item: block 88516572: The item [243 3729 0xe802001 IND (1)] 
has the bad pointer (89) to the block (2374254057)
bad_indirect_item: block 88516572: The item [243 3729 0xe802001 IND (1)] 
has the bad pointer (90) to the block (1025097075)
bad_indirect_item: block 88516572: The item [243 3729 0xe802001 IND (1)] 
has the bad pointer (91) to the block (1896139112)
finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
Bad nodes were found, Semantic pass skipped
1 found corruptions can be fixed only when running with --rebuild-tree
###########
reiserfsck finished at Mon Jun  7 11:02:00 2004
###########



*== OK this wasn't looking good!*



cu:~# fsck.reiserfs --rebuild-tree /dev/video_vg/video_lv
reiserfsck 3.6.17 (2003 www.namesys.com)

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

Will rebuild the filesystem (/dev/video_vg/video_lv) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
Replaying journal..
Reiserfs journal '/dev/video_vg/video_lv' in blocks [18..8211]: 0 
transactions replayed
###########
reiserfsck --rebuild-tree started at Mon Jun  7 11:08:41 2004
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 143286769 blocks marked used
init_source_bitmap: Bitmap 32 (of 32768 bits) is wrong - mark all blocks 
[1048576 - 1081344] as used
init_source_bitmap: Bitmap 33 (of 32768 bits) is wrong - mark all blocks 
[1081344 - 1114112] as used
init_source_bitmap: Bitmap 34 (of 32768 bits) is wrong - mark all blocks 
[1114112 - 1146880] as used
*== <snip 7000+ lines>
*init_source_bitmap: Bitmap 7479 (of 32768 bits) is wrong - mark all 
blocks [245071872 - 245104640] as used
Skipping 15690 blocks (super block, journal, bitmaps) 245056326 blocks 
will be read
0%pass0: vpf-10200: block 7249989, item 0: The item [2591031556 2605 
0xabc14002 IND (1)] with wrong offset is deleted
.block 10364042: The free space (1792) is incorrect, should be (0) - 
corrected
pass0: vpf-10200: block 10364042, item 0: The item [3762553604 2612 
0xc185e000 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 10377556, item 0: The item [2861891844 2612 
0xc3fde002 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 11479222, item 0: The item [1682244356 2619 
0x143d7000 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 13001428, item 0: The item [2628256516 2621 
0x7bd3c003 IND (1)] with wrong offset is deleted
block 16382453: The number of items (5) is incorrect, should be (1) - 
corrected
block 16382453: The free space (0) is incorrect, should be (1340) - 
corrected
block 16382955: The number of items (5) is incorrect, should be (1) - 
corrected
block 16382955: The free space (0) is incorrect, should be (2300) - 
corrected
.pass0: vpf-10200: block 19823972, item 0: The item [4040687876 
3104705112 0x1d3860c1 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 19833355, item 0: The item [4242604292 2648 
0x1ef32000 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 20586461, item 0: The item [1080623876 2650 
0x44eaf003 IND (1)] with wrong offset is deleted
block 21313634: The number of items (1) is incorrect, should be (0) - 
corrected
block 21313634: The free space (0) is incorrect, should be (4072) - 
corrected
pass0: vpf-10200: block 21521981, item 0: The item [1512637188 2654 
0x28a7b002 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 24028337, item 0: The item [505479940 2664 
0x527b003 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 24609614, item 0: The item [950680836 2666 
0xbafc000 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 26838097, item 0: The item [3793620740 2672 
0x4d86b003 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 28230520, item 0: The item [1524825348 2676 
0x3a2ec003 IND (1)] with wrong offset is deleted
.block 29489802: The number of items (5) is incorrect, should be (1) - 
corrected
block 29489802: The free space (0) is incorrect, should be (668) - corrected
pass0: vpf-10200: block 32620052, item 0: The item [1689452804 2688 
0x59c6a000 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 35260022, item 0: The item [553320708 2698 
0x13595000 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 36071211, item 0: The item [46271748 2700 
0x43f32000 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 37366316, item 0: The item [3464430852 2704 
0x40619002 IND (1)] with wrong offset is deleted
.pass0: vpf-10200: block 39596079, item 0: The item [2623145732 2712 
0x4db1a000 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 39662401, item 0: The item [1150615812 2712 
0x59cce003 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 44032190, item 0: The item [3600024324 2724 
0x579de002 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 44535029, item 0: The item [1253638916 
1862404774 0x2f07b047 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 44544540, item 0: The item [879312644 2726 
0x30c2f003 IND (1)] with wrong offset is deleted
block 44608075: The number of items (1) is incorrect, should be (0) - 
corrected
block 44608075: The free space (0) is incorrect, should be (4072) - 
corrected
pass0: vpf-10200: block 44741935, item 0: The item [1346700036 2726 
0x54d4b003 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 49131969, item 0: The item [1614480132 2742 
0x1732d000 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 49352357, item 0: The item [3523543812 2742 
0x3f779000 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 49872753, item 0: The item [373621508 2747 
0xebf6000 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 50076841, item 0: The item [3796238084 2747 
0x340ea000 IND (1)] with wrong offset is deleted
pass0: vpf-10200: block 50289928, item 0: The item [1454048004 2747 
0x589fe003 IND (1)] with wrong offset is deleted
pass0: vpf-10110: block 50333320, item (0): Unknown item type found 
[2126383801 2749 0x5302300024d1001 ??? (4)] - deleted

*== and right now it's continuing at*
      left 194625329, 9467/sec
*== (it's going to be a while!)*


Thanks for your help, I'm going to get some coffee.


=======================
End of mail to support


 From here it continued and finally finished with:

Flushing..finished
        Objects without names 182
        Empty lost dirs removed 9
        Dirs linked to /lost+found: 60
        Files linked to /lost+found 122
        Objects having used objectids: 107
                files fixed 47
                dirs fixed 60
Pass 4 - finished done 134819, 48 /sec
        Deleted unreachable items 7928
Flushing..finished
Syncing..finished
###########
reiserfsck finished at Mon Jun  7 19:30:57 2004
###########


I remounted the system and it seems OK I have some lost data in 
./lost+found but they were mainly apt-cacher + jigdo things so no great 
shakes.
All my videos seem OK (not watched them all, obviously!) but I don't 
know if/when this is going down again...

I'm only (?) using 470Gb of space.
I'm *very* tempted to:
* shrink the fs down to 490 Gb
* shrink the lv to 490
* create a new 500Gb lv
* create an xfs fs
* copy over the data
* delete the reiser lv
* grow the xfs lv
* grow the xfs fs

thoughts?

David Greaves

