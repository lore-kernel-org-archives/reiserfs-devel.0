From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck not fixing vs-5150/vs-13070
Date: Thu, 29 Aug 2002 12:57:06 +0400
Message-ID: <200208291257.06942.vitaly@namesys.com>
References: <20020828203754.GA11894@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11339-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020828203754.GA11894@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>, reiserfs-list <reiserfs-list@namesys.com>

On Thursday 29 August 2002 00:37, Matthias Andree wrote:
> Hello,
>
> I have some difficulties with a file system here. SuSE 2.4.19-4GB #1
>
> kernel, file system in reiserfs 3.6 format with r5 hash:
> | is_leaf: wrong item type for item *3.5*[13010 13029 0x1 IND], item_len 4,
> | item_location 4060, free_space(entry_count) 0 vs-5150: search_by_key:
> | invalid format found in block 33160. Fsck? vs-13070:
> | reiserfs_read_inode2: i/o failure occurred trying to find stat data of
> | [13010 13032 0x0 SD]
>
> I should note that I mounted that file system with "-o conv" recently to
> upgrade it to 3.6. Nothing was in the logs that called for my attention.
>
> Running reiserfsck --check (3.6.3) now, I get:
> | Filesystem seems mounted read-only. Skipping journal replay..
> | Checking S+tree..ok
> | Comparing bitmaps..ok
> | Checking Semantic tree...
> | ok
> | There were found 465 corruptions which can be fixed with --fix-fixable
> | check_and_free_buffer_mem: dirty buffer (4 16) found
>
> and the log file has tons of "file X Y has wrong sd_blocks 2, has to be
> 1" in it, but grepping for 13010, 13029 and 33160 in
>
>
> I tried reiserfsck 3.6.3 with --fix-fixable (what was recommended by
> reiserfsck --check) and also with --rebuild-tree, at no avail, the error
> keeps coming back.

Could you try reiserfsck --fix-fixable from reiserfsprogs-3.6.4-pre1, these  
fixable corruptions seem to be fixed there, and then reiserfsck --check.
If you get this "dirty buffer" again (or any other problem) send me please 
the metadata dump:
    debugreiserfs -p /dev/xxx | bzip -c > xxx.bz2

-- 

Thanks,
Vitaly Fertman
