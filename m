From: Cyrille Chepelov <cyrille@chepelov.org>
Subject: [2.6.0-test3 + reiser4] NULL dereference a virtual address 00000009
Date: Fri, 15 Aug 2003 17:12:05 +0200
Message-ID: <20030815151205.GA9260@chepelov.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15321-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Greetings,

while shaking reiserfs4 a little, I stumbled upon a NULL dereference.

Here's a manual copy of the oops, for what seems relevant:

eax: 00000000 ebx: c1047d40 ecx: 00000000 edx: c1047d40
esi: c1047d38 edi: 00000000 ebp: c184fa5c esp: c184fa50
Process apt-get 
Stack: c1047d40 c1047d38 c184fbb3 c184facc c01395ab 00000000 c1047d38 00000000
       00000000 00000000 c1683558 00000008 c1172c00 c1af5838 c184fa98 c02ddd88
       00000001 00000000 00000001 00000000 c184fac8 c01212bc 00000000 00000001
Call Trace:
  [<c01395ab>] read_cache_pages+0xbb/0x140
  [<c02ddd88>] elv_merged_request+0x18/0x20
  [<c01212bc>] update_process_times+0x2c/0x40
  [<c0216f59>] readpages_extent + 0x19/0x20

  # the rest of the addresses don't appear on the stack above, so please 
  # bear with my omitting them
	readahead_readpage_extent+0x0 / 0x80
	readpages_unix_file+0x31/0x40
	reiser4_readpages+0xeb/0xf0
	read_pages+0x10e/0x120
	buffered_rmqueue+0xd6/0x170
	__alloc_pages+0x75/0x2d0
	__do_page_cache_readahead+0xe2/0x170
	filemap_nopage+0x100/0x2f0
	unix_file_filemap_nopage+0x28/0x40
	unix_file_filemap_nopage+0x0/0x40
	do_no_page+0x8d/0x3b0
	handle_mm_fault+0xb1/0x140
	do_page_fault+0x240/0x498
	__do_page_cache_readahead + 0xe2/0x170
	page_cache_readahead+0x5b+0x160
	call_page_cache_readahead+0x41/0x50
	do_page_fault+0x0/0x498
	error_code+0x2d/0x40
	__copy_to_user_ll+0x48/0x70
	read_extent+0x103/0x250
	read_extent+0x0/0x250
	read_unix_file+0x2fb/0x4c0
	init_context+0x8c/0xd0
	reiser4_read+0x56/0x90
	vfs_read+0x29/0xf0
	sys_read+0x2e/0x50
	syscall_read+0x7/0xb

At this point, the kernel seems locked up. I'm going to reboot it, NFS away a
snapshot copy of the file system, then I'll remount the fs and attempt to
restart the apt-get operation (a couple of times). Finally, I'll restart my
test from scratch.

If I can reproduce the crash, I'll tell the list; likewise, if the fs'
snapshot image would be helpful in tracing the problem, I'll gladly provide
it.

	-- Cyrille

-- 
