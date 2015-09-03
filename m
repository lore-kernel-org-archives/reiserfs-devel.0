From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [xfstests/generic/285] Regression from R4 patch 4.0.9 to 4.1.6
Date: Thu, 3 Sep 2015 13:09:12 +0200
Message-ID: <55E82A58.2020309@gmail.com>
References: <CADW=+3nso_whRtSB6op8rfYYoY_2oFef6-Q08JsoSS9ks_+8Hg@mail.gmail.com>
 <55E81CD4.6090900@gmail.com>
 <CADW=+3mLc4ToTa40PBvmJeHLO5pR+4jzxYmu-cbOupYG-8o1pg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=YRiMekCyVtCoG0KLiyxhT+FC0RvEdn1mUDgJPfy9rP8=;
        b=nFPNd15Y3okZlmooKw3lmnJCpKR3C/CwfJCruP/a6drB9jr3OjcIWPCuXJcsEaqeCO
         GCRQz4xwDtK10T6Lv/ma1hfYtdeuffefEATIT8caHRi7/R2YyPRTg7iL/I7qcKMn8hGe
         AUXT2DpJo6igve0p6WASn86fDeL5UB5RPcStZyTeibyQShg2fbq6LqhlTz21b8uGMaXw
         XTHNRbo8BcjEzS1Qqadmi9qgeeVnreHHB5cdKSMqpW8IH63IJyb6M2jRvD8O7t1wylXG
         ccQ4EA1P2BwNi0AuPKOqulXnlVEH+H79HqD6USWW7WXYerhLH8xdretUB904vRRfjXZn
         oRHA==
In-Reply-To: <CADW=+3mLc4ToTa40PBvmJeHLO5pR+4jzxYmu-cbOupYG-8o1pg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hmm. Works for me:

generic/285     0s
Ran: generic/285
Passed all 1 tests

# uname -a
Linux zeta 4.1.6 #1

Could you please say  "echo w > /proc/sysrq-trigger"
when hanging with the test and send the kernel logs?

Edward.

On 09/03/2015 12:23 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> This is the C source of sanity test that is used:
> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3Db=
lob;f=3Dsrc/seek_sanity_test.c;hb=3DHEAD
>
> Sync doesn't help.
> vmstat 2 results on sync are those with bo 108, 52+18 and 64:
>
> procs -----------memory---------- ---swap-- -----io---- -system-- ---=
---cpu-----
>   r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us=
 sy id wa st
>   3  0      0 455928   3136  31708    0    0     0     0  261   93 22=
 79  0  0  0
>   2  0      0 455928   3136  31708    0    0     0     0  252  258 51=
 49  0  0  0
>   1  0      0 455548   3164  31708    0    0     0    18  264   59 19=
 82  0  0  0
>   3  0      0 455548   3188  31708    0    0     0    12  256   26 15=
 86  0  0  0
>   1  0      0 455428   3212  31708    0    0     0    14  263   78 14=
 86  0  0  0
>   1  0      0 455436   3212  31708    0    0     0     0  252   16 12=
 88  0  0  0
>   1  0      0 455436   3244  31708    0    0     0    20  256   27 10=
 90  0  0  0
>   1  0      0 455436   3244  31708    0    0     0     0  252   15 13=
 88  0  0  0
>   1  0      0 455436   3244  31708    0    0     0     0  252   14 11=
 89  0  0  0
>   1  0      0 455444   3244  31708    0    0     0     0  258   27  7=
 94  0  0  0
>   1  0      0 455444   3244  31708    0    0     0     0  252   14 12=
 88  0  0  0
>   1  0      0 455444   3244  31708    0    0     0     0  252   13  9=
 91  0  0  0
>   1  0      0 455184   3268  31796    0    0    14   108  288  112 13=
 88  0  0  0
>   1  0      0 455184   3268  31796    0    0     0     0  252   15 12=
 88  0  0  0
>   1  0      0 455184   3280  31796    0    0     0     6  254   23 10=
 91  0  0  0
>   1  0      0 455184   3280  31796    0    0     0     0  255   19 10=
 90  0  0  0
>   1  0      0 454768   3284  31892    0    0    50     0  260   34 10=
 90  0  0  0
>   1  0      0 454768   3296  31892    0    0     0     6  255   26 13=
 87  0  0  0
>   1  0      0 454768   3296  31892    0    0     0     0  252   14 10=
 90  0  0  0
>   1  0      0 454796   3308  31892    0    0     0     6  257   30 11=
 89  0  0  0
>   1  0      0 454796   3308  31892    0    0     0     0  258   25  8=
 92  0  0  0
> procs -----------memory---------- ---swap-- -----io---- -system-- ---=
---cpu-----
>   r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us=
 sy id wa st
>   2  0      0 454796   3308  31892    0    0     0     0  252   14  6=
 94  0  0  0
>   1  1      0 454788   3344  31900    0    0     0    52  272   73 11=
 89  0  0  0
