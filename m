From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Fwd: Error in fs/reiser4/page_cache.c : PG_active not declared
Date: Mon, 26 Jul 2004 15:56:05 +0400
Message-ID: <4104F155.9080504@namesys.com>
References: <158e298904072418267b1c40d7@mail.gmail.com> <158e29890407242016c70b3f2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010208060608010509010708"
Return-path: <reiserfs-list-return-19815-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <158e29890407242016c70b3f2@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Ashay Humane <ashay.humane@gmail.com>
Cc: Reiserfs-List@namesys.com

--------------010208060608010509010708
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello

Ashay Humane wrote:
> Hi,
> I got the vanilla 2.6.7 kernel .. patched it to 2.6.8-rc2 then patched
> it to 2.6.8-rc2-love2.
> 
> After the love patch, I get an error when compiling the kernel:
> 
> Undeclared variable PG_active in fs/reiser4/page_cache.c  Line 891
> 
> There are variables named PG_active_mapped and PG_active_unmapped in other .c
> and .h files. But no PG_active .
> 
> Dosent look too bad .. but what should be done ?
> 

Please try attached patch

> Thanks
> Ashay
> 
> --
> <HAND>
> 
> 
> 


--------------010208060608010509010708
Content-Type: text/plain;
 name="no-PG_active-bit.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="no-PG_active-bit.diff"

===== page_cache.c 1.304 vs edited =====
--- 1.304/page_cache.c	2004-06-25 12:36:13 +04:00
+++ edited/page_cache.c	2004-07-26 15:53:57 +04:00
@@ -881,14 +881,13 @@
 	}
 	printk("%s: page index: %lu mapping: %p count: %i private: %lx\n",
 	       prefix, page->index, page->mapping, page_count(page), page->private);
-	printk("\tflags: %s%s%s%s %s%s%s%s %s%s%s%s %s%s%s\n",
+	printk("\tflags: %s%s%s%s %s%s%s %s%s%s%s %s%s%s\n",
 	       page_flag_name(page, PG_locked),
 	       page_flag_name(page, PG_error),
 	       page_flag_name(page, PG_referenced),
 	       page_flag_name(page, PG_uptodate),
 	       page_flag_name(page, PG_dirty),
 	       page_flag_name(page, PG_lru),
-	       page_flag_name(page, PG_active),
 	       page_flag_name(page, PG_slab),
 	       page_flag_name(page, PG_highmem),
 	       page_flag_name(page, PG_checked),

--------------010208060608010509010708--

