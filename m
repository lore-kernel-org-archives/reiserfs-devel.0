From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Fw: Re: PROBLEM: ReiserFS: cannot remove file as root with
 2.6.0test9-mm3
Date: Tue, 18 Nov 2003 12:50:54 +0300
Message-ID: <16313.60286.911046.256297@laputa.namesys.com>
References: <20031117125223.46d784be.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16111-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031117125223.46d784be.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingmar Sittl <pizzaboy@web.de>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>, Andrew Morton <akpm@osdl.org>

Andrew Morton writes:
 > 
 > 
 > Begin forwarded message:
 > 
 > Date: Mon, 17 Nov 2003 21:11:17 +0000
 > From: Ingmar Sittl <pizzaboy@web.de>
 > To: Andrew Morton <akpm@osdl.org>
 > Subject: Re: PROBLEM: ReiserFS: cannot remove file as root with 2.6.0test9-mm3
 > 

Hello,

Ingmar, to start we need the following info:

1. any kernel messages (dmesg or /var/log/messages) that appear when you
try and fail to remove file as root.

2. output of

# lsattr /offending-file

Also, can you elaborate what does it mean that you cannot remove file
in 2.6.0-test9-mm3, but can in 2.6.0-test9? You tried to remove it in
-mm3, failed, rebooted into -test9 and it removes successfully there, or
what?

 > 
 > oops, forgot the attachement
 > 
 > 2.6.0test9
 > 
 > reiserfsck --check started at Mon Nov 17 20:50:52 2003
 > ###########
 > Filesystem seems mounted read-only. Skipping journal replay.
 > Checking internal tree..finished
 > Comparing bitmaps..finished
 > Checking Semantic tree:
 > finished
 > No corruptions found
 > There are on the filesystem:
 >         Leaves 53652
 >         Internal nodes 367
 >         Directories 14221
 >         Other files 216874
 >         Data block pointers 1906983 (96 of them are zero)
 >         Safe links 0
 > ###########
 > reiserfsck finished at Mon Nov 17 20:54:36 2003
 > 
 > 2.6.0test9-mm3
 > 
 > reiserfsck --check started at Mon Nov 17 20:57:52 2003
 > ###########
 > Filesystem seems mounted read-only. Skipping journal replay.
 > Checking internal tree..finished
 > Comparing bitmaps..finished
 > Checking Semantic tree:
 > finished
 > No corruptions found
 > There are on the filesystem:
 >         Leaves 53652
 >         Internal nodes 367
 >         Directories 14221
 >         Other files 216874
 >         Data block pointers 1906983 (96 of them are zero)
 >         Safe links 0
 > ###########
 > reiserfsck finished at Mon Nov 17 20:59:15 2003
 > ###########
 > 

By the way, upgrade your reiserfsprogs. Latest ones are at
ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.11.tar.gz

[...]

 > prepare_retry: 	         186
 > 
 > /proc/fs/reiserfs/hda6/oidmap
 > used: [ 1 .. d52ff )
 > free: [ d52ff .. d5300 )

[...]

 > used: [ 100cb7 .. 100cd8 )
 > free: [ 100cd8 .. 100cdb )
 > used: [ 100cdb .. 100f70 )
 > free: [ 100f70 .. ffffffff )
 > total: 	918 [918/972] used: 1046665 [exact]

What sort of work load are you exercising on this file system that
fragments oid map so horribly?

 > 
 > /proc/fs/reiserfs/hda6/on-disk-super

[...]

Nikita.
