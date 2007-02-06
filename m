From: "Xu CanHao" <xucanhao@gmail.com>
Subject: Investigate on r4 iozone/sql-bench performance bottleneck: stage one
Date: Tue, 6 Feb 2007 16:37:10 +0800
Message-ID: <6ec7a4340702060037i4d3de586ua89ca4d3d749d140@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30542-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

Hi!

I've made an analysis of r4 performance bottleneck on sql-bench/iozone
recently, and here is the conclusion:

1, default iozone benchmarks(-Ra) only involves
read()/write()/fread()/fwrite()...etc, although many fsync() during
iozone, the fsync() time is not calculated in the result, the function
invocation pattern is like(iozone -s 4K -r 1K):

gettimeofday({1170749541, 313179}, NULL) = 0 <0.000015>
write(3, "vvvvvvvv\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024 <0.000174>
write(3, "vvvvvvvv\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024 <0.000060>
write(3, "vvvvvvvv\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024 <0.000057>
write(3, "vvvvvvvv\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024 <0.000094>
gettimeofday({1170749541, 313904}, NULL) = 0 <0.000008>


gettimeofday({1170749541, 733165}, NULL) = 0 <0.000015>
read(3, "vvvvvvvv\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024 <0.000019>
read(3, "vvvvvvvv\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024 <0.000020>
read(3, "vvvvvvvv\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024 <0.000017>
read(3, "vvvvvvvv\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024 <0.000020>
gettimeofday({1170749541, 733527}, NULL) = 0 <0.000014>

2, sql-bench is the same(only use 'test-create'),

here is the pattern of r4:

read(3, "\7\0\0\1\0\0\0\2\0\0\0", 16384) = 11 <0.110106>
poll([{fd=3, events=POLLIN|POLLPRI}], 1, 0) = 0 <0.000008>
write(3, "c\0\0\0\3create table bench_127 (i i"..., 103) = 103 <0.000008>
read(3, "\7\0\0\1\0\0\0\2\0\0\0", 16384) = 11 <0.121058>
poll([{fd=3, events=POLLIN|POLLPRI}], 1, 0) = 0 <0.000113>
write(3, "c\0\0\0\3create table bench_128 (i i"..., 103) = 103 <0.000017>
read(3, "\7\0\0\1\0\0\0\2\0\0\0", 16384) = 11 <0.110034>
poll([{fd=3, events=POLLIN|POLLPRI}], 1, 0) = 0 <0.000017>
write(3, "c\0\0\0\3create table bench_129 (i i"..., 103) = 103 <0.000017>

and ext3:

read(3, "\7\0\0\1\0\0\0\2\0\0\0", 16384) = 11 <0.003257>
poll([{fd=3, events=POLLIN|POLLPRI}], 1, 0) = 0 <0.000017>
write(3, "c\0\0\0\3create table bench_805 (i i"..., 103) = 103 <0.000016>
read(3, "\7\0\0\1\0\0\0\2\0\0\0", 16384) = 11 <0.004001>
poll([{fd=3, events=POLLIN|POLLPRI}], 1, 0) = 0 <0.000017>
write(3, "c\0\0\0\3create table bench_806 (i i"..., 103) = 103 <0.000008>
read(3, "\7\0\0\1\0\0\0\2\0\0\0", 16384) = 11 <0.003697>
poll([{fd=3, events=POLLIN|POLLPRI}], 1, 0) = 0 <0.000017>
write(3, "c\0\0\0\3create table bench_807 (i i"..., 103) = 103 <0.000018>

yes...read() on r4 costs ~0.11s while ext3 ~0.003s, definitely the
reason why r4 costs 2667s on create tables and ext3's 203s

3, mongo_read.c in mongo tests uses a read(..., ..., 4096), and the
result is good for r4.

4, 'cp' uses a read(..., ..., 65536), and the result is good for r4 too.
(a part of pattern when copying a big file)
read(3, ":\0064o\270\276\211(\236\241\242\205!\372\375Z\371/\30"...,
65536) = 65536 <0.000067>
write(4, ":\0064o\270\276\211(\236\241\242\205!\372\375Z\371/\30"...,
65536) = 65536 <0.000093>
read(3, "\37X\t\205\334\210\242E%8\t\211\2c\365\37\363\35\305%\206"...,
65536) = 65536 <0.000217>
write(4, "\37X\t\205\334\210\242E%8\t\211\2c\365\37\363\35\305%\206"...,
65536) = 65536 <0.000083>
read(3, "\275\205%\263\0\273M\206\200\24\31\243\204\37!\252\231"...,
65536) = 65536 <0.000066>
write(4, "\275\205%\263\0\273M\206\200\24\31\243\204\37!\252\231"...,
65536) = 65536 <0.000081>

5, The Conclusion "MAYBE": JFS uses "generic_file_*" on read()/write()
and performs best in iozone/sql-bench. r3 uses "generic_file_read" on
read() and performs good on sql-bench too. r4 uses its own
"read_unix_file" on read(), behaves worst on iozone/sql-bench and best
on mongo_read/cp. Anyhow, read_unix_file() must be improved(it is not
be possible replaced by generic_file_read directly).

Comments...?


On Wednesday 24 January 2007 17:05, Xu CanHao wrote:
> Hi!
>
> I've got a benchmark about "reiser4 on mysql" and found a remarkable
> extremely low performance, i managed to turn off fsync() in
> fs/reiser4/plugin/file/file.c (nullify the sync_unix_file() function),
> but it STILL VERY SLOW. I could not found any information about both
> in the mailing-list and google-groups. Here is the detail:
>
> C2.26+I845G+256MB+WD80GB
> Slackware 11.0(Vanilla 2.6.18.3+r4_patch+1.0.5)
> mysql-5.0.24a
> testing use the "sql-bench", all result in seconds.
>
>           Alter  ATIS  Big  Connect  Create  Insert
> Ext3.o   32     21    25      221        203    1979
> JFS      15     21    25      223        114    1711
> XFS     22     22    25       229      1091    1744
> R3        29     20    25      224        194    1731
> R4        70     73    27      276       2667    3499
> nofsync 51     72    26      271        594    3227
>
> Seems even R4 w/o fsync speeds up abit, it's still TERRIBLY SLOW.
> could you tell me why?



>> 6.What else performance bottlenecks do you know, except
> fsync/sql-bench? Could you give me a list?
>

I used to benchmark with iozone and iozone -B. Last time I did reiser4
did  not perforrm well on it.
