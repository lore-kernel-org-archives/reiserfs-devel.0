From: Mihai RUSU <dizzy@roedu.net>
Subject: reiserfs v3 vs v4 bonnie++ benchmarks
Date: Tue, 9 Mar 2004 18:27:34 +0200 (EET)
Message-ID: <Pine.LNX.4.58L0.0403091811140.5982@ahriman.bucharest.roedu.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17140-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi

Im playing with reiser4 lately and while doing this I have run some 
bonnie++ tests on both v3 and v4 reiserfs, on the same machine.

I have this interesting results (I have run the tests 3 times for each FS 
but the results were almost the same):

V3:
Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
dizzywork        1G 13459  71 62922  20 26061   6 15687  83 54593   8 191.0   0
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
files:max:min        /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
256:64000:16000/256  1287  27   165   2 11382  77  1230  25    63   1   253   2

V4:
Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
dizzywork        1G 16926  87 52469  15 26474  11 16759  85 55349   9 166.6   1
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
files:max:min        /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
256:64000:16000/256   863  40  1243  16  4219  47   873  46    81   1  3980  48

Interesting issues:
- - see that the "sequential writes" test using write with a 8192 bytes 
buffer is lower with v4 than with v3 (and it was like that in all tests)
- - both reiserfs v3 and v4 have almost same number of "little" files 
created in both sequential or random order but... reiser4 is much slower 
than v3 here
- - different than v3, reiser4 has almost the same speed at deleting small 
files in either random or sequential order but in the sequential case its 
much slower than v3
- - Im very glad to see the BIG speed increase in reading small files in 
sequential order although I would love to see more increase in the random 
order case (closer to real-life)

System information:
- - P4 2ghz 512 kb cache 2 x 256 MB DDR 
- - kernel 2.6.3 with reiser4 patch all.diff.gz downloaded today (from 
LATEST dir)
- - mkfs default options for both v3 and v4
- - 40 gb single partition on a 40 gb IDE drive 
hdparm -iv /dev/hdb

/dev/hdb:
 multcount    = 16 (on)
 IO_support   =  3 (32-bit w/sync)
 unmaskirq    =  0 (off)
 using_dma    =  1 (on)
 keepsettings =  0 (off)
 readonly     =  0 (off)
 readahead    = 256 (on)
 geometry     = 65535/16/63, sectors = 78165360, start = 0
 
udma5, writecache enabled (8mb cache)

- - kernel options :
$ grep -i reiser .config
CONFIG_REISER4_FS=y
# CONFIG_REISER4_FS_SYSCALL is not set
CONFIG_REISER4_LARGE_KEY=y
# CONFIG_REISER4_CHECK is not set
CONFIG_REISER4_USE_EFLUSH=y
# CONFIG_REISER4_COPY_ON_CAPTURE is not set
# CONFIG_REISER4_BADBLOCKS is not set
CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
# CONFIG_REISERFS_PROC_INFO is not set

- -- 
Mihai RUSU                                    Email: dizzy@roedu.net
GPG : http://dizzy.roedu.net/dizzy-gpg.txt    WWW: http://dizzy.roedu.net
                       "Linux is obsolete" -- AST
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFATfB5PZzOzrZY/1QRAnu5AJ9ZdGt9BE8iPz9iB/QrnzYOr2XIiwCcCgfb
lY0VWu16eyCMiQceZP1d708=
=l+SO
-----END PGP SIGNATURE-----
