From: tim fitz <fitzboy@iparadigms.com>
Subject: quick question
Date: 25 Jul 2003 12:08:40 -0700
Message-ID: <1059160120.17256.1065.camel@tfitz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15047-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi everyone,
This is Tim Fitz over at iParadigms (www.turnitin.com). We've been doing
some more playing with reiser and it seems to be running pretty well,
but every now and then our Dell PERC card seems to throw a tantrum and
kill the machine. Well either way, we have been happy for a few months
but now we are in the hole again. The machine is up but on two of our
partitions we have errors. After running reiserfsck we got the messages
below. I was wondering if there was any serious worries about trying to
fix these errors with reiserfsprogs-3.6.10? Anything I should worry
about? I know the --check happened with older utilities, but I just
downloaded the 3.6.10... Anything I should worry about? Or is there any
special thing I should do?

Thanks alot!!!

Tim


--------------------------------------

rep1:~/reiserfsprogs-3.6.5-pre2/fsck # ./reiserfsck --check /dev/sdb1

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.5-pre2

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

Will read-only check consistency of the filesystem on /dev/sdb1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
###########
reiserfsck --check started at Wed Jul 23 10:18:36 2003
###########
Replaying journal..
0 transactions replayed
Checking internal tree../  1 (of  34)/119 (of 147)/ 80 (of 162)/ 60 (of
136)block 562318: The level of the node (0) is not correct, (1) expected
 the problem in the internal node occured (562318), whole subtree is
skipped
/  2 (of  34)/ 16 (of 133)/ 40 (of 159)/114 (of 152)bad_leaf: block
1429700, items 4 and 5: The wrong order of items: [53184 4693494 0x1
DRCT (2)], [53184 4693495 0x1 DRCT (2)]
/115 (of 152)block 1429701: The level of the node (3) is not correct,
(1) expected
 the problem in the internal node occured (1429701), whole subtree is
skipped
/116 (of 133)/ 52 (of 170)/ 34 (of 167)block 4228346: The level of the
node (0) is not correct, (1) expected
 the problem in the internal node occured (4228346), whole subtree is
skipped
/  3 (of  34)/ 55 (of 133)/ 98 (of 170)/168 (of 169)block 6338838: The
level of the node (0) is not correct, (1) expected
 the problem in the internal node occured (6338838), whole subtree is
skipped
/126 (of 133)/117 (of 170)/ 78 (of 169)block 8449305: The level of the
node (0) is not correct, (1) expected
 the problem in the internal node occured (8449305), whole subtree is
skipped
/  8 (of  34)/ 49 (of  86)/153 (of 170)/109 (of 164)bad_indirect_item:
block 35031784: The item (125113 78494461 0x1 IND (1), len 4, location
2356 entry count 0, fsck need 0, format new) has the bad pointer (0) to
the block (28235501), which is in tree already
/ 60 (of  86)/ 51 (of 170)/152 (of 162)bad_leaf: block 35463068, items 5
and 6: The wrong order of items: [125477 79460671 0x1001 DRCT (2)],
[125477 79460672 0x1 DRCT (2)]
/153 (of 162)block 35463069: The level of the node (30425) is not
correct, (1) expected
 the problem in the internal node occured (35463069), whole subtree is
skipped
/ 12 (of  34)/168 (of 170)/ 86 (of 170)/154 (of 170)block 59632218: The
level of the node (40122) is not correct, (1) expected
 the problem in the internal node occured (59632218), whole subtree is
skipped
/ 13 (of  34)/ 18 (of 170)/ 54 (of 170)/ 80 (of 169)block 60421583: The
level of the node (45664) is not correct, (1) expected
 the problem in the internal node occured (60421583), whole subtree is
skipped
/ 14 (of  34)/153 (of 170)/  6 (of 170)/165 (of 169)bad_indirect_item:
block 72433096: The item [153420 168695575 0x1 IND (1)] has the bad
pointer (0) to the block (4260207410)
bad_indirect_item: block 72433096: The item [153420 168695576 0x1 IND
(1)] has the bad pointer (0) to the block (1133521883)
/ 15 (of  34)/ 10 (of 170)/ 41 (of 170)/ 54 (of 167)block 73505462: The
level of the node (20372) is not correct, (1) expected
 the problem in the internal node occured (73505462), whole subtree is
skipped
/ 13 (of 170)/  4 (of 170)/ 75 (of 167)block 73616595: The level of the
node (19986) is not correct, (1) expected
 the problem in the internal node occured (73616595), whole subtree is
skipped
/ 44 (of 170)/117 (of 170)/150 (of 168)block 74879572: The level of the
node (15017) is not correct, (1) expected
 the problem in the internal node occured (74879572), whole subtree is
skipped
/ 16 (of  34)/ 53 (of 170)/ 55 (of 170)/103 (of 169)block 81849488: The
level of the node (58986) is not correct, (1) expected
 the problem in the internal node occured (81849488), whole subtree is
skipped
/ 18 (of  34)/ 90 (of 170)/ 71 (of 170)/ 14 (of 170)block 96149585: The
level of the node (2079) is not correct, (1) expected
 the problem in the internal node occured (96149585), whole subtree is
skipped
/ 98 (of 170)/ 55 (of 170)/ 90 (of 168)block 96447299: The level of the
node (46106) is not correct, (1) expected
 the problem in the internal node occured (96447299), whole subtree is
