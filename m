From: Hans Reiser <reiser@namesys.com>
Subject: Re: mongo.pl: 2.6.9-cko3, xattrs + journaling
Date: Sat, 20 Nov 2004 11:02:29 -0800
Message-ID: <419F94C5.9070204@namesys.com>
References: <200411201742.25912.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22448-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411201742.25912.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

Christian Mayrhuber wrote:

>Hi,
>
>I did some runs of mongo to see how the journaling filesystems compare to each 
>other on a recent kernel.
>My focus has been how the fs's compare with enabled acls and xattrs.
>
>Summary:
>--------
>1) data=ordered + acl: reiserfs is best for writing, ext3 for reading.
>   I guess reiserfs becomes slow on reading with acls because it has to
>   open two files?
>   Reiserfs halfes the stat performance when acl's are enabled.
>2) No data=ordered, but acl: jfs seems to be best.
>   I also tried jfs with the case-insensitive mount option, with neglectable
>   different results.
>   xfs cannot win over jfs, even for large files.
>3) data=ordered, no acl: reiserfs outperforms even jfs 
>
>I've been using the ck "overloaded" patch to get reiser4 into the stable 
>kernel. Reiser4 is the one from 2.6.9-mm1 and it's in just for curiosity.
>Reiser4 is best on space, but slow on modify, overwrite and delete
>  
>
I don't think the modify phase is legitimately designed.  Real 
applications are not fully random in what they modify, and if they are, 
it requires a repacker to fix it right.  That is why we don't use it for 
general purpose benchmarking.  Nikita disagrees with me.  To make 
reiser4 fast at deletes, use -o extent40.

