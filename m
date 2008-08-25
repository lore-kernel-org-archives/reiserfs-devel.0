From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: vs-13070: reiserfs_read_locked_inode during backup (rsync) &
 much load on VFS
Date: Tue, 26 Aug 2008 00:47:17 +0400
Message-ID: <48B31A55.8020304@gmail.com>
References: <loom.20080825T132117-502@post.gmane.org> <e85b9d30808250658v6ceb518ajf4f86f29ee0d40aa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <e85b9d30808250658v6ceb518ajf4f86f29ee0d40aa@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthew <jackdachef@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Matthew wrote:
> ok, well it turned out to be an USB problem (again !)
>   
bad cable?

> (forgot to mention that one partition is on the box the other one external USB),
>
> here's the output after having "unmounted" the partition:
> [12671.058096] __ratelimit: 30140 callbacks suppressed
> [12671.058106] Buffer I/O error on device dm-2, logical block 3562
> [12671.058106] lost page write due to I/O error on dm-2
> [12671.058106] Buffer I/O error on device dm-2, logical block 3563
> [12671.058106] lost page write due to I/O error on dm-2
>
> and here the output of fsck.reiserfs /dev/mapper/usb
>
> fsck.reiserfs /dev/mapper/usb
> reiserfsck 3.6.20
> Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
> reiserfsprogs/COPYING.
> *************************************************************
> ** If you are using the latest reiserfsprogs and  it fails **
> ** please  email bug reports to reiserfs-list@namesys.com, **
> ** providing  as  much  information  as  possible --  your **
> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> ** messages  (including version),  the reiserfsck logfile, **
> ** check  the  syslog file  for  any  related information. **
> ** If you would like advice on using this program, support **
> ** is available  for $25 at  www.namesys.com/support.html. **
> *************************************************************
>
> Will read-only check consistency of the filesystem on /dev/mapper/usb
> Will put log info to 'stdout'
>
> Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
> ###########
> reiserfsck --check started at Mon Aug 25 15:43:55 2008
> ###########
> Replaying journal..
> Trans replayed: mountid 31, transid 2783, desc 710, len 1, commit 712,
> next trans offset 695
> Trans replayed: mountid 31, transid 2784, desc 713, len 352, commit
> 1066, next trans offset 1049
> Trans replayed: mountid 31, transid 2785, desc 1067, len 308, commit
> 1376, next trans offset 1359
> Trans replayed: mountid 31, transid 2786, desc 1377, len 669, commit
> 2047, next trans offset 2030
> Trans replayed: mountid 31, transid 2787, desc 2048, len 146, commit
> 2195, next trans offset 2178
> Trans replayed: mountid 31, transid 2788, desc 2196, len 438, commit
> 2635, next trans offset 2618
> Trans replayed: mountid 31, transid 2789, desc 2636, len 571, commit
> 3208, next trans offset 3191
> Trans replayed: mountid 31, transid 2790, desc 3209, len 137, commit
> 3347, next trans offset 3330
> Reiserfs journal '/dev/mapper/usb' in blocks [18..8211]: 8 transactions replayed
> Checking Internal tree...
> 0%....20%....40%....60%....80%....100%
> Checking Semantic tree...
> There are on the filesystem:
>         Leaves 110029
>         Internal nodes 720
>         Directories 29714
>         Other files 333471
>         Data block pointers 54669713 (0 of them are zero)
>         Safe links 0
> No corruptions found
> ###########
> reiserfsck finished at Mon Aug 25 15:52:40 2008
>
> good job ! no data-loss
>
> sorry for the false alarm
>
> Regards,
>
> Mat
>
>   

