From: Ivan Ivanov <ivandi@vamo.orbitel.bg>
Subject: Simple preformance test
Date: Thu, 11 Apr 2002 15:14:03 +0300 (EEST)
Message-ID: <Pine.LNX.4.44.0204111506300.2077-100000@magic.vamo.orbitel.bg>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10026-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

After reading some messages about performance tests for ReiserFS
I decided to make my oun.
The test is simple:

1. Create 10 directories with 10000 files of 10240 bites in each dir
    "dd if=/dev/zero of=xxxx bs=1024 count=10"
2. Touch each file in each dir
3. Delete each file in each dir

Test shows that there is NO reasonable preformance degradation when the
amount of used space grows up.
Funy thing is that between 90% and 100% used space there is a performence
boost.

Test machine is P166 with 80MB RAM
kernel 2.4.18 with Reiserfs quota patches
test partition 1.2GB reiserfs
slackware 8.0

------------------------------------------------
Here are the results:

1. Create test
================================================
Dir No.		10000 files create time [ sec ]
------------------------------------------------
0			170
1 			171
2 			173
3 			172
4 			173
5 			174
6 			173
7 			174
8 			176
9 			155
================================================
test partition is 100% full
df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hda7              1172672   1170676      1996 100% /mnt/test

2. Touch test
================================================
Dir No.		10000 files touch time [ sec ]
------------------------------------------------
0 			132
1 			134
2 			133
3 			133
4 			132
5 			133
6 			133
7 			133
8 			133
9 			56
================================================

2. Delete test
================================================
Dir No.		10000 files delete time [ sec ]
------------------------------------------------
0 			142
1 			143
2 			144
3 			142
4 			143
5 			141
6 			142
7 			141
8 			141
9 			132
================================================

And here are the test scripts:

test.create
-----------
#!/bin/sh
block_size=1024
blocks_count=10
for d1 in 0 1 2 3 4 5 6 7 8 9; do
    echo -n "$d1 "
    begin_time=`date +%s`
    mkdir -p testdir/$d1
    for f1 in 0 1 2 3 4 5 6 7 8 9; do
        for f2 in 0 1 2 3 4 5 6 7 8 9; do
	    for f3 in 0 1 2 3 4 5 6 7 8 9; do
		for f4 in 0 1 2 3 4 5 6 7 8 9; do
		    dd if=/dev/zero of=testdir/$d1/$f1$f2$f3$f4 \
		        bs=$block_size count=$blocks_count \
		        >/dev/null 2>&1
		done
	    done
	done
    done
    end_time=`date +%s`
    echo $(($end_time - $begin_time))
done

test.touch
-----------
#!/bin/sh
for d1 in 0 1 2 3 4 5 6 7 8 9; do
    if [ -d testdir/$d1 ]; then
	echo -n "$d1 "
        begin_time=`date +%s`
	for f1 in 0 1 2 3 4 5 6 7 8 9; do
	    for f2 in 0 1 2 3 4 5 6 7 8 9; do
		for f3 in 0 1 2 3 4 5 6 7 8 9; do
		    for f4 in 0 1 2 3 4 5 6 7 8 9; do
			[ -f testdir/$d1/$f1$f2$f3$f4 ] && \
		    	    touch testdir/$d1/$f1$f2$f3$f4
		    done
	        done
	    done
        done
        touch testdir/$d1
        end_time=`date +%s`
        echo $(($end_time - $begin_time))
    fi
done

test.delete
-----------
#!/bin/sh
for d1 in 0 1 2 3 4 5 6 7 8 9; do
    echo -n "$d1 "
    begin_time=`date +%s`
    for f1 in 0 1 2 3 4 5 6 7 8 9; do
	for f2 in 0 1 2 3 4 5 6 7 8 9; do
	    for f3 in 0 1 2 3 4 5 6 7 8 9; do
		for f4 in 0 1 2 3 4 5 6 7 8 9; do
		    rm -f testdir/$d1/$f1$f2$f3$f4
	        done
	    done
	done
    done
    rm -rf testdir/$d1
    end_time=`date +%s`
    echo $(($end_time - $begin_time))
done

