From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Segmentation fault in reiserfsck --rebuild-tree
Date: Sat, 1 Nov 2003 15:28:01 +0300
Message-ID: <200311011528.01879.vitaly@namesys.com>
References: <20031101105809.M73812@dworkin.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15955-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031101105809.M73812@dworkin.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Roberts <matt@dworkin.org>
Cc: reiserfs-list@namesys.com

Hi, 

> I compiled (on another system) the latest version of the utility programs and 
> tried those, but the same result occurs.

you had connected the drive to that another system before trying 
reiserfsck? Or copied the complied reiserfsck to the computer with
the problem harddrive? If the later, did you comple reiserfsprogs 
statically?

> reiserfsck --rebuild-tree /dev/hda1
>
> Will rebuild the filesystem (/dev/hda1) tree
>
> Replaying journal..
> 0 transactions replayed
>
> #####
> reiserfsck --rebuild-tree started at Nov  1 10:45:16
> #####
>
> Pass 0:
> Loading on-disk bitmap.. ok, 3596247 blocks marked used
> Skipping 8355 (super block, journal, bitmaps) 3587892 blocks will be read
> 0%Segmentation fault                             left 3518484, 13881 /sec

would you pack the metadata of the problem partition with:
    debugreiserfs -p /dev/hda1 | bzip2 -c > hda1.bz2
and make it available for downloading, I will debug the problem
locally then.

-- 
Thanks,
Vitaly Fertman
