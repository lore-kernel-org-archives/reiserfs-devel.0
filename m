From: Cal <hihone@bigpond.net.au>
Subject: Re: reiser4 problems in 2.6.10-rc1-mm
Date: Sat, 20 Nov 2004 07:44:01 +1100
Message-ID: <20041120074401.4aec50ac.hihone@bigpond.net.au>
References: <1100667360l.1027l.0l@comotion>
	<1100850087l.4414l.0l@comotion>
	<20041119192825.6d53af61.hihone@bigpond.net.au>
	<877joioyiy.fsf@barad-dur.crans.org>
Reply-To: hihone@bigpond.net.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22437-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <877joioyiy.fsf@barad-dur.crans.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mathieu Segaud <matt@minas-morgul.org>
Cc: kacperw@online.no, reiserfs-list@namesys.com

and then at Fri, 19 Nov 2004 12:42:45 +0100, it was written ...
 >Could you try 2.6.10-rc2-mm2, reiser4 is pretty stable in this tree,
and >contains more fix bits.

Lost in the alchemy, I didn't notice the update, so thanks for the
update pointer. The problem still happens in 2.6.10-rc2-mm2:-

kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:58!
invalid operand: 0000 [#1]
PREEMPT SMP 
Modules linked in: snd_emu10k1 snd_rawmidi snd_seq_device
snd_ac97_codec snd_pcm snd_rtctimer snd_timer snd_page_alloc
snd_util_mem snd_hwdep snd soundcore i2c_viapro i2c_core usbhid
uhci_hcd usbcore 8139too mii crc32 pcspkr CPU:    1
EIP:    0060:[<c0215f09>]    Not tainted VLI
EFLAGS: 00210282   (2.6.10-rc2-mm2) 
EIP is at get_nonexclusive_access+0x29/0x40
eax: f6fbdf1c   ebx: f5e42c58   ecx: f78a2040   edx: f5e42be0
esi: f5e42c18   edi: f5e42be0   ebp: f6d508b4   esp: f6fbdc40
ds: 007b   es: 007b   ss: 0068
Process apt-get (pid: 2314, threadinfo=f6fbc000 task=f784b570)
Stack: c0214be0 f5e42be0 f7906400 00000000 00000000 00000000 00000000
00000000        00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000        00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 Call Trace:
 [<c0214be0>] unix_file_filemap_nopage+0x50/0xa0
 [<c0148c1e>] do_no_page+0xce/0x3a0
 [<c02fb958>] io_schedule+0x28/0x40
 [<c014911e>] handle_mm_fault+0x10e/0x1b0
 [<c0147475>] follow_page+0x25/0x30
 [<c01475f8>] get_user_pages+0x138/0x3c0
 [<c0214037>] reiser4_get_user_pages+0x97/0xd0
 [<c0214714>] read_unix_file+0x2f4/0x310
 [<c016362d>] inode_get_bytes+0x3d/0x60
 [<c01cf8dc>] init_context+0x6c/0xa0
 [<c01e77f7>] reiser4_read+0x77/0xc0
 [<c0158b3d>] vfs_read+0xed/0x190
 [<c0158eb1>] sys_read+0x51/0x80
 [<c0102983>] syscall_call+0x7/0xb
Code: 00 00 b8 00 e0 ff ff 8b 54 24 04 21 e0 8b 00 8b 80 e0 04 00 00
8b 40 4c 8b 48 10 85 c9 75 0c 89 d0 f0 ff 00 0f 88 52 12 00 00 c3 <0f>
0b 3a 00 00 7e 32 c0 eb ea 8d b6 00 00 00 00 8d bc 27 00
00 

Last night, with a blend of about 60/40 alchemy/engineering, I merged
base 2.6.10-rc2 with 2.6.10-rc2-bk3, reiser4-for-2.6.10-rc1, selected
fixes from 2.6.10-mm1 and the reiserfs mailing list, plus ck patches.
 So far that build performs just fine.  Now I guess I need to figure
out the difference between that and 2.6.10-mm2.  That said, I
cheerfully acknowledge that the mm series is the best place to be if
using reiser4.

cheers, Cal
