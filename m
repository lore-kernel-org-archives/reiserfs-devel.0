From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: mkfs.reiser4 & fsck.reiser4 do not agree on minimal fs size?
Date: Mon, 10 Jan 2005 16:15:27 +0300
Message-ID: <200501101615.27347.vitaly@namesys.com>
References: <200501092331.52576.rathamahata@ehouse.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23106-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200501092331.52576.rathamahata@ehouse.ru>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Sergey S. Kostyliov" <rathamahata@ehouse.ru>, reiserfs-list@namesys.com

On Sunday 09 January 2005 23:31, Sergey S. Kostyliov wrote:
> Hello all,
>
> mkfs.reiser4 says that minimal fs size is 25 block.
>
>     rathamahata@arise rathamahata $ dd if=/dev/zero of=image bs=4096
> count=1 1+0 records in
>     1+0 records out
>     rathamahata@arise rathamahata $ /sbin/mkfs.reiser4 -y -f image
>     Error: Requested filesystem size (1) is too small. Reiser4 required
> minimal size 25 blocks long.
>     Error: Can't create filesystem on image.
>     rathamahata@arise rathamahata $
>
> But that seems to be not true.
>
>     rathamahata@arise rathamahata $ uname -a
>     Linux arise.vh.com.ru 2.6.10 #5 Sat Jan 8 21:06:34 MSK 2005 i686 AMD
> Athlon(TM) XP 2500+ AuthenticAMD GNU/Linux rathamahata@arise rathamahata $
> /sbin/mkfs.reiser4 -V
>     /sbin/mkfs.reiser4 1.0.3
>     Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed
> by reiser4progs/COPYING.
>
>     rathamahata@arise rathamahata $ dd if=/dev/zero of=image bs=4096
> count=25 25+0 records in
>     25+0 records out
>     rathamahata@arise rathamahata $ /sbin/mkfs.reiser4 -y -f image
>     rathamahata@arise rathamahata $ echo $?
>     0
>     rathamahata@arise rathamahata $ /sbin/fsck.reiser4 -y image
>     *******************************************************************
>     This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
>     *******************************************************************
>
>     Fscking the image block device.
>     Will check the consistency of the Reiser4 SuperBlock.
>     Will check the consistency of the Reiser4 FileSystem.
>     ***** fsck.reiser4 started at Sun Jan  9 23:19:41 2005
>     Fatal: Failed to open the reiser4 backup.
>     Fatal: Cannot open the FileSystem on (image).
>
>     1 fatal corruptions were detected in SuperBlock. Run with --build-sb
> option to fix them.
>
>     rathamahata@arise rathamahata $
>
> It looks like either actual minimal size is large or there is bug in
> reiser4progs...

yes, it was a bug in reiser4progs, thank you for the report.



-- 
Thanks,
Vitaly Fertman


