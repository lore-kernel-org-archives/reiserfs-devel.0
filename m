From: Nick Wellnhofer <nick@paradigmashift.com>
Subject: BUG() in _get_block_create_0
Date: Mon, 23 Dec 2002 17:31:09 +0100
Message-ID: <3E073A4D.4090704@paradigmashift.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12224-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com


Hello list,

I'm using ReiserFS with the old 3.5 format on a web server. The system 
has been running fine for 2 years. About 1 month ago I upgraded from 
Linux 2.2.16 to 2.4.18 (SuSE 8.1 default kernel). Some weeks ago I got 
reiserfs error messages in syslog suggesting a fsck and I had some files 
which couldn't be accessed or deleted. So last week I ran reiserfsck 
--rebuid-tree. At first everything worked fine. The problematic files 
could be accessed again.

After about 3 hours I got an oops report in my syslog, but the system 
kept running normally. Again 3 hours later the machine crashed with 
another oops. It turned out that the BUG() in _get_block_create_0 in 
fs/reiserfs/inode.c was hit both times. According to the value of EAX
   le_key_k_type (version, key)
is TYPE_ANY (0x0f) but TYPE_DIRECT (0x02) is expected.

The machine is a web server in production and I have only remote access, 
so I couldn't run reiserfsck again.

Any suggestions?


Nick Wellnhofer


-----------------------------------------------------------------------

1st oops:
Dec 20 14:07:26 icycle kernel: invalid operand: 0000
Dec 20 14:07:26 icycle kernel: CPU:    0
Dec 20 14:07:26 icycle kernel: EIP: 
0010:[reiserfs:__insmod_reiserfs_S.text_L128336+26191/128352]    Not tainted
Dec 20 14:07:26 icycle kernel: EFLAGS: 00010202
Dec 20 14:07:26 icycle kernel: eax: 0000000f   ebx: c634f480   ecx: 
0000000f   edx: 00000000
Dec 20 14:07:26 icycle kernel: esi: 00000000   edi: 00004000   ebp: 
c5a29adc   esp: c5a29a34
Dec 20 14:07:26 icycle kernel: ds: 0018   es: 0018   ss: 0018
Dec 20 14:07:26 icycle kernel: Process httpd (pid: 2286, stackpage=c5a29000)
Dec 20 14:07:26 icycle kernel: Stack: 00000000 c9dbb240 00000000 
00000000 00001000 00000000 00000000 00000000
Dec 20 14:07:26 icycle kernel:        00000000 c634f480 c14bb000 
00000000 cd697000 c56a89c0 000068eb 00009a94
Dec 20 14:07:26 icycle kernel:        00000001 fffffffe 00080000 
4000090d 000068eb 00009a94 00000001 0000022b
Dec 20 14:07:26 icycle kernel: Call Trace: 
[reiserfs:__insmod_reiserfs_S.text_L128336+27002/128352] 
[req_new_io+74/84] [__delay+19/40] [__const_udelay+34/48] 
[reiserfs:__insmod_reiserfs_O/lib/modules/2.4.18-4GB/kernel/fs/reiser+-978918/96] 

Dec 20 14:07:26 icycle kernel: 
[reiserfs:__insmod_reiserfs_O/lib/modules/2.4.18-4GB/kernel/fs/reiser+-978621/96] 
[block_read_full_page+226/520] [add_to_page_cache_unique+109/116] 
[reiserfs:__insmod_reiserfs_S.text_L128336+37775/128352] 
[reiserfs:__insmod_reiserfs_S.text_L128336+26816/128352] 
[page_cache_read+186/224]
Dec 20 14:07:26 icycle kernel:    [read_cluster_nonblocking+45/68] 
[filemap_nopage+271/528] [do_no_page+77/400] [handle_mm_fault+91/236] 
[do_page_fault+435/1348] [do_page_fault+0/1348]
Dec 20 14:07:26 icycle kernel:    [qdisc_restart+19/216] 
[dev_queue_xmit+309/632] [ip_output+196/300] [getblk+65/116] 
[getblk+108/116] [error_code+52/64]
Dec 20 14:07:26 icycle kernel:    [csum_partial_copy_generic+72/228] 
[tcp_sendmsg+1072/4068] 
[reiserfs:__insmod_reiserfs_S.text_L128336+120947/128352] 
[inet_sendmsg+58/64] [sock_sendmsg+108/140] [sock_readv_writev+147/160]
Dec 20 14:07:26 icycle kernel:    [sock_writev+55/64] 
[do_readv_writev+338/568] [sys_mmap2+107/160] [sys_writev+65/84] 
[system_call+51/64]
Dec 20 14:07:26 icycle kernel:
Dec 20 14:07:26 icycle kernel: Code: 0f 0b 85 ff 75 0d 8b 85 7c ff ff ff 
31 f6 8b 58 08 eb 33 8b

