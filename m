From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH/URL] reiserfs: reformat code with Lindent
Date: Tue, 12 Jul 2005 15:42:20 -0400
Message-ID: <20050712194220.GA28973@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25105-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

 The ReiserFS code is a mix of a number of different coding styles, sometimes
 different even from line-to-line. Since the code has been relatively stable
 for quite some time and there are few outstanding patches to be applied, it
 is time to reformat the code to conform to the Linux style standard outlined
 in Documentation/CodingStyle.

 This patch contains the result of running scripts/Lindent against
 fs/reiserfs/*.c and include/linux/reiserfs_*.h. There are places where the
 code can be made to look better, but I'd rather keep those patches separate
 so that there isn't a subtle by-hand hand accident in the middle of a huge
 patch. To be clear: This patch is reformatting *only*.

 A number of patches may follow that continue to make the code more consistent
 with the Linux coding style.

 Hans wasn't particularly enthusiastic about these patches, but said he
 wouldn't really oppose them either.

 Due to the size of this patch (1.5M), I've posted it at:
 ftp://ftp.suse.com/pub/people/jeffm/reiserfs/kernel-v2.6/cleanups/2.6.13-rc2/01-reiserfs-lindent.diff

 -Jeff

-- 
Jeff Mahoney
SuSE Labs
