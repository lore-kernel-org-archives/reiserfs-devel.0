From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: mount -o loop generates oops using reiser4 snapshot 0730
Date: Fri, 20 Aug 2004 00:09:53 +0400
Message-ID: <20040819200953.GQ5154@backtop.namesys.com>
References: <4124BD82.6060301@nada.kth.se>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20410-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4124BD82.6060301@nada.kth.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Larsson <d99-ela@nada.kth.se>
Cc: reiserfs-list@namesys.com

On Thu, Aug 19, 2004 at 04:47:30PM +0200, Emil Larsson wrote:
> When trying to mount anything looped onto a reiser4 file system, I get 
> an oops and the computer becomes unusable.
> A typical command causing the problem might be:
> 
> #mount -o loop /mnt /usr/src/sarge-i386-netinst.iso
> 
> My kernel version is 2.6.8-rc2 and I am using the 0730 reiser4 snapshot.
> 
> Please feel free for ask for any further information needed.

seems it is old reiser4 snapshot.  

please use http://www.namesys.com/snapshots/2004.08.13/
or 2.6.8.1-mm2, reiser4 code included.

> /Emil Larsson
> 
> 
> Here is the oops:
> 
> Unable to handle kernel paging request at virtual address 1000c11a
> printing eip:
> d23b9b10
> *pde = 00000000
> Oops: 0002 [#1]
> PREEMPT
> Modules linked in: sbp2 nbd iptable_filter ip_tables thermal processor 
> dm_crypt
> dm_mod aes loop ohci1394 ieee1394 nvidia dl2k via_agp via_rhine mii crc32
> CPU:    0
> EIP:    0060:[<d23b9b10>]    Tainted: P 
> EFLAGS: 00010282   (2.6.8-rc2-love3)
> EIP is at 0xd23b9b10
> eax: c11f3080   ebx: 00000000   ecx: 00000000   edx: e612bf74
> esi: 00001000   edi: e612be9c   ebp: 00001000   esp: e612be04
> ds: 007b   es: 007b   ss: 0068
> Process loop0 (pid: 8461, threadinfo=e612a000 task=e5b4ce50)
> Stack: f8a436a4 e612bf74 00000000 c11f3080 00000000 cc884620 e612bec8 
> 00001000
>       00000000 00000000 e612bec8 e612bf74 c11f3080 00000000 00001000 
> 00000000
>       c01fe544 e612be68 c11f3080 00000000 00001000 e612a000 00000000 
> cc884620
> Call Trace:
> [<f8a436a4>] lo_read_actor+0xa4/0xd0 [loop]
> [<c01fe544>] sendfile_common+0x184/0x270
> [<c01fe6b0>] sendfile_unix_file+0x80/0xa0
> [<f8a43600>] lo_read_actor+0x0/0xd0 [loop]
> [<c01d2962>] reiser4_sendfile+0xb2/0xd0
> [<f8a43600>] lo_read_actor+0x0/0xd0 [loop]
> [<f8a43736>] do_lo_receive+0x66/0x80 [loop]
> [<f8a43600>] lo_read_actor+0x0/0xd0 [loop]
> [<f8a437b2>] lo_receive+0x62/0x90 [loop]
> [<f8a4382c>] do_bio_filebacked+0x4c/0x80 [loop]
> [<f8a43b11>] loop_thread+0xa1/0x110 [loop]
> [<f8a43a70>] loop_thread+0x0/0x110 [loop]
> [<c0102301>] kernel_thread_helper+0x5/0x14
> Code: 80 a3 1a c1 00 10 00 00 00 00 00 00 e5 e5 e5 00 a0 3c 39 c1
> 
> 

-- 
Alex.