2nd oops:
Dec 20 17:44:00 icycle kernel:  invalid operand: 0000
Dec 20 17:44:00 icycle kernel: CPU:    0
Dec 20 17:44:00 icycle kernel: EIP: 
0010:[reiserfs:__insmod_reiserfs_S.text_L128336+26191/128352]    Not tainted
Dec 20 17:44:00 icycle kernel: EFLAGS: 00010202
Dec 20 17:44:00 icycle kernel: eax: 0000000f   ebx: c92fa030   ecx: 
0000000f   edx: 00000000
Dec 20 17:44:00 icycle kernel: esi: 00000000   edi: 00004000   ebp: 
cef13adc   esp: cef13a34
Dec 20 17:44:00 icycle kernel: ds: 0018   es: 0018   ss: 0018
Dec 20 17:44:00 icycle kernel: Process httpd (pid: 6618, stackpage=cef13000)
Dec 20 17:44:00 icycle kernel: Stack: 00000000 c92feba0 00000000 
00000000 00001000 00000000 00000000 00000000
Dec 20 17:44:00 icycle kernel:        00000034 c92fa030 72000000 
00000000 cf02d000 cdbc8aa0 0000690f 0000a46b
Dec 20 17:44:00 icycle kernel:        00000001 fffffffe 00040000 
40000fdc 0000690f 0000a46b 00000001 0000022b
Dec 20 17:44:00 icycle kernel: Call Trace: 
[reiserfs:__insmod_reiserfs_S.text_L128336+27002/128352] 
[reiserfs:__insmod_reiserfs_S.text_L128336+77820/128352] 
[account_io_start+72/80] [req_new_io+74/84] [__delay+19/40]
Dec 20 17:44:00 icycle kernel:    [__const_udelay+34/48] 
[reiserfs:__insmod_reiserfs_O/lib/modules/2.4.18-4GB/kernel/fs/reiser+-978918/96] 
[reiserfs:__insmod_reiserfs_O/lib/modules/2.4.18-4GB/kernel/fs/reiser+-978621/96] 
[block_read_full_page+226/520] [add_to_page_cache_unique+109/116] 
[reiserfs:__insmod_reiserfs_S.text_L128336+37775/128352]
Dec 20 17:44:00 icycle kernel: 
[reiserfs:__insmod_reiserfs_S.text_L128336+26816/128352] 
[page_cache_read+186/224] [read_cluster_nonblocking+45/68] 
[filemap_nopage+271/528] [do_no_page+77/400] [handle_mm_fault+91/236]
Dec 20 17:44:00 icycle kernel:    [do_page_fault+435/1348] 
[do_page_fault+0/1348] [getblk+65/116] [qdisc_restart+19/216] 
[dev_queue_xmit+309/632] [ip_output+196/300]
Dec 20 17:44:00 icycle kernel:    [getblk+65/116] [getblk+108/116] 
[error_code+52/64] [csum_partial_copy_generic+43/228] 
[tcp_sendmsg+1072/4068] 
[reiserfs:__insmod_reiserfs_S.text_L128336+120947/128352]
Dec 20 17:44:00 icycle kernel:    [inet_sendmsg+58/64] 
[sock_sendmsg+108/140] [sock_readv_writev+147/160] [sock_writev+55/64] 
[do_readv_writev+338/568] [sys_mmap2+107/160]
Dec 20 17:44:00 icycle kernel:    [sys_writev+65/84] [system_call+51/64]
Dec 20 17:44:00 icycle kernel:
Dec 20 17:44:00 icycle kernel: Code: 0f 0b 85 ff 75 0d 8b 85 7c ff ff ff 
31 f6 8b 58 08 eb 33 8b

