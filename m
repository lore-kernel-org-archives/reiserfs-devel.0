From: Michael Gaughen <mgaughen@polyserve.com>
Subject: BUG in reiserfs_write_full_page().
Date: Thu, 17 Jul 2003 14:19:50 -0700
Message-ID: <3F1712F6.7080204@polyserve.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14958-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

We have a test machine that continues to BUG() in 
reiserfs_write_full_page().
The machine is running SLES8 (2.4.19-152, UP). Here is the (kdb) stack 
trace:

qar3s2 login: kernel BUG at inode.c:2220!

[0]kdb> bt
EBP        EIP        Function (args)
0xc1f65b3c 0xcfe4bdd8 [reiserfs]reiserfs_write_full_page+0x98 (0xc10bde90, 
0x95)
                               reiserfs .text 0xcfe40060 0xcfe4bd40 0xcfe4c130
0xc1f65b4c 0xcfe4c178 [reiserfs]reiserfs_writepage+0x28 (0xc10bde90, 0x1d2, 
0xc1f65b80, 0xc1
f64000, 0x0)
                               reiserfs .text 0xcfe40060 0xcfe4c150 0xcfe4c180
0xc1f65b80 0xc014c02f shrink_cache+0x42f (0xc1f65bb0, 0x1d2, 0x3a, 0x1b)
                               kernel .text 0xc0100000 0xc014bc00 0xc014c0d0
0xc1f65b98 0xc014c309 shrink_caches+0x49 (0xc1f65bb0, 0x1d2, 0x0, 0xc03d4680, 
0x1)
                               kernel .text 0xc0100000 0xc014c2c0 0xc014c320
0xc1f65bc0 0xc014c382 try_to_free_pages+0x62 (0x0, 0x1d2, 0x0, 0xc03d506c, 
0x1)
                               kernel .text 0xc0100000 0xc014c320 0xc014c430
0xc1f65bdc 0xc014d6e2 balance_classzone+0x72 (0xc1f65c04, 0x1, 0x1000, 0x8, 
0xc1f64000)
                               kernel .text 0xc0100000 0xc014d670 0xc014d810
0xc1f65c14 0xc014da04 _wrapped_alloc_pages+0x1f4 (0x1d2, 0x0, 0xc03d5060, 
0xc1f75514, 0x1)
                               kernel .text 0xc0100000 0xc014d810 0xc014db20
0xc1f65c34 0xc014db43 __alloc_pages+0x23 (0xc172a940, 0xc101fa30, 0x0, 
0xcfa81708, 0xc101fa3
0)
                               kernel .text 0xc0100000 0xc014db20 0xc014dbe0
0xc1f65c60 0xc0141f25 page_cache_read+0xa5 (0xc172a940, 0x0, 0x5, 0x7)
                               kernel .text 0xc0100000 0xc0141e80 0xc0141f90
0xc1f65c78 0xc0141fce read_cluster_nonblocking+0x3e (0xc1f75514, 0x5, 
0xcfa8171c, 0xc1f754a4
, 0x7)
                               kernel .text 0xc0100000 0xc0141f90 0xc0141fe0
0xc1f65cac 0xc014394c filemap_nopage+0x12c (0xcff2b650, 0x804d000, 0x0, 
0xcfb0cf60, 0x0)
[0]more>
                               kernel .text 0xc0100000 0xc0143820 0xc0143a60
0xc1f65cf8 0xc013d956 do_no_page+0xc6 (0xcff30940, 0xcff2b650, 0x804da24, 
0x0, 0xc1c93268)
                               kernel .text 0xc0100000 0xc013d890 0xc013dc90
0xc1f65d2c 0xc013df70 handle_mm_fault+0xf0 (0xcff30940, 0xcff2b650, 
0x804da24, 0x0, 0xffffff85)
                               kernel .text 0xc0100000 0xc013de80 0xc013e040
0xc1f65e20 0xc0121580 do_page_fault_hook+0x26b (0xc1f65e30, 0x0, 0xc48e9000, 
0x1, 0xc2d65ca0)
                               kernel .text 0xc0100000 0xc0121315 0xc0121afb
           0xc0109a0c error_code+0x34
                               kernel .text 0xc0100000 0xc01099d8 0xc0109a14


Based on the line number info (inode.c:2220) here is the code snippet, 
taken from
reiserfs_write_full_page():

    if (reiserfs_transaction_running(inode->i_sb)) {
        BUG();
    }

The reason is most likely due to the fact that syslogd (the current 
process at the
time of the BUG()) was attempting to write to a log file.  As a part of 
that write,
a new transaction was started via 
__block_prepare_write()->reiserfs_get_block().
Then do_generic_file_write() took a page fault, leading to the 
memory-freeing
code and the call to reiserfs_write_full_page().

AFAICT, this problem only exists in the data-logging patch, and it still 
exists in
the latest patch against 2.4.22.  I searched around, but I couldn't find 
any mention
of this problem or a fix.

Any thoughts? Ideas?

Thanks,
-Mike

