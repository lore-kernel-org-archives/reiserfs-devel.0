From: sebo@fifarafa.eu.org (Sebo)
Subject: Bug in reiserfsck
Date: Tue, 13 Apr 2004 02:04:19 +0200
Message-ID: <20040413000419.GA12988@Fifarafa.fifarafa>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17881-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

    Hi, I did bad ram and my file system crased. I did hreiserfsck --rebuild-tree and it was segfaul in pass1.
I have been testing reiserfs 3.6.15-pre1 and this version also have this bug.
    This bug is fully recurrence and I can make more test for you. Thx for advice.
										    Sebo.


    My system:
	Kernel 2.6.3
	Reiserfsprogs 3.6.15-pre1
    Backtrace of bug:

#0  0x4009ba55 in memmove () from /lib/libc.so.6
No symbol table info available.
#1  0x0806e5af in leaf_cut_entries (bh=0xfffffff0, ih=0x80e3328, from=32, del_count=1) at lbalance.c:849
        item = 0x8135000 <Address 0x8135000 out of bounds>
        prev_record_offset = 1073659064
        prev_record = 0x80e4300 "mem_end"
        cut_records_len = 32
        i = -16
        entry_count = 135483376																																	          	    
#2  0x0806e858 in leaf_cut_from_buffer (fs=0x8090348, bi=0xbffffb90, cut_item_num=0, pos_in_item=2, cut_size=1)
    at lbalance.c:888
        nr = 32
        bh = (struct buffer_head *) 0x80e30e8
        blkh = (struct block_head *) 0x80e3310
        ih = (struct item_head *) 0x80e3328
        last_loc = -48
        unmoved_loc = -16
        i = -16
#3  0x0806ed04 in cut_entry (fs=0x8090348, bh=0xfffffff0, item_num=0, entry_num=2, del_count=1) at lbalance.c:1116
        bi = {bi_bh = 0x80e30e8, bi_parent = 0x0, bi_position = 0}
#4  0x08051b30 in pass1_correct_leaf (fs=0x8090348, bh=0x80e30e8) at pass1.c:380
        deh = (struct reiserfs_de_head *) 0x80e42e0
        name = 0x80e42e0 "\001"
        name_len = 31
        hash_code = 0
        i = 0
        j = 2
        ih = (struct item_head *) 0x80e3328
        ind_item = (__u32 *) 0x809a7a8
        unfm_ptr = 0
        dirty = 0
#5  0x080524cd in do_pass_1 (fs=0x8090348) at pass1.c:688
        bh = (struct buffer_head *) 0x80e30e8
        i = 479764
        what_node = 1
        done = 17033
        total = 25365
#6  0x08052905 in pass_1 (fs=0x8090348) at pass1.c:800
        No locals.
#7  0x0804af4a in rebuild_tree (fs=0x8090348) at main.c:852
        t = 1081813744
        ret = 0
        retval = 0
	error = 0


