From: Badari Pulavarty <pbadari@us.ibm.com>
Subject: migratepage failures on reiserfs
Date: Tue, 30 Oct 2007 10:27:04 -0800
Message-ID: <1193768824.8904.11.camel@dyn9047017100.beaverton.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: linux-mm <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

Hi,

While testing hotplug memory remove, I ran into this issue. Given a
range of pages hotplug memory remove tries to migrate those pages.

migrate_pages() keeps failing to migrate pages containing pagecache
pages for reiserfs files. I noticed that reiserfs doesn't have 
->migratepage() ops. So, fallback_migrate_page() code tries to
do try_to_release_page(). try_to_release_page() fails to drop_buffers()
since b_count == 1. Here is what my debug shows:

	migrate pages failed pfn 258111/flags 3f00000000801
	bh c00000000b53f6e0 flags 110029 count 1
	
Any one know why the b_count == 1 and not getting dropped to zero ? 

Thanks,
Badari 

