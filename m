From: Bernhard Sadlowski <sadlowsk@mathematik.Uni-Bielefeld.DE>
Subject: bad_stat_data: block 1557090, [921 189485 0x0 SD (0)], SD has bad nlink number
Date: Sun, 4 Aug 2002 11:27:16 +0200
Sender: Bernhard Sadlowski <sadlowsk@Mathematik.Uni-Bielefeld.DE>
Message-ID: <20020804092716.GA17343@mathematik.uni-bielefeld.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11117-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I've upgraded from 2.4.18 (with several reiserpatches) to 2.4.19 (plain)
and also upgraded the reiserprogs to version 3.6.2. 

I see errors which won't be corrected with "--fix-fixable", although
reiserfsck says they will. Are they serious? Bug in reiserfsck?

Thanks,
Bernhard

This is the output of "time reiserfsck --check /dev/md0"

###########
reiserfsck --check started at Sun Aug  4 10:58:42 2002
###########
Replaying journal..
No transactions found
Checking S+tree../  1 (of   3)/ 12 (of 166)/ 18 (of  92)bad_stat_data:
block 1557090, [921 189485 0x0 SD (0)], SD has bad nlink number
/  3 (of   3)/ 67 (of 100)/  9 (of 170)bad_stat_data: block 1582967,
[198978 198986 0x0 SD (0)], directory SD has bad nlink number
ok
Comparing bitmaps..ok
Checking Semantic tree...
ok
There were found 2 corruptions which can be fixed with --fix-fixable
###########
reiserfsck finished at Sun Aug  4 11:02:32 2002
###########

real    3m55.568s
user    0m35.920s
sys     0m10.210s


This is the output of "time reiserfsck --fix-fixable /dev/md0"

###########
reiserfsck --fix-fixable started at Sun Aug  4 11:05:01 2002
###########
Replaying journal..
No transactions found
Checking S+tree..ok
Comparing bitmaps..ok
Checking Semantic tree...
ok
No corruptions found
There are on the filesystem:
        Leaves 65144
        Internal nodes 431
        Directories 13035
        Other files 207804
        Data block pointers 23448221 (18310 of them are zero)
        Safe links 0
###########
reiserfsck finished at Sun Aug  4 11:11:56 2002
###########

real    7m3.679s
user    0m39.330s
sys     0m17.780s

This is the output of a second "time reiserfsck --check /dev/md0"

###########
reiserfsck --check started at Sun Aug  4 11:12:31 2002
###########
Replaying journal..
No transactions found
Checking S+tree../  1 (of   3)/ 12 (of 166)/ 18 (of  92)bad_stat_data:
block 1557090, [921 189485 0x0 SD (0)], SD has bad nlink number
/  3 (of   3)/ 67 (of 100)/  9 (of 170)bad_stat_data: block 1582967,
[198978 198986 0x0 SD (0)], directory SD has bad nlink number
ok
Comparing bitmaps..ok
Checking Semantic tree...
ok
There were found 2 corruptions which can be fixed with --fix-fixable
###########
reiserfsck finished at Sun Aug  4 11:18:27 2002
###########

real    5m58.794s
user    0m40.080s
sys     0m13.940s

# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1] [raid5] [multipath]
read_ahead 1024 sectors
md0 : active raid1 hdg1[0] hde1[1]
      97685632 blocks [2/2] [UU]

unused devices: <none>

# cat /proc/fs/reiserfs/version
ReiserFS version 3.6.25 [as module]

# uname -r
2.4.19