skipped
/ 21 (of  34)/ 82 (of 170)/149 (of 170)/ 87 (of 170)block 108707229: The
level of the node (51164) is not correct, (1) expected
 the problem in the internal node occured (108707229), whole subtree is
skipped
/150 (of 170)/ 47 (of 170)/ 36 (of 169)block 111097021: The level of the
node (2850) is not correct, (1) expected
 the problem in the internal node occured (111097021), whole subtree is
skipped
/155 (of 170)/ 14 (of 170)/ 78 (of 170)block 111269980: The level of the
node (35589) is not correct, (1) expected
 the problem in the internal node occured (111269980), whole subtree is
skipped
/ 22 (of  34)/ 29 (of  86)/ 67 (of 170)/ 65 (of 170)block 112942176: The
level of the node (9706) is not correct, (1) expected
 the problem in the internal node occured (112942176), whole subtree is
skipped
/ 24 (of  34)/ 38 (of 170)/ 53 (of 170)/101 (of 170)block 120103820: The
level of the node (30830) is not correct, (1) expected
 the problem in the internal node occured (120103820), whole subtree is
skipped
/137 (of 170)/ 67 (of 170)/ 38 (of 168)block 123964496: The level of the
node (28828) is not correct, (1) expected
 the problem in the internal node occured (123964496), whole subtree is
skipped
/ 25 (of  34)/  2 (of 170)/164 (of 170)/155 (of 170)block 125380199: The
level of the node (8152) is not correct, (1) expected
 the problem in the internal node occured (125380199), whole subtree is
skipped
/ 61 (of 170)/ 14 (of 170)/101 (of 170)block 127605491: The level of the
node (61328) is not correct, (1) expected
 the problem in the internal node occured (127605491), whole subtree is
skipped
/ 32 (of  34)/ 33 (of 170)/ 51 (of 170)/120 (of 170)block 166100880: The
level of the node (59985) is not correct, (1) expected
 the problem in the internal node occured (166100880), whole subtree is
skipped
finished                                            
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps
differs.
Bad nodes were found, Semantic pass skipped
25 found corruptions can be fixed only during --rebuild-tree
###########
reiserfsck finished at Thu Jul 24 11:03:56 2003
###########

And then for the next partition:

rep1:~/reiserfsprogs-3.6.5-pre2/fsck # ./reiserfsck --check /dev/sdb2

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.5-pre2

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

Will read-only check consistency of the filesystem on /dev/sdb2
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
###########
reiserfsck --check started at Thu Jul 24 12:50:31 2003
###########
Replaying journal..
0 transactions replayed
Checking internal tree../  1 (of  38)/  1 (of 134)/ 14 (of 170)/122 (of
170)block 12586: The level of the node (0) is not correct, (1) expected
 the problem in the internal node occured (12586), whole subtree is
skipped
/ 16 (of 170)/149 (of 170)block 12955: The level of the node (0) is not
correct, (1) expected
 the problem in the internal node occured (12955), whole subtree is
skipped
/ 19 (of 170)/ 13 (of 170)block 13333: The level of the node (0) is not
correct, (1) expected
 the problem in the internal node occured (13333), whole subtree is
skipped
/ 27 (of 134)/136 (of 170)/ 10 (of 170)block 38189287: The level of the
node (33416) is not correct, (1) expected
 the problem in the internal node occured (38189287), whole subtree is
skipped
/110 (of 134)/ 82 (of 170)/ 25 (of 170)bad_indirect_item: block 344764:
The item (6856 1140155 0x1 IND (1), len 4, location 2096 entry count 0,
fsck need 0, format new) has the bad pointer (0) to the block
(19768492), which is in tree already
/ 30 (of  38)/132 (of 150)/ 35 (of 170)/ 20 (of 170)block 137322975: The
level of the node (2978) is not correct, (1) expected
 the problem in the internal node occured (137322975), whole subtree is
skipped
/ 31 (of  38)/ 93 (of 151)/ 85 (of 170)/ 40 (of 170)block 141041249: The
level of the node (18584) is not correct, (1) expected
 the problem in the internal node occured (141041249), whole subtree is
skipped
/ 36 (of  38)/ 83 (of 170)/167 (of 170)/168 (of 170)block 168706380: The
level of the node (7700) is not correct, (1) expected
 the problem in the internal node occured (168706380), whole subtree is
skipped
/ 37 (of  38)/ 64 (of  86)/ 51 (of 170)/ 63 (of 170)block 173878258: The
level of the node (0) is not correct, (1) expected
 the problem in the internal node occured (173878258), whole subtree is
skipped
/ 38 (of  38)/ 43 (of  85)/ 17 (of 170)/  5 (of 170)block 176139253: The
level of the node (14589) is not correct, (1) expected
 the problem in the internal node occured (176139253), whole subtree is
skipped
/ 44 (of  85)/ 37 (of 170)/ 81 (of 170)block 176178623: The level of the
node (19543) is not correct, (1) expected
 the problem in the internal node occured (176178623), whole subtree is
skipped
finished                               
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps
differs.
Bad nodes were found, Semantic pass skipped
10 found corruptions can be fixed only during --rebuild-tree
###########
reiserfsck finished at Thu Jul 24 22:37:40 2003
###########
rep1:~/reiserfsprogs-3.6.5-pre2/fsck # 

