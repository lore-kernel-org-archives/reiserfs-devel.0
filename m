From: Domenico Andreoli <cavok@libero.it>
Subject: Re: Snapshot against 2.6.1 released.
Date: Mon, 19 Jan 2004 20:06:37 +0100
Message-ID: <400C2ABD.20106@libero.it>
References: <16395.60465.989777.981597@laputa.namesys.com> <16396.1113.203997.785571@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16574-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16396.1113.203997.785571@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Nikita Danilov wrote:
> Nikita Danilov writes:
>  > Hello,
>  > 
>  > new snapshot against 2.6.1 kernel is at
>  > 
>  > http://namesys.com/snapshots/2004.01.19/
>  > 
>  > look into READ.ME file for details.
> 
> Please also apply last-minute-fix.diff from there: it fixes some bug
> that slipped into snapshot.
> 
> last-minute-fix.diff should be applied from fs/reiser4:
> 
> $ cd /somewhere/fs/reiser4
> $ patch -p1 < /somewhereelse/last-minute-fix.diff
> 
> 

ehm.. my existing reiser4 partition is not mountable now that i recompiled 
2.6.1 using latest snapshot. it did not contain anything so i formatted 
it, but nothing new happened.

# mkfs.reiser4 /dev/hdc6
mkfs.reiser4 0.4.20
Copyright (C) 2001, 2002, 2003 by Hans Reiser, licensing governed by 
reiser4progs/COPYING.

Block size 4096 will be used. 

Linux 2.6.1-reiser4 is detected. 

Uuid 81a2b014-f272-4f6e-adad-e323c0cb10eb will be used. 

Reiser4 is going to be created on /dev/hdc6. 

(Yes/No): yes
Creating reiser4 on /dev/hdc6...done
# mount /dev/hdc6 /mnt/extra2
mount: you must specify the filesystem type
# mount /dev/hdc6 /mnt/extra2 -t reiser4
mount: wrong fs type, bad option, bad superblock on /dev/hdc6,
        or too many mounted file systems
#


-----[ Domenico Andreoli, aka cavok
  --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
    ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
