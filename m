From: Hans Reiser <reiser@namesys.com>
Subject: Re: new reiser4 snapshot
Date: Sun, 19 Oct 2003 22:09:33 +0400
Message-ID: <3F92D35D.3090806@namesys.com>
References: <Pine.LNX.4.44.0310191956060.15715-100000@poorvi.cse.iitd.ernet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15857-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0310191956060.15715-100000@poorvi.cse.iitd.ernet.in>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nishant Sharma <nishantt@cse.iitd.ernet.in>
Cc: Nikita Danilov <Nikita@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Nishant Sharma wrote:

>Hi,
>
>On Fri, 17 Oct 2003, Nikita Danilov wrote:
>  
>
>>Hello,
>>Reiser4 snapshot against 2.6.0-test7 has been released:
>>http://namesys.com/snapshots/2003.10.17/
>>Description is in http://namesys.com/snapshots/2003.10.17/READ.ME
>>    
>>
>	I downloaded the 2.6.0-test7 kernel and patched it for reiser4.  
>The kernel compiled successfully, with reiser4 enabled, except that some
>symbols were not found. When I booted the new kernel, I found that reiser4
>module doesnot load.
>
>-bash-2.05b# modprobe reiser4
>FATAL: Error inserting reiser4 
>(/lib/modules/2.6.0-test7/kernel/fs/reiser4/reiser4.ko): Unknown symbol in 
>module, or unknown parameter (see dmesg)
>-bash-2.05b# dmesg |tail 
>nfs warning: mount version older than kernel
>reiser4: Unknown symbol max_sane_readahead
>reiser4: Unknown symbol __remove_from_page_cache
>reiser4: Unknown symbol radix_tree_preload
>reiser4: Unknown symbol generic_sync_sb_inodes
>reiser4: Unknown symbol truncate_mapping_pages_range
>reiser4: Unknown symbol balance_dirty_pages_ratelimited
>reiser4: Unknown symbol inodes_stat
>reiser4: Unknown symbol nr_free_pagecache_pages
>reiser4: Unknown symbol destroy_inode
>
>	Following is the relevant section of my .config in kernel src-dir.
>
>CONFIG_REISER4_FS=m
># CONFIG_REISER4_FS_SYSCALL is not set
># CONFIG_REISER4_LARGE_KEY is not set
># CONFIG_REISER4_CHECK is not set
>CONFIG_REISER4_USE_EFLUSH=y
># CONFIG_REISER4_COPY_ON_CAPTURE is not set
># CONFIG_REISER4_BADBLOCKS is not set
>
>	What am I doing wrong? I believe that I followed the instructions 
>in http://namesys.com/snapshots/2003.10.17/READ.ME to the letter.
>  
>
Nikita, please determine why reiser4 tells users they can configure it 
as a module when they cannot.

-- 
Hans


