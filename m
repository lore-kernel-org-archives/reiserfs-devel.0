From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs-3.6.12 release
Date: Thu, 12 Feb 2004 14:31:26 +0300
Message-ID: <200402121431.26019.vitaly@namesys.com>
References: <200402102010.04479.vitaly@namesys.com> <200402120134.20591.vitaly@namesys.com> <20040211230435.GB8237@lostlogicx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040211230435.GB8237@lostlogicx.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brandon Low <lostlogic@gentoo.org>, Henning Westerholt <henning@skalatan.de>
Cc: reiserfs-list@namesys.com

> bash-2.05b# /sbin/reiserfsck -a /dev/hda3
>
> Failed to open the filesystem.
>
> If the partition talbe has not been changed, and the partition is
> valid  and  it really  contains  a reiserfs  partition,  then the
> superblock  is corrupted and you need to run this utility with
> --rebuild-sb.
>
> Aborted
>
> bash-2.05b# /sbin/reiserfsck -a /dev/root
> Reiserfs superblock in block 16 on 0x303 of format 3.6 with standard
> journal Blocks (total/free): 4390223/6461997 by 4096 bytes
> Filesystem is cleanly mounted
> Paritition /dev/root is mounted with write permissions, cannot check it

hm, interesting, would you run 
	stat /dev/hda3 (Henning, put here your root partition please)
	stat /dev/root
	stat /
at bootup and when booted.

--
Thanks,
Vitaly Fertman

