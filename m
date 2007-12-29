From: butdiene <butdiene@yahoo.com>
Subject: Re: reiser4 firefox hangs due to fsync, sysrq-t dump
Date: Fri, 28 Dec 2007 16:24:10 -0800 (PST)
Message-ID: <14533387.post@talk.nabble.com>
References: <14514445.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <14514445.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


I'm not sure about what I'm doing. with a patch for optimal_io_size=4096*1024
and atom_max_size=0x800, it improves a lot.

/dev/root / reiser4
rw,atom_max_size=0x800,atom_max_age=0x927c0,atom_min_size=0x100,atom_max_flushers=0x1,cbk_cache_slots=0x10
0 0


--- linux.0/fs/reiser4/reiser4.h	2007-12-28 16:30:59.000000000 -0600
+++ linux.1/fs/reiser4/reiser4.h	2007-12-28 16:31:40.000000000 -0600
@@ -197,7 +197,7 @@
 
    Can be overwritten by optimal_io_size mount option.
 */
-#define REISER4_OPTIMAL_IO_SIZE (64 * 1024)
+#define REISER4_OPTIMAL_IO_SIZE (4096 * 1024)
 
 /* see comments in inode.c:oid_to_uino() */
 #define REISER4_UINO_SHIFT (1 << 30)




butdiene wrote:
> 
> Hi,
> 
> the file contains several sysrq-t dumps when firefox hangs,
> 
>  http://www.nabble.com/file/p14514445/reiser4-sysrq-t.txt.bz2
> reiser4-sysrq-t.txt.bz2 
> 
> thanks!
> 

-- 
View this message in context: http://www.nabble.com/reiser4-firefox-hangs-due-to-fsync%2C-sysrq-t-dump-tp14514445p14533387.html
Sent from the ReiserFS - General mailing list archive at Nabble.com.

