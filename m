From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiserfs crash
Date: Mon, 15 Nov 2004 13:07:26 +0300
Message-ID: <1100513246.1496.247.camel@tribesman.namesys.com>
References: <20041113203835.GA9979@bminton.is-a-geek.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22382-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041113203835.GA9979@bminton.is-a-geek.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brian Minton <brian@minton.name>
Cc: reiserfs-list@namesys.com

Hello

On Sat, 2004-11-13 at 23:38, Brian Minton wrote:
> ksymoops 2.4.9 on i686 2.6.8-1-686.  Options used
>      -V (default)
>      -k /proc/ksyms (default)
>      -l /proc/modules (default)
>      -o /lib/modules/2.6.8-1-686/ (default)
>      -m /boot/System.map-2.6.8-1-686 (default)
> 
> Warning: You did not tell me where to find symbol information.  I will
> assume that the log matches the kernel and modules that are running
> right now and I'll use the default options above for symbol resolution.
> If the current kernel and/or modules do not match the log, you can get
> more accurate output by telling me the kernel version and where to find
> map, modules, ksyms etc.  ksymoops -h explains the options.
> 
> Error (regular_file): read_ksyms stat /proc/ksyms failed
> No modules in ksyms, skipping objects
> No ksyms, skipping lsmod
> Nov 13 14:36:51 bminton kernel: kernel BUG at fs/reiserfs/journal.c:518!
> Nov 13 14:36:51 bminton kernel: invalid operand: 0000 [#1]
> Nov 13 14:36:51 bminton kernel: CPU:    0
> Nov 13 14:36:51 bminton kernel: EIP:    0060:[__crc_blk_queue_start_tag+3666037/4471782]    Not tainted
> Nov 13 14:36:51 bminton kernel: EFLAGS: 00010286   (2.6.8-1-686) 
> Nov 13 14:36:51 bminton kernel: eax: 00000000   ebx: d8f3d10c   ecx: 00000c2c   edx: d8f706e8
> Nov 13 14:36:51 bminton kernel: esi: 01018000   edi: 00000000   ebp: d7208400   esp: c8371bd8
> Nov 13 14:36:51 bminton kernel: ds: 007b   es: 007b   ss: 0068
> Nov 13 14:36:51 bminton kernel: Stack: 00000001 00000000 00000001 d5e4e080 00000000 d8f3b018 c8371c60 d7208400 
> Nov 13 14:36:51 bminton kernel:        d894123c d7208400 00000203 00000000 00000001 c8371c18 00000000 b75bcfc3 
> Nov 13 14:36:51 bminton kernel:        00000000 00000203 c8371c60 00000000 d7208400 d8941514 c8371ebc 00000203 
> Nov 13 14:36:51 bminton kernel: Call Trace:
> Warning (Oops_read): Code line not seen, dumping what data is available
> 
> 
> >>ebx; d8f3d10c <__crc_raise_softirq+ed6f0/241947>
> >>edx; d8f706e8 <__crc_raise_softirq+120ccc/241947>
> >>esi; 01018000 <__crc_put_tty_driver+15c4/5f1b4>
> >>ebp; d7208400 <__crc_complete_all+1e0f73/44e1b7>
> >>esp; c8371bd8 <__crc_tcp_destroy_sock+237f99/546fd3>
> 
> Nov 13 14:36:51 bminton kernel: Code: 0f 0b 06 02 04 3d 97 d8 b8 01 00 00 00 eb 98 39 68 04 75 dd 
> Using defaults from ksymoops -t elf32-i386 -a i386
> 
> 
> Code;  00000000 Before first symbol
> 00000000 <_EIP>:
> Code;  00000000 Before first symbol
>    0:   0f 0b                     ud2a   
> Code;  00000002 Before first symbol
>    2:   06                        push   %es
> Code;  00000003 Before first symbol
>    3:   02 04 3d 97 d8 b8 01      add    0x1b8d897(,%edi,1),%al
> Code;  0000000a Before first symbol
>    a:   00 00                     add    %al,(%eax)
> Code;  0000000c Before first symbol
>    c:   00 eb                     add    %ch,%bl
> Code;  0000000e Before first symbol
>    e:   98                        cwtl   
> Code;  0000000f Before first symbol
>    f:   39 68 04                  cmp    %ebp,0x4(%eax)
> Code;  00000012 Before first symbol
>   12:   75 dd                     jne    fffffff1 <_EIP+0xfffffff1>
> 
> 
> 2 warnings and 1 error issued.  Results may not be reliable.
> 
> Here is the original log:
> 
> Nov 13 14:36:50 bminton kernel: ReiserFS: warning: is_tree_node: node level 65535 does not match to the expected one 1
> Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 1212416. Fsck?
> Nov 13 14:36:50 bminton kernel: ReiserFS: dm-0: warning: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [2 4 0x0 SD]
> Nov 13 14:36:50 bminton kernel: SD]

Please reiserfsck dm-0.
(ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.19.tar.gz)