>Maybe there is something wrong with this specific patch.
>
>Ext3 is very quick for stat operations.
>
>Athlon XP 1900+
>512MB RAM
>12GB loopback device on reiserfs
>Take these results with care, as they have been run on a 12GB loopback device.
>Kernel has been run with elevator=as, preempt disabled.
>All fs that offer acl's have them enabled.
>The filesize is 16900 bytes because it's the average file size on my disk.
>
>  
>
>
> ------------------------------------------------------------------------
>
> reiser4
>     2.6.9-cko3
> mem total
>     516532
> machine
>     byblos
> kernel
>     2.6.9-k7-cko3 #1 Fri Nov 19 20:13:50 CET 2004
> date
>     Fre 19 Nov 2004 21:37:51 CET
> .config
>     PLEASE take care to make .config file available when you publish
>     benchmark results. At namesys, .config should be stored somewhere
>     in the internal benchmark directory (intbenchmarks/mongo/), and
>     link to it is added to the resulting html document.
>
>
> A. FSTYPE=reiserfs MKFS=mkfs.reiserfs -q 
> MOUNT_OPTIONS="user_xattr,acl,attrs"
> B. FSTYPE=ext3 MKFS=mkfs.ext3 -q -O 
> dir_index,filetype,has_journal,sparse_super -q 
> MOUNT_OPTIONS="user_xattr,acl"
> C. FSTYPE=xfs MKFS=mkfs.xfs -f MOUNT_OPTIONS="defaults"
> D. FSTYPE=jfs MKFS=mkfs.jfs -q MOUNT_OPTIONS="defaults"
> E. FSTYPE=reiserfs MKFS=mkfs.reiserfs -q 
> MOUNT_OPTIONS="notail,nouser_xattr,noacl,noattrs,nodiratime,noatime"
> F. FSTYPE=ext3 MKFS=mkfs.ext3 -q -O 
> dir_index,filetype,has_journal,sparse_super -q 
> MOUNT_OPTIONS="noatime,nouser_xattr,noacl"
> G. FSTYPE=reiser4 MKFS=mkfs.reiser4 -q MOUNT_OPTIONS="defaults"
> *#0:FSTYPE=reiserfs MKFS=mkfs.reiserfs -q 
> MOUNT_OPTIONS="user_xattr,acl,attrs" *
>
> 	*REAL_TIME* 	*CPU_TIME* 	*CPU_UTIL* 	*DF*
>
> 	*A* 	*B/A * 	*C/A * 	*D/A * 	*E/A * 	*F/A * 	*G/A * 	*A* 	*B/A * 
> *C/A * 	*D/A * 	*E/A * 	*F/A * 	*G/A * 	*A* 	*B/A * 	*C/A * 	*D/A * 
> *E/A * 	*F/A * 	*G/A * 	*A* 	*B/A * 	*C/A * 	*D/A * 	*E/A * 	*F/A * 
> *G/A *
> *CREATE* 	336.71 	0.969 	0.649 	0.612 	0.711 	0.711 	_ 0.403_ 	38.11 
> 0.701 	0.645 	_ 0.447_ 	0.896 	0.697 	1.134 	17.57 	_ 0.894_ 	1.451 
> 1.204 	1.311 	1.176 	2.739 	3563436 	1.031 	1.018 	1.027 	1.012 
> 1.031 	_ 0.978_
> *COPY* 	446.56 	1.175 	1.089 	0.969 	_ 0.808_ 	1.135 	0.866 	47.25 
> 0.680 	0.777 	_ 0.516_ 	0.931 	0.655 	1.255 	19.29 	_ 0.736_ 	0.923 
> 0.815 	1.160 	_ 0.730_ 	1.354 	7126920 	1.031 	1.018 	1.027 	1.012 
> 1.031 	_ 0.978_
> *APPEND* 	1044.31 	1.045 	0.935 	_ 0.867_ 	_ 0.868_ 	1.019 	0.980 
> 47.25 	0.616 	0.581 	_ 0.424_ 	0.864 	0.606 	1.423 	8.52 	_ 0.829_ 
> 0.982 	0.905 	1.062 	_ 0.836_ 	1.561 	_ 10491608_ 	_ 1.020_ 	_ 
> 1.009_ 	_ 1.015_ 	_ 1.006_ 	_ 1.020_ 	_ 1.007_
> *MODIFY* 	1509.01 	1.057 	0.840 	_ 0.809_ 	0.850 	0.925 	1.468 
> 15.48 	0.716 	0.924 	_ 0.522_ 	0.693 	0.641 	1.392 	_ 2.60_ 	_ 
> 1.015_ 	1.285 	1.227 	1.038 	_ 1.008_ 	2.642 	_ 10492004_ 	_ 1.020_ 	_ 
> 1.009_ 	_ 1.015_ 	_ 1.006_ 	_ 1.020_ 	_ 1.007_
> *OVERWRITE* 	1548.84 	1.245 	0.816 	_ 0.788_ 	0.811 	1.211 	1.731 
> 44.71 	0.817 	0.838 	_ 0.611_ 	0.874 	0.780 	1.483 	7.99 	0.900 
> 1.235 	1.069 	1.163 	0.795 	_ 0.758_ 	_ 10492736_ 	1.020 	_ 1.009_ 	_ 
> 1.015_ 	_ 1.006_ 	1.020 	_ 0.997_
> *READ* 	1631.94 	0.465 	0.524 	0.627 	_ 0.419_ 	0.432 	0.631 	30.05 
> 0.720 	0.936 	_ 0.662_ 	0.865 	_ 0.649_ 	1.426 	_ 6.68_ 	1.672 
> 1.585 	1.274 	1.811 	1.626 	1.412 	_ 10492736_ 	1.020 	_ 1.009_ 	_ 
> 1.015_ 	_ 1.006_ 	1.020 	_ 0.997_
> *STATS* 	142.18 	_ 0.224_ 	0.400 	0.703 	0.493 	_ 0.224_ 	0.600 
> 4.83 	0.874 	1.932 	_ 0.839_ 	0.907 	_ 0.828_ 	1.215 	_ 5.70_ 	2.674 
> 3.528 	1.063 	1.337 	2.582 	1.411 	_ 10492736_ 	1.020 	_ 1.009_ 	_ 
> 1.015_ 	_ 1.006_ 	1.020 	_ 0.997_
> *DELETE* 	45.45 	8.237 	1.696 	1.726 	_ 0.501_ 	7.788 	15.589 	18.12 
> 0.638 	1.848 	_ 0.482_ 	0.998 	0.571 	2.161 	41.06 	0.120 	1.331 
> 0.444 	1.929 	_ 0.092_ 	0.158 	_ 0_ 	0/0 	63400/0 	9068/0 	0/0 	0/0 	4/0
> *#1:DD_MBCOUNT=9216 *
>
> 	*REAL_TIME* 	*CPU_TIME* 	*CPU_UTIL* 	*DF*
>
> 	*A* 	*B/A * 	*C/A * 	*D/A * 	*E/A * 	*F/A * 	*G/A * 	*A* 	*B/A * 
> *C/A * 	*D/A * 	*E/A * 	*F/A * 	*G/A * 	*A* 	*B/A * 	*C/A * 	*D/A * 
> *E/A * 	*F/A * 	*G/A * 	*A* 	*B/A * 	*C/A * 	*D/A * 	*E/A * 	*F/A * 
> *G/A *
> *dd_writing_largefile* 	1625.04 	0.862 	0.915 	1.009 	0.872 	0.874 	_ 
> 0.774_ 	108.98 	1.410 	_ 0.809_ 	1.063 	0.979 	1.469 	1.044 	_ 
> 17.53_ 	1.396 	_ 1.015_ 	1.052 	1.127 	1.354 	1.270 	_ 9446568_ 	_ 
> 1.000_ 	_ 1.006_ 	_ 1.000_ 	_ 1.000_ 	_ 1.000_ 	_ 0.999_
> *dd_reading_largefile* 	891.95 	_ 0.942_ 	1.078 	_ 0.950_ 	_ 0.945_ 	_ 
> 0.934_ 	_ 0.936_ 	88.07 	0.869 	_ 0.841_ 	_ 0.856_ 	0.972 	0.862 
> 0.945 	22.70 	1.022 	_ 0.924_ 	1.004 	1.048 	1.012 	1.140 	_ 
> 9446568_ 	_ 1.000_ 	_ 1.006_ 	_ 1.000_ 	_ 1.000_ 	_ 1.000_ 	_ 0.999_
>
>
> *NPROC=1 DIR=/mnt SYNC=off REP_COUNTER=3 GAMMA=0.2 DEV=/dev/loop0 
> DD_MBCOUNT=9216 WRITE_BUFFER=4096 BYTES=1000000000 FILE_SIZE=16900 *
> Produced by Mongo <http://namesys.com/mongo> benchmark suite.
>

