From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: bug report
Date: Sun, 23 Nov 2003 15:19:11 +0300
Message-ID: <200311231519.11431.vitaly@namesys.com>
References: <NHBBLMBAALMFLLANBMBIKECOCAAA.Stephan.Reichel@1net4you.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16148-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <NHBBLMBAALMFLLANBMBIKECOCAAA.Stephan.Reichel@1net4you.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephan Reichel <Stephan.Reichel@1net4you.de>
Cc: reiserfs-list@namesys.com


Hello, 

On Sunday 23 November 2003 05:09, Stephan Reichel wrote:
> proxy:/home/reichel# reiserfsck --check -l /home/reichel/rfsck.log
> /dev/hdb6
>
> <-------------reiserfsck, 2002------------->
> reiserfsprogs 3.x.1b
>
> Will read-only check consistency of the filesystem on /dev/hdb6
> Will put log info to '/home/reichel/rfsck.log'
>
> Do you want to run this program?[N/Yes] (note need to type Yes):Yes
> ###########
> reiserfsck --check started at Sat Nov 22 21:38:48 2003
> ###########
> Filesystem seems mounted read-only. Skipping journal replay..
> Checking S+tree../  3 (of   3)/115 (of 122)/ 32 (of 170)bit 1067128968,
> bitsize 8154586
> reiserfsck: bitmap.c:160: reiserfs_bitmap_test_bit: Assertion `bit_number <
> bm->bm_bit_size' failed.
> Aborted
> proxy:/home/reichel#
>
>
> (I run reiserfsck because I got some errors "file '...' exists but can not
> stat-ed")

You are using a quite old riserfsprogs version, please update it to the 
latest one from our ftp site -- 
ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.11.tar.gz

-- 
Thanks,
Vitaly Fertman


