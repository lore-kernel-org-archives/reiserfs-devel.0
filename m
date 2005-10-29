From: "Isaac Chanin" <chanin@WPI.EDU>
Subject: Re: Reiser4 SCSI Bug?
Date: Fri, 28 Oct 2005 20:27:29 -0400 (EDT)
Message-ID: <37550.130.215.239.65.1130545649.squirrel@webmail.WPI.EDU>
References: <2066.130.215.239.65.1130521750.squirrel@webmail.WPI.EDU>
Reply-To: chanin@WPI.EDU
Mime-Version: 1.0
Content-Type: multipart/mixed;boundary="----=_20051028202729_74823"
Return-path: <reiserfs-list-return-26699-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2066.130.215.239.65.1130521750.squirrel@webmail.WPI.EDU>
List-Id: <reiserfs-devel.vger.kernel.org>
Cc: reiserfs-list@namesys.com, steve86@WPI.EDU

------=_20051028202729_74823
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Steve Olivieri wrote:
> Greetings!
>
> I have a Maxtor Atlas II 15k, 147GB SCSI hard disk and an LSI Logic
> LSI21320 Ultra320 SCSI Host Bus Adapter for PCI-X (though it's running in
> a PCI slot).  I have partitioned it and installed a temporary Gentoo
> system with the reiserfs filesytem.  My boot partition uses ext2.  These
> partitions seem perfectly stable.  I have booted this temporary system
> multiple times and I have attempted to use it to install a permanent
> system with the reiser4 filesystem.
>
> After making the fileystems on each partition and mounting them, I was
> able to download two tarballs (the stage and portage snapshot).  While
> extracting the first, the terminal seems to hang.
>
> I switched to another terminal to see what was wrong.  Everything works
> great until I try to do anything at all on a reiser4 partition.  Then,
> this terminal also hangs.  Repeat until I'm out of terminals.
>
> I've been able to repeat this problem a number of times.  The only
> messages in my log file claimed that a flush failed (with code -12, if I
> remember correctly).  I do not have access to the logs at this time but I
> will try to get them soon.
>
> I am running a 2.6.13-ck8 kernel patched with the 2.6.13 reiser4 patchset.
>  Patitions were made using the 1.0.5 reiser4progs/libaal.  In the past, I
> have also replicated this problem using a 2.6.12-gentoo kernel with the
> 2.6.12 patchset and 1.0.5 reiser4progs/libaal.
>
> Is there something that I can do to fix this problem?  Is it a known bug?
>
> Also, I am not on the mailing list and I would appreciate it if I could be
> cc'd with any information about this problem.
>
> Thanks,
> Steve
>
>
>
>

Hey Steve,

The problem appears to be in the fs/reiser4/wander.c file.  In short,
nr_blocks passed to bio_alloc ends up being too big; in my testing 1024,
whereas the maximum the called functions will properly deal with is 256.

The attached patch adds a hacky fix for this problem, but perhaps someone
who knows the code better should go through and take a look why max_blocks
and nr in write_jnodes_to_disk_extent in wander.c do not always have a
shared minimum of no greater than 256.

Hope this helps,
Isaac

------=_20051028202729_74823
Content-Type: text/plain; name="/usr/src/thefix.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="/usr/src/thefix.patch"

--- /mnt/gentoo/usr/src/linux/fs/reiser4/wander.c	2005-10-28 19:27:02.301541280 -0400
+++ linux/fs/reiser4/wander.c	2005-10-28 19:29:37.000000000 -0400
@@ -1241,7 +1241,7 @@
 
 	while (nr > 0) {
 		struct bio *bio;
-		int nr_blocks = min(nr, max_blocks);
+		int nr_blocks = min(min(nr, max_blocks), 256);
 		int i;
 		int nr_used;
 
------=_20051028202729_74823--