>   1  0      0 454796   3344  31900    0    0     0    18  260   36  9=
 91  0  0  0
>   1  0      0 454796   3356  31900    0    0     0     6  254   20 10=
 90  0  0  0
>   1  0      0 454796   3356  31900    0    0     0     0  252   14  8=
 92  0  0  0
>   1  0      0 454796   3356  31900    0    0     0     0  252   13  9=
 91  0  0  0
>   1  0      0 454796   3368  31900    0    0     0     6  254   23  6=
 95  0  0  0
>   1  0      0 454796   3368  31900    0    0     0     0  253   19  9=
 91  0  0  0
>   2  0      0 454796   3380  31900    0    0     0     6  254   22 10=
 90  0  0  0
>   1  0      0 454796   3404  31900    0    0     0    64  278   87 12=
 88  0  0  0
>   1  0      0 454796   3404  31900    0    0     0     0  252   13  9=
 92  0  0  0
>   1  0      0 454796   3416  31900    0    0     0     6  254   23 11=
 89  0  0  0
>   1  0      0 454796   3416  31900    0    0     0     0  252   14 12=
 88  0  0  0
>   1  0      0 454796   3428  31900    0    0     0     6  254   21 10=
 90  0  0  0
>   1  0      0 454796   3428  31900    0    0     0     0  252   14 13=
 88  0  0  0
>   1  0      0 454796   3428  31900    0    0     0     0  252   14  9=
 91  0  0  0
>
> On Thu, Sep 3, 2015 at 12:11 PM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>> Hi Dushan,
>>
>> Could you say "sync" on another console? Does it help?
>>
>> Thanks,
>> Edward.
>>
>>
>> On 09/03/2015 11:57 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>> Kernel: linux 4.1.6 and 4.0.9
>>> R4 patch: 4.1.5 and 4.0.9
>>> Test: xfstests/genersic/285
>>> "SEEK_DATA/SEEK_HOLE sanity tests."
>>>
>>>
>>> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3D=
blob;f=3Dtests/generic/285;hb=3DHEAD
>>>
>>>
>>> With node40 and node41 and both ccreg40 and reg40 plugin on 4.0.9 a=
nd
>>> 3.18.6 test passes in 1s but on 4.1.6 with same .config it works fo=
r
>>> hours.
>>> Nothing in /var/log/messages
>>>
>>> vmstat 2
>>>
>>>    procs -----------memory---------- ---swap-- -----io---- -system-=
-
>>> ------cpu-----
>>>    r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs=
 us sy
>>> id wa st
>>>    2  0      0 460268   3200  28132    0    0     0     0  252   15=
 14 87
>>> 0  0  0
>>>    1  0      0 460268   3200  28132    0    0     0     0  252   12=
 13 87
>>> 0  0  0
>>>    1  0      0 460268   3200  28132    0    0     0     0  253   14=
 13 88
>>> 0  0  0
>>>    1  0      0 460268   3200  28132    0    0     0     0  252   14=
 12 88
>>> 0  0  0
>>>    1  0      0 460268   3200  28132    0    0     0     0  252   14=
 11 90
>>> 0  0  0
>>>
>>> ps -aux | grep sanity
>>> root      1323 99.7  0.6   5392  3124 pts/0    R+   13:43   1:31
>>> /root/xfstests/src/seek_sanity_test /mnt/test/seek_sanity_testfile
>>>
>>>
>>> Reproducible with command:
>>>    ./check 'generic/285'
>>>
>>> with this local.config file for xfstests:
>>>
>>> [r4ccHybrid]
>>> MODULAR=3D0
>>> TEST_DEV=3D/dev/hda5
>>> TEST_DIR=3D/mnt/test
>>> SCRATCH_DEV=3D/dev/hda7
>>> SCRATCH_MNT=3D/mnt/scratch
>>> RECREATE_TEST_DEV=3Dtrue
>>> RESULT_BASE=3D"`pwd`/results/`date +%d%m%y_%H%M%S`"
>>>
>>> FSTYP=3Dreiser4
>>>
>>> MKFS_OPTIONS=3D" "
>>> MOUNT_OPTIONS=3D"-o noatime"
>>>
>>> [r4Hybrid]
>>> MKFS_OPTIONS=3D"-o create=3Dreg40"
>>> MOUNT_OPTIONS=3D"-o noatime"
>>>
>>> [r41ccHybrid]
>>> MKFS_OPTIONS=3D"-o node=3Dnode41"
>>> MOUNT_OPTIONS=3D"-o noatime"
>>>
>>> [r41Hybrid]
>>> MKFS_OPTIONS=3D"-o create=3Dreg40 -o node=3Dnode41"
>>> MOUNT_OPTIONS=3D"-o noatime"
>>>
>>> If you need any other info I'll send it.
>>>
>>> Have a nice day
>>>
>>> Dushan
>>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
