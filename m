From: Henning Westerholt <henning@skalatan.de>
Subject: reiserfs4 problems with compile load
Date: Fri, 15 Aug 2003 12:16:01 +0200
Message-ID: <200308151216.06053.henning@skalatan.de>
Reply-To: henning@skalatan.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15313-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

i used a reiserfs4 partition for my gentoo tmp/ emerge directory. I try to 
build mozilla 1.4, after the build in the strip-phase the filesystem hang.
A "ls" on the filesystem hangs also forever, a reset is required.

The build of several small packages and the restarted mozilla build finished 
though.
The try to rebuild gcc failed also. The builded gcc doesn't work. (My system 
is without reiserfs4 very stable). 


Then i setup a test environment, with two concurrent compile job in a loop 
(mozilla-1.4.0 and perl 5.8.0), and with stress (stress -i 2 -d 2 --hdd-bytes 
60M). This leads after a few hours to a kernel oops:

Aug 14 22:36:40 sonne kernel:  printing eip:
Aug 14 22:36:40 sonne kernel: c0227887
Aug 14 22:36:40 sonne kernel: Oops: 0000 [#1]
Aug 14 22:36:40 sonne kernel: CPU:    0
Aug 14 22:36:40 sonne kernel: EIP:    0060:[<c0227887>]    Not tainted
Aug 14 22:36:40 sonne kernel: EFLAGS: 00010286
Aug 14 22:36:40 sonne kernel: EIP is at jnode_extent_write+0xd7/0x390
Aug 14 22:36:40 sonne kernel: eax: dea74000   ebx: 00000001   ecx: 00000000   
edx: c6272f80
Aug 14 22:36:40 sonne kernel: esi: dea74000   edi: 00000000   ebp: e5ebda40   
esp: dea75b10
Aug 14 22:36:40 sonne kernel: ds: 007b   es: 007b   ss: 0068
Aug 14 22:36:40 sonne kernel: Process pdflush (pid: 8063, threadinfo=dea74000 
task=e9fb9980)
Aug 14 22:36:40 sonne kernel: Stack: 00000010 00000001 e3744f40 f7793ea0 
0007d3d8 00000000 00000000 00000008
Aug 14 22:36:40 sonne kernel:        00000000 dea74000 00000000 00000001 
c6272f80 00000020 f7daa800 0000faaf
Aug 14 22:36:40 sonne kernel:        00000000 00000000 0000001f c6272f80 
00000001 c0227bce c6272f80 00000001
Aug 14 22:36:40 sonne kernel: Call Trace:
Aug 14 22:36:40 sonne kernel:  [<c0227bce>] write_jnode_list+0x8e/0xc0
Aug 14 22:36:40 sonne kernel:  [<c022e5fa>] write_fq+0x5a/0x90
Aug 14 22:36:40 sonne kernel:  [<c02227c7>] write_prepped_nodes+0xa7/0xc0
Aug 14 22:36:40 sonne kernel:  [<c0222b0c>] jnode_flush+0x16c/0x450
Aug 14 22:36:40 sonne kernel:  [<c0222fef>] flush_current_atom+0x1df/0x430
Aug 14 22:36:40 sonne kernel:  [<c020e1fc>] get_current_trace_flags+0xc/0x60
Aug 14 22:36:40 sonne kernel:  [<c021f7fe>] flush_some_atom+0xee/0x1b0
Aug 14 22:36:40 sonne kernel:  [<c0232c88>] writeout+0x38/0x70
Aug 14 22:36:40 sonne kernel:  [<c0232d2a>] reiser4_sync_inodes+0x6a/0xa0
Aug 14 22:36:40 sonne kernel:  [<c017b2be>] sync_sb_inodes+0x1e/0x40
Aug 14 22:36:40 sonne kernel:  [<c017b337>] writeback_inodes+0x57/0xb0
Aug 14 22:36:40 sonne kernel:  [<c0141b5c>] background_writeout+0xbc/0x100
Aug 14 22:36:40 sonne kernel:  [<c01422ad>] __pdflush+0xdd/0x1e0
Aug 14 22:36:40 sonne kernel:  [<c01423b0>] pdflush+0x0/0x20
Aug 14 22:36:40 sonne kernel:  [<c01423bf>] pdflush+0xf/0x20
Aug 14 22:36:40 sonne kernel:  [<c0141aa0>] background_writeout+0x0/0x100
Aug 14 22:36:40 sonne kernel:  [<c0107240>] kernel_thread_helper+0x0/0x10
Aug 14 22:36:40 sonne kernel:  [<c0107245>] kernel_thread_helper+0x5/0x10
Aug 14 22:36:40 sonne kernel:
Aug 14 22:36:40 sonne kernel: Code: 8b 07 89 fa a9 00 00 08 00 74 03 8b 57 18 
ff 42 04 89 3c 24

I got the same error a with the restartet test-load a few hours later again.

Regards,

Henning

