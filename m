From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: problems with reiser4 snapshot from 26. febr.
Date: Thu, 26 Feb 2004 14:07:51 +0300
Message-ID: <1077793671.3150.87.camel@tribesman.namesys.com>
References: <200402260118.09054.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-V7heeSSYmHzoPshNmFaB"
Return-path: <reiserfs-list-return-16943-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402260118.09054.henning-04@die.informatik.uni-siegen.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Cc: reiserfs-list@namesys.com

--=-V7heeSSYmHzoPshNmFaB
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Thu, 2004-02-26 at 04:18, Henning Westerholt wrote:
> Hello,
> 
> i tried the latest snapshot one more time with some debug options activated. 
> Now the compiling of eg. xfree produces no errors on the filesystem. But 
> after the compiling, i unmounted the fs, and got a error message in the 
> syslog:
> 
> kernel: reiser4[umount(8437)]: reiser4_kill_super (fs/reiser4/vfs_ops.c:1377)
> [nikita-2622]:
> kernel: WARNING: 1607680 bytes still allocated
> 
One memory leak was fixed recently. It is attached. Hopefully you have
hit this one.

> 
> The following fsck run found no errors. I mounted the partition again, and 
> tried a "ls" on this filesystem. After that the reiser4 code produced so many 
> kernel oops that i was unable to shutdown the system, as any started program 
> segfaulted. 
> 
> Unfortunally reiserfs filled my logfiles (and some other files..) with 
> garbage, data-logging in the stock kernel for reiserfs would be very nice 
> btw. ;-)
> 
> I reproduced this error after a reset a few minutes later, but again reiserfs 
> filled the output from dmegs with content from my config files. So i only 
> attached my kernel config. 
> I think for now i use the snapshot without debugging, as it don't crash my 
> whole system.
> 
> Henning

--=-V7heeSSYmHzoPshNmFaB
Content-Disposition: attachment; filename=flush.c.diff
Content-Type: text/plain; name=flush.c.diff; charset=CP1251
Content-Transfer-Encoding: 7bit

===== flush.c 1.671 vs 1.672 =====
--- 1.671/flush.c	Fri Feb 20 16:46:30 2004
+++ 1.672/flush.c	Thu Feb 26 13:59:15 2004
@@ -1477,8 +1477,10 @@
 		/* stop_key is used to find what was copied and what to cut */
 		stop_key = *min_key();
 		ret = squalloc_extent(left, &coord, pos, &stop_key);
-		if (ret != SQUEEZE_CONTINUE)
+		if (ret != SQUEEZE_CONTINUE) {
+			ON_DEBUG(reiser4_kfree(vp));
 			break;
+		}
 		assert("vs-1465", !keyeq(&stop_key, min_key()));
 			
 		/* Helper function to do the cutting. */

--=-V7heeSSYmHzoPshNmFaB--

