From: Yury Umanets <umka@namesys.com>
Subject: Re: Core dump in reiserfsck
Date: Wed, 15 Jan 2003 13:16:14 +0300
Message-ID: <3E2534EE.4020308@namesys.com>
References: <3E24DEBA.39AC1901@nssmb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12355-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E24DEBA.39AC1901@nssmb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Porotikov <vitaly.porotikov@nssmb.com>
Cc: reiserfs-list@namesys.com

Vitaly Porotikov wrote:

>Folks,
>
>  Perhaps 3.x1c have not this bug, but I can't do any changes in my
>system. I send it in hope to find some coding errors out (if this wasn't
>before).
>
>[root@tkprzbkup5 /root]# mount
>/dev/rza1 on / type ext2 (rw)
>none on /proc type proc (rw)
>none on /dev/pts type devpts (rw,gid=5,mode=620)
>/dev/rze1 on /export type reiserfs (ro)
>[root@tkprzbkup5 /root]# reiserfsck --check /dev/rze1
>
><-------------reiserfsck, 2002------------->
>reiserfsprogs 3.x.1b
>
>Will read-only check consistency of the filesystem on /dev/rze1
>Will put log info to 'stdout'
>
>Do you want to run this program?[N/Yes] (note need to type Yes):Yes
>###########
>reiserfsck --check started at Wed Jan 15 10:41:40 2003
>###########
>Filesystem seems mounted read-only. Skipping journal replay..
>Checking S+tree../ 72 (of  98)/101 (of 153)/124 (of
>156)bad_indirect_item: block 1907661: item 7659550 76756x1 IND (1), len
>8, location 3056 entry count 0, fsck need 0, format new has a pointer 0
>to the block 1 whichin tree already
>bad_indirect_item: block 1907661: item 7659550 7675670 0x1 IND (1), len
>8, location 3056 entry count 0, fsckd 0, format new has a pointer 1 to
>the block 500 which is in tree already
>bit 2535358884, bitsize 314620004
>reiserfsck: bitmap.c:160: reiserfs_bitmap_test_bit: Assertion
>`bit_number < bm->bm_bit_size' failed.
>Aborted (core dumped)
>
>
>--
>Best regards,
>  Vitaly
>
>
>
>
>
>  
>
Use more recent version please.
ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.4.tar.gz

-- 
Yury Umanets


