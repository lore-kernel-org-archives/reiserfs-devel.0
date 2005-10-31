From: Isaac Chanin <chanin@WPI.EDU>
Subject: Re: Reiser4 SCSI Bug?
Date: Sun, 30 Oct 2005 22:48:49 -0500
Message-ID: <43659421.1050608@wpi.edu>
References: <2066.130.215.239.65.1130521750.squirrel@webmail.WPI.EDU>    <37550.130.215.239.65.1130545649.squirrel@webmail.WPI.EDU>    <43639DFA.1020107@namesys.com> <43640228.7080807@wpi.edu>    <4364033C.5010200@namesys.com> <436406DF.8070104@wpi.edu>    <43643C7E.4080703@namesys.com> <43641554.8040500@wpi.edu>    <43646B4A.7060301@namesys.com> <1993.130.215.169.201.1130725109.squirrel@webmail.WPI.EDU>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060802000709080700060509"
Return-path: <reiserfs-list-return-26739-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1993.130.215.169.201.1130725109.squirrel@webmail.WPI.EDU>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Steve Olivieri <steve86@WPI.EDU>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

--------------060802000709080700060509
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Steve Olivieri wrote:
> Hey guys,
> 
> I had a system running on reiser4 with Isaac's patch yesterday and all we
> going well.  Of course, then I deleted /var/db and portage went crazy and
> I decided to build the system again.
> 
> I attempted to do so today, using the same kernel as yesterday, but now
> I'm getting the same error as before.  To be a bit more specific,
> 
> reiser4[pdflush(218)]: writeout (fs/reiser4/vfs_ops.c:197)[nikita-31001):
> code: -12 at fs/reiser4/wander.c:1250
> WARNING: Flush failed: -12
> 
> I used to get a number of these errors (in fact, they continued until I
> would reboot with SysRq keys) but now I only seem to get one before
> everything hangs and I'm forced to reboot.
> 
> Hope to see a good fix soon,
> 
>  Steve
> 
> 


Hey Steve,

Not sure why that error would crop up again.  In any case, the attached 
patch uses the macro, moves the min check out of the loop, and fixes all 
of the occurances - so, it may be worth giving a try.

Isaac

--------------060802000709080700060509
Content-Type: text/plain;
 name="biofix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="biofix.patch"

--- linux-2.6.13-ck5/fs/reiser4/wander.c.old	2005-10-30 22:38:00.771463160 -0500
+++ linux-2.6.13-ck5/fs/reiser4/wander.c	2005-10-30 22:37:47.952411952 -0500
@@ -763,9 +763,10 @@
 		 nr, (unsigned long long)block);
 
 	max_blocks =
-	    bdev_get_queue(super->s_bdev)->max_sectors >> (super->
-							   s_blocksize_bits -
-							   9);
+	    min(BIO_MAX_PAGES,
+		bdev_get_queue(super->s_bdev)->max_sectors >> (super->
+							      s_blocksize_bits -
+							      9));
 
 	while (nr > 0) {
 		struct bio *bio;
@@ -1235,9 +1236,10 @@
 
 	block = *block_p;
 	max_blocks =
-	    bdev_get_queue(super->s_bdev)->max_sectors >> (super->
-							   s_blocksize_bits -
-							   9);
+	    min(BIO_MAX_PAGES,
+		bdev_get_queue(super->s_bdev)->max_sectors >> (super->
+							      s_blocksize_bits -
+							      9));
 
 	while (nr > 0) {
 		struct bio *bio;

--------------060802000709080700060509--
