From: Ingmar Sittl <pizzaboy@web.de>
Subject: Re: Fw: Re: PROBLEM: ReiserFS: cannot remove file as root with 2.6.0test9-mm3
Date: Tue, 18 Nov 2003 14:03:52 +0000
Message-ID: <200311181403.52350.pizzaboy@web.de>
References: <20031117125223.46d784be.akpm@osdl.org> <16313.60286.911046.256297@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16115-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16313.60286.911046.256297@laputa.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>, Andrew Morton <akpm@osdl.org>

> Hello,
>
> Ingmar, to start we need the following info:
>
> 1. any kernel messages (dmesg or /var/log/messages) that appear when you
> try and fail to remove file as root.

Sorry, there are no kernel messages, rm just does not let me remove this file.
root:/usr/lib/pkgconfig# rm fontconfig.pc
rm: cannot unlink `fontconfig.pc': Permission denied

> 2. output of
>
> # lsattr /offending-file

root:/usr/lib/pkgconfig# lsattr fontconfig.pc
s-Si-dAc------ fontconfig.pc

> Also, can you elaborate what does it mean that you cannot remove file
> in 2.6.0-test9-mm3, but can in 2.6.0-test9? You tried to remove it in
> -mm3, failed, rebooted into -test9 and it removes successfully there, or
> what?

Almost exactly:
I tried to remove that file in 2.6.0-test9-mm3, failed, rebooted into 
2.6.0-test9, the file was removed successfully, I reinstalled it, recompiled 
2.6.0-test9-mm3 with CONFIG_REISERFS_CHECK,rebooted into 2.6.0-test9-mm3, rm 
failed again. I also tried this cycle with a 2.4.21 kernel, same result!

>  > oops, forgot the attachement
>  >
>  > 2.6.0test9
>  >
>  > reiserfsck --check started at Mon Nov 17 20:50:52 2003
>  > ###########
>  > Filesystem seems mounted read-only. Skipping journal replay.
>  > Checking internal tree..finished
>  > Comparing bitmaps..finished
>  > Checking Semantic tree:
>  > finished
>  > No corruptions found
>  > There are on the filesystem:
>  >         Leaves 53652
>  >         Internal nodes 367
>  >         Directories 14221
>  >         Other files 216874
>  >         Data block pointers 1906983 (96 of them are zero)
>  >         Safe links 0
>  > ###########
>  > reiserfsck finished at Mon Nov 17 20:54:36 2003
>  >
>  > 2.6.0test9-mm3
>  >
>  > reiserfsck --check started at Mon Nov 17 20:57:52 2003
>  > ###########
>  > Filesystem seems mounted read-only. Skipping journal replay.
>  > Checking internal tree..finished
>  > Comparing bitmaps..finished
>  > Checking Semantic tree:
>  > finished
>  > No corruptions found
>  > There are on the filesystem:
>  >         Leaves 53652
>  >         Internal nodes 367
>  >         Directories 14221
>  >         Other files 216874
>  >         Data block pointers 1906983 (96 of them are zero)
>  >         Safe links 0
>  > ###########
>  > reiserfsck finished at Mon Nov 17 20:59:15 2003
>  > ###########
>
> By the way, upgrade your reiserfsprogs. Latest ones are at
> ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.11.tar.gz

Done. Still no problems found

> [...]
>
>  > prepare_retry: 	         186
>  >
>  > /proc/fs/reiserfs/hda6/oidmap
>  > used: [ 1 .. d52ff )
>  > free: [ d52ff .. d5300 )
>
> [...]
>
>  > used: [ 100cb7 .. 100cd8 )
>  > free: [ 100cd8 .. 100cdb )
>  > used: [ 100cdb .. 100f70 )
>  > free: [ 100f70 .. ffffffff )
>  > total: 	918 [918/972] used: 1046665 [exact]
>
> What sort of work load are you exercising on this file system that
> fragments oid map so horribly?

This is the /usr partition on a LFS system, and I often try out current 
versions of software, installing into /usr/local. 
Used to be the compile partition, too. Now that is done on another HD

>  > /proc/fs/reiserfs/hda6/on-disk-super
>
> [...]
>
> Nikita.

Ingmar

