From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Fri, 27 Jun 2003 13:28:21 +0400
Message-ID: <20030627092821.GA29715@namesys.com>
References: <20030624131904.GA460@namesys.com> <3EF86928.7080504@g-house.de> <20030624151940.GC21845@namesys.com> <3EF888B2.4000900@g-house.de> <3EF8EFF0.6020207@g-house.de> <20030625054031.GA11576@namesys.com> <3EF9A0F6.4030401@g-house.de> <3EF9E939.1050501@g-house.de> <20030626092608.GA12252@namesys.com> <3EFAE933.6040206@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14725-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EFAE933.6040206@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Thu, Jun 26, 2003 at 02:38:11PM +0200, Christian Kujau wrote:

> >BTW, can you send me the original file and its corrupted counterpart?
> i've copied several files to a loopmounted reiserfs and selected a text 
> file (some random text) and a binary file 
> (/lib/iptables/libip6t_icmpv6.so), for which i have the original and the 
> corrupted copy on https://ephigenie.kicks-ass.net/browse/reiserfs/diffs

Well, there is really a pattern.
Each 4k of data you copy us placed in its own 8k page (the rest 4k are freed).
But I really cannot see how that may happen! It simply cannot, I'd say.
Would you mind to try 2.5.72 with the following patch, and copy some file under
128k in size to some reiserfs filesystem and see if any warnings were
produced. (if they are, show me what were those warnings).
Also check that files are still corrupted.

Thank you.

Bye,
    Oleg
===== fs/reiserfs/file.c 1.20 vs edited =====
--- 1.20/fs/reiserfs/file.c	Wed Jun  4 11:50:34 2003
+++ edited/fs/reiserfs/file.c	Fri Jun 27 13:05:12 2003
@@ -578,10 +578,15 @@
     long page_fault=0; // status of copy_from_user.
     int i; // loop counter.
     int offset; // offset in page
+    int write_bytes_saved = write_bytes;
 
     for ( i = 0, offset = (pos & (PAGE_CACHE_SIZE-1)); i < num_pages ; i++,offset=0) {
 	int count = min_t(int,PAGE_CACHE_SIZE-offset,write_bytes); // How much of bytes to write to this page
 	struct page *page=prepared_pages[i]; // Current page we process.
+
+	if ( write_bytes <= 0 ) {
+		printk("Allocated %d pages that are not needed (of %d), pagesize is %ld, to_write %d!\n", num_pages - i, num_pages, PAGE_CACHE_SIZE, write_bytes_saved );
+	}
 
 	fault_in_pages_readable( buf, count);
 
