From: Steven Cole <elenstev@mesatop.com>
Subject: Results of "bk clone" tests with 2.6.2,  reiser4, reiserfs, ext3,
	xfs and jfs
Date: Tue, 10 Feb 2004 16:39:14 -0700
Message-ID: <1076456354.1585.36.camel@spc.esa.lanl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16750-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Hans Reiser <reiser@namesys.com>

I tested ext3, reiser4, reiserfs, xfs and jfs on the
same disk partition, using kernel 2.6.2.  The system
is a dual 700Mhz PIII, SMP kernel, scsi disk.

Reiser4 came in second fastest for this particular test,
and was the most efficient at storing cloned bk trees.

I used the "-o key=key_short" option when creating the
reiser4 file system due to getting this message:
"kernel: WARNING: Key format mismatch. Only small keys are supported."

Other file systems were created with no special options.

The command given for the first of each run was:
$ /usr/bin/time bk clone -q testing-2.6 clone_1-2.6

The local "testing-2.6" tree was cloned from an ext3 file system
to the target file system under test, e.g.
$ bk clone -q testing-2.6 /e3_testing/testing-2.6

Data from the first of five runs on each file system:

ext3		57.66user 18.29system 1:50.42elapsed 68%CPU
reiser4		58.98user 37.25system 2:04.20elapsed 77%CPU
reiserfs	57.87user 21.79system 2:07.07elapsed 62%CPU
xfs		57.85user 20.58system 2:18.80elapsed 56%CPU
jfs		57.18user 15.24system 2:13.77elapsed 54%CPU

In each case, the first of five runs gave the best time.

The full results for all five runs for all five file systems
follows this summary.

Results of df -T for /dev/sda9 with 6 clones of 2.6 bk tree for
five file systems.

Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/sda9     ext3     4071744   1449120   2415792  38% /e3_testing
/dev/sda9  reiser4     3930680   1203224   2727456  31% /r4_testing
/dev/sda9 reiserfs     4136572   1301644   2834928  32% /r3_testing
/dev/sda9      xfs     4126464   1403412   2723052  35% /xfs_testing
/dev/sda9      jfs     4119988   1455152   2664836  36% /jfs_testing

Even though the same six trees were created, the reported Used space
varies quite a bit.  Reiser4 wins here. 

Here are the data from all the runs:

