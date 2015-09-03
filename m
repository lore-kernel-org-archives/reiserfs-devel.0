From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: [xfstests/generic/285] Regression from R4 patch 4.0.9 to 4.1.6
Date: Thu, 3 Sep 2015 11:57:50 +0200
Message-ID: <CADW=+3nso_whRtSB6op8rfYYoY_2oFef6-Q08JsoSS9ks_+8Hg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=m46RMP9baN3rEL27ZpG2lb0kMn6gQEoTgeWm1aZAHJE=;
        b=pg+qM+HWatCz36EsYav1TGkLhZMu+AVLfGVAHLxCqHkWeXEHbF5+B0an+IbkjFhYL5
         f7FaiMdDW7+aVrlIZhCnrlhFFRpCyzsxUAKZ25Z736XNCF4Hx+GouQcHpxmT+sH+umS4
         zmGTRLCnp8sal0PYVk3RLmMkECOXvFfmkN4vkHejy8MpR4uiSxe12w8HKCZ5AmHnlM3z
         dnT9G0xRTJAqfUmBx7EYAhrwUFFInLx2XRGwhwEib+QmsQfe5Pq9oU8P76f8ftS/GdEb
         J6CSefw40TYjTo+wY93FenmivKxyINBjN0ftqAui41WWyZIisKxiCA4mwuR6yWscycH7
         gAiQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Kernel: linux 4.1.6 and 4.0.9
R4 patch: 4.1.5 and 4.0.9
Test: xfstests/genersic/285
"SEEK_DATA/SEEK_HOLE sanity tests."

http://oss.sgi.com/cgi-bin/gitweb.cgi?p=xfs/cmds/xfstests.git;a=blob;f=tests/generic/285;hb=HEAD


With node40 and node41 and both ccreg40 and reg40 plugin on 4.0.9 and
3.18.6 test passes in 1s but on 4.1.6 with same .config it works for
hours.
Nothing in /var/log/messages

vmstat 2

 procs -----------memory---------- ---swap-- -----io---- -system--
------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 2  0      0 460268   3200  28132    0    0     0     0  252   15 14 87  0  0  0
 1  0      0 460268   3200  28132    0    0     0     0  252   12 13 87  0  0  0
 1  0      0 460268   3200  28132    0    0     0     0  253   14 13 88  0  0  0
 1  0      0 460268   3200  28132    0    0     0     0  252   14 12 88  0  0  0
 1  0      0 460268   3200  28132    0    0     0     0  252   14 11 90  0  0  0

ps -aux | grep sanity
root      1323 99.7  0.6   5392  3124 pts/0    R+   13:43   1:31
/root/xfstests/src/seek_sanity_test /mnt/test/seek_sanity_testfile


Reproducible with command:
 ./check 'generic/285'

with this local.config file for xfstests:

[r4ccHybrid]
MODULAR=0
TEST_DEV=/dev/hda5
TEST_DIR=/mnt/test
SCRATCH_DEV=/dev/hda7
SCRATCH_MNT=/mnt/scratch
RECREATE_TEST_DEV=true
RESULT_BASE="`pwd`/results/`date +%d%m%y_%H%M%S`"

FSTYP=reiser4

MKFS_OPTIONS=" "
MOUNT_OPTIONS="-o noatime"

[r4Hybrid]
MKFS_OPTIONS="-o create=reg40"
MOUNT_OPTIONS="-o noatime"

[r41ccHybrid]
MKFS_OPTIONS="-o node=node41"
MOUNT_OPTIONS="-o noatime"

[r41Hybrid]
MKFS_OPTIONS="-o create=reg40 -o node=node41"
MOUNT_OPTIONS="-o noatime"

If you need any other info I'll send it.

Have a nice day

Dushan
