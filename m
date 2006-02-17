From: Andrew James Wade <andrew.j.wade@gmail.com>
Subject: Re: reiser4 bug in 2.6.16-rc2-mm1
Date: Thu, 16 Feb 2006 23:17:31 -0500
Message-ID: <200602162317.32054.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
References: <20060210142215.GA1714@deprez-aerts.dyndns.org>
Reply-To: ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28082-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060210142215.GA1714@deprez-aerts.dyndns.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Friday 10 February 2006 09:22, Maarten Deprez wrote:
> Hello,
> 
> reiser4 on linux 2.6.16-rc2-mm1 bugs for me in
> plugins/file/tail_conversion.c line 29, locking up a process
> sometimes, when it is reading a file.
> 
> Greetings,
> Maarten Deprez
> 
> 

Still present in 2.6.16-rc3-mm1:

------------[ cut here ]------------
kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:81!
invalid opcode: 0000 [#1]
PREEMPT 
last sysfs file: /devices/pci0000:00/0000:00:01.0/0000:01:00.0/i2c-0/name
CPU:    0
EIP:    0060:[get_nonexclusive_access+30/49]    Not tainted VLI
EFLAGS: 00010286   (2.6.16-rc3-mm1 #2) 
EIP is at get_nonexclusive_access+0x1e/0x31
eax: cc2ec288   ebx: 00000000   ecx: cb87d4e8   edx: 00000000
esi: cb87d4e8   edi: 00000000   ebp: d30ba574   esp: d3934e00
ds: 007b   es: 007b   ss: 0068
Process kmail (pid: 21299, threadinfo=d3934000 task=d8577570)
Stack: <0>c01ca9ae d94d157c d3934ed8 cb87d540 0000000f 00000000 00320af1 00000000 
       df136ef4 0000f000 00000000 d20b2494 00001000 d94d158c ffffffff ffffffff 
       ffffffff ffffffff 00000127 00000000 43f543c8 2ac0f373 00000000 d94d158c 
Call Trace:
 <c01ca9ae> write_extent+0x68d/0xbc3   <c01cd0e2> item_length_by_coord+0xb/0xf
 <c01c8125> nr_units_extent+0x5/0xd   <c01c94ef> init_coord_extension_extent+0x60/0xdf
 <c01b5031> set_file_state+0x26/0x5b   <c01b5128> find_file_item+0xc2/0xd4
 <c01ca321> write_extent+0x0/0xbc3   <c01b6c46> write_flow+0x248/0x2df
 <c01b74bc> write_unix_file+0x343/0x4cc   <c01345f6> lru_cache_add_active+0x47/0x5d
 <c01b7179> write_unix_file+0x0/0x4cc   <c01488f5> vfs_write+0x83/0x122
 <c014910e> sys_write+0x3c/0x63   <c0102ac7> sysenter_past_esp+0x54/0x75
Code: 81 c4 b0 00 00 00 89 e8 5b 5e 5f 5d c3 85 d2 89 c1 75 20 b8 00 f0 ff ff 21 e0 8b 00 8b 80 c4 04 00 00 8b 40 40 83 78 08 00 74 08 <0f> 0b 51 00 b8 b8 38 c0 89 c8 ff 00 0f 88 e1 06 00 00 c3 55 ba 
 <4><4>reiser4[kmail(21299)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
WARNING: out of memory?
<4>reiser4[kmail(21299)]: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
WARNING: out of memory?
...