[steven@spc2 e3_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_1-2.6
57.66user 18.29system 1:50.42elapsed 68%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (21343major+154944minor)pagefaults 0swaps
[steven@spc2 e3_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_2-2.6
57.57user 17.72system 2:02.91elapsed 61%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (12639major+163648minor)pagefaults 0swaps
[steven@spc2 e3_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_3-2.6
57.29user 17.83system 2:02.27elapsed 61%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (10706major+165581minor)pagefaults 0swaps
[steven@spc2 e3_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_4-2.6
57.70user 17.80system 2:06.23elapsed 59%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (10668major+165619minor)pagefaults 0swaps
[steven@spc2 e3_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_5-2.6
57.31user 17.66system 2:03.02elapsed 60%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (10384major+165903minor)pagefaults 0swaps
[steven@spc2 e3_testing]$ df -T
Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/sda1     ext3      798476    155092    602824  21% /
/dev/sda8     ext3     7147260   3547248   3236948  53% /home
none         tmpfs      257336         0    257336   0% /dev/shm
/dev/sda6     ext3     4024188   1871100   1948664  49% /usr
/dev/sda7     ext3      806368     60396    705008   8% /var
/dev/sda9     ext3     4071744   1449120   2415792  38% /e3_testing


[steven@spc2 r4_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_1-2.6
58.98user 37.25system 2:04.20elapsed 77%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (2major+176402minor)pagefaults 0swaps
[steven@spc2 r4_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_2-2.6
58.74user 38.41system 2:14.33elapsed 72%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+176404minor)pagefaults 0swaps
[steven@spc2 r4_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_3-2.6
58.92user 38.54system 2:12.14elapsed 73%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (2major+176402minor)pagefaults 0swaps
[steven@spc2 r4_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_4-2.6
58.79user 38.18system 2:13.41elapsed 72%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (2major+176402minor)pagefaults 0swaps
[steven@spc2 r4_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_5-2.6
58.77user 38.08system 2:13.04elapsed 72%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (3major+176401minor)pagefaults 0swaps
[steven@spc2 r4_testing]$ df -T
Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/sda1     ext3      798476    155092    602824  21% /
/dev/sda8     ext3     7147260   3547740   3236456  53% /home
none         tmpfs      257336         0    257336   0% /dev/shm
/dev/sda6     ext3     4024188   1871100   1948664  49% /usr
/dev/sda7     ext3      806368     60396    705008   8% /var
/dev/sda9  reiser4     3930680   1203224   2727456  31% /r4_testing


[steven@spc2 r3_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_1-2.6
57.87user 21.79system 2:07.07elapsed 62%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (14582major+162660minor)pagefaults 0swaps
[steven@spc2 r3_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_2-2.6
58.11user 20.89system 2:41.70elapsed 48%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (12873major+164369minor)pagefaults 0swaps
[steven@spc2 r3_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_3-2.6
58.05user 20.95system 2:33.79elapsed 51%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (12721major+164521minor)pagefaults 0swaps
[steven@spc2 r3_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_4-2.6
58.45user 21.51system 2:33.44elapsed 52%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (12597major+164645minor)pagefaults 0swaps
[steven@spc2 r3_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_5-2.6
58.01user 21.57system 2:34.61elapsed 51%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (12416major+164826minor)pagefaults 0swaps
[steven@spc2 r3_testing]$ df -T
Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/sda1     ext3      798476    155096    602820  21% /
/dev/sda8     ext3     7147260   3548168   3236028  53% /home
none         tmpfs      257336         0    257336   0% /dev/shm
/dev/sda6     ext3     4024188   1871100   1948664  49% /usr
/dev/sda7     ext3      806368     60396    705008   8% /var
/dev/sda9 reiserfs     4136572   1301644   2834928  32% /r3_testing

[steven@spc2 xfs_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_1-2.6
57.85user 20.58system 2:18.80elapsed 56%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (19309major+156978minor)pagefaults 0swaps
[steven@spc2 xfs_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_2-2.6
57.18user 19.62system 2:44.10elapsed 46%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (11460major+164827minor)pagefaults 0swaps
[steven@spc2 xfs_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_3-2.6
57.75user 19.72system 2:28.18elapsed 52%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (9789major+166498minor)pagefaults 0swaps
[steven@spc2 xfs_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_4-2.6
57.45user 20.04system 2:30.13elapsed 51%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (10556major+165731minor)pagefaults 0swaps
[steven@spc2 xfs_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_5-2.6
57.75user 19.64system 2:28.46elapsed 52%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (10348major+165939minor)pagefaults 0swaps
[steven@spc2 xfs_testing]$ df -T
Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/sda1     ext3      798476    155100    602816  21% /
/dev/sda8     ext3     7147260   3548168   3236028  53% /home
none         tmpfs      257336         0    257336   0% /dev/shm
/dev/sda6     ext3     4024188   1871100   1948664  49% /usr
/dev/sda7     ext3      806368     60396    705008   8% /var
/dev/sda9      xfs     4126464   1403412   2723052  35% /xfs_testing

[steven@spc2 jfs_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_1-2.6
57.18user 15.24system 2:13.77elapsed 54%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (18052major+158235minor)pagefaults 0swaps
[steven@spc2 jfs_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_2-2.6
56.83user 13.95system 2:29.60elapsed 47%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (11788major+164499minor)pagefaults 0swaps
[steven@spc2 jfs_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_3-2.6
57.37user 14.06system 2:24.45elapsed 49%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (10592major+165695minor)pagefaults 0swaps
[steven@spc2 jfs_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_4-2.6
57.20user 14.32system 2:24.41elapsed 49%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (11455major+164832minor)pagefaults 0swaps
[steven@spc2 jfs_testing]$ /usr/bin/time bk clone -q testing-2.6 clone_5-2.6
57.13user 14.18system 2:27.03elapsed 48%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (10952major+165335minor)pagefaults 0swaps
[steven@spc2 jfs_testing]$ df -T
Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/sda1     ext3      798476    155104    602812  21% /
/dev/sda8     ext3     7147260   3548168   3236028  53% /home
none         tmpfs      257336         0    257336   0% /dev/shm
/dev/sda6     ext3     4024188   1871100   1948664  49% /usr
/dev/sda7     ext3      806368     60396    705008   8% /var
/dev/sda9      jfs     4119988   1455152   2664836  36% /jfs_testing

Steven

