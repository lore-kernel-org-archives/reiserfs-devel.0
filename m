From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs b0rken on 2.4.22-pre4-ben0 on powerpc ?
Date: 12 Jul 2003 15:34:08 -0400
Message-ID: <1058038447.13317.102.camel@tiny.suse.com>
References: <1058010165.17888.8.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-jmi0gLVyHCTfo9MNeE3j"
Return-path: <reiserfs-list-return-14916-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1058010165.17888.8.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Soeren Sonnenburg <reiserfs@nn7.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

--=-jmi0gLVyHCTfo9MNeE3j
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2003-07-12 at 07:42, Soeren Sonnenburg wrote:
> Hi.
> 
> I tried to mount a reiserfs partition (which is connected via firewire
> or usb mass storage) and while it mounts ok with 2.4.21-ben2 it hangs
> while mounting on 2.4.22-pre4-ben0.
> 
> I guess something is broken there... I can get into the kernel debugger
> xmon and supply you with a backtrace shot taken with some digital
> camera... if that helps.

Please try this (which is in -pre5 and not related to reiserfs)



--=-jmi0gLVyHCTfo9MNeE3j
Content-Disposition: attachment; filename=io-stalls-11-inc.diff
Content-Type: text/plain; name=io-stalls-11-inc.diff; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

===== drivers/block/ll_rw_blk.c 1.46 vs edited =====
--- 1.46/drivers/block/ll_rw_blk.c	Fri Jul  4 13:35:08 2003
+++ edited/drivers/block/ll_rw_blk.c	Fri Jul 11 08:30:54 2003
@@ -618,7 +618,7 @@
 	do {
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		spin_lock_irq(&io_request_lock);
-		if (blk_oversized_queue(q)) {
+		if (blk_oversized_queue(q) || q->rq.count == 0) {
 			__generic_unplug_device(q);
 			spin_unlock_irq(&io_request_lock);
 			schedule();

--=-jmi0gLVyHCTfo9MNeE3j--

