From: John Dalbec <jpdalbec@ysu.edu>
Subject: Trying to port data-logging to RH 2.4.18-19.7.x kernel
Date: Fri, 31 Jan 2003 09:41:25 -0500
Message-ID: <3E3A8B15.80300@ysu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12589-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I'm trying to port Chris's data-logging patches to the Red Hat 
2.4.18-19.7.x kernel.  My first effort works fine on my workstation with 
ReiserFS and NFS, but not on the production server:

> Jan 31 05:47:28 mail03 kernel: search_by_key called without kernel lock held
> Jan 31 05:47:28 mail03 kernel: ------------[ cut here ]------------
> Jan 31 05:47:28 mail03 kernel: kernel BUG at journal.c:429!
> Jan 31 05:47:28 mail03 kernel: invalid operand: 0000
> Jan 31 05:47:28 mail03 kernel: nfsd lockd sunrpc pcnet32 mii ipt_state ipt_LOG ip_conntrack_ftp iptable_mangle iptable_nat ip_conntrack iptable_filter ip_tables st reiserfs usb-ohci usbcore
> Jan 31 05:47:28 mail03 kernel: CPU:    0
> Jan 31 05:47:29 mail03 kernel: EIP:    0010:[pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1844766/96]    Not tainted
> Jan 31 05:47:29 mail03 kernel: EIP:    0010:[<e08c09e2>]    Not tainted
> Jan 31 05:47:29 mail03 kernel: EFLAGS: 00010246
> Jan 31 05:47:29 mail03 kernel: 
> Jan 31 05:47:29 mail03 kernel: EIP is at reiserfs_check_lock_depth [reiserfs] 0x22 (2.4.18-19.7.x.ysubigmem)
> Jan 31 05:47:29 mail03 kernel: eax: 00000000   ebx: df857800   ecx: 00000001   edx: c030a648
> Jan 31 05:47:29 mail03 kernel: esi: 00002108   edi: d42f5d74   ebp: df857800   esp: d42f5cd4
> Jan 31 05:47:29 mail03 kernel: ds: 0018   es: 0018   ss: 0018
> Jan 31 05:47:30 mail03 kernel: Process nfsd (pid: 1465, stackpage=d42f5000)
> Jan 31 05:47:30 mail03 kernel: Stack: e08ccd80 e08cc303 e08bb10a e08cc303 00000000 00000000 00000000 00000000 
> Jan 31 05:47:30 mail03 kernel:        00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
> Jan 31 05:47:30 mail03 kernel:        00000000 00000000 00000000 00000000 00000000 00001000 00000004 d0cc9880 
> Jan 31 05:47:30 mail03 kernel: Call Trace: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1794688/96] MAX_KEY [reiserfs] 0xda0 (0xd42f5cd4))
> Jan 31 05:47:30 mail03 kernel: Call Trace: [<e08ccd80>] MAX_KEY [reiserfs] 0xda0 (0xd42f5cd4))
> Jan 31 05:47:30 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1797373/96] MAX_KEY [reiserfs] 0x323 (0xd42f5cd8))
> Jan 31 05:47:31 mail03 kernel: [<e08cc303>] MAX_KEY [reiserfs] 0x323 (0xd42f5cd8))
> Jan 31 05:47:31 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1867510/96] search_by_key [reiserfs] 0x5a (0xd42f5cdc))
> Jan 31 05:47:31 mail03 kernel: [<e08bb10a>] search_by_key [reiserfs] 0x5a (0xd42f5cdc))
> Jan 31 05:47:31 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1797373/96] MAX_KEY [reiserfs] 0x323 (0xd42f5ce0))
> Jan 31 05:47:31 mail03 kernel: [<e08cc303>] MAX_KEY [reiserfs] 0x323 (0xd42f5ce0))
> Jan 31 05:47:31 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1926756/96] reiserfs_read_inode2 [reiserfs] 0x6c (0xd42f5d40))
> Jan 31 05:47:31 mail03 kernel: [<e08ac99c>] reiserfs_read_inode2 [reiserfs] 0x6c (0xd42f5d40))
> Jan 31 05:47:31 mail03 kernel: [get_new_inode+187/352] get_new_inode [kernel] 0xbb (0xd42f5dc0))
> Jan 31 05:47:31 mail03 kernel: [<c015a56b>] get_new_inode [kernel] 0xbb (0xd42f5dc0))
> Jan 31 05:47:31 mail03 kernel: [iget4+217/240] iget4 [kernel] 0xd9 (0xd42f5dec))
> Jan 31 05:47:31 mail03 kernel: [<c015a7d9>] iget4 [kernel] 0xd9 (0xd42f5dec))
> Jan 31 05:47:32 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1926608/96] reiserfs_find_actor [reiserfs] 0x0 (0xd42f5dfc))
> Jan 31 05:47:32 mail03 kernel: [<e08aca30>] reiserfs_find_actor [reiserfs] 0x0 (0xd42f5dfc))
> Jan 31 05:47:32 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1926540/96] reiserfs_iget [reiserfs] 0x24 (0xd42f5e24))
> Jan 31 05:47:32 mail03 kernel: [<e08aca74>] reiserfs_iget [reiserfs] 0x24 (0xd42f5e24))
> Jan 31 05:47:32 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1926608/96] reiserfs_find_actor [reiserfs] 0x0 (0xd42f5e30))
> Jan 31 05:47:32 mail03 kernel: [<e08aca30>] reiserfs_find_actor [reiserfs] 0x0 (0xd42f5e30))
> Jan 31 05:47:32 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1926354/96] reiserfs_fh_to_dentry [reiserfs] 0x6e (0xd42f5e44))
> Jan 31 05:47:32 mail03 kernel: [<e08acb2e>] reiserfs_fh_to_dentry [reiserfs] 0x6e (0xd42f5e44))
> Jan 31 05:47:33 mail03 kernel: [<e0b0af98>] nfsd_get_dentry [nfsd] 0x28 (0xd42f5e80))
> Jan 31 05:47:33 mail03 kernel: [<e0b0b3ff>] find_fh_dentry [nfsd] 0x3f (0xd42f5ea4))
> Jan 31 05:47:33 mail03 kernel: [<e0b0ba11>] fh_verify [nfsd] 0x271 (0xd42f5ee0))
> Jan 31 05:47:33 mail03 kernel: [<e0afb7ff>] svc_udp_recvfrom [sunrpc] 0x19f (0xd42f5f0c))
> Jan 31 05:47:33 mail03 kernel: [<e0b123c7>] nfsd3_proc_getattr [nfsd] 0x97 (0xd42f5f3c))
> Jan 31 05:47:33 mail03 kernel: [<e0b1b204>] nfsd_procedures3 [nfsd] 0x24 (0xd42f5f54))
> Jan 31 05:47:33 mail03 kernel: [<e0b09647>] nfsd_dispatch [nfsd] 0xb7 (0xd42f5f60))
> Jan 31 05:47:34 mail03 kernel: [<e0b1ab9c>] nfsd_version3 [nfsd] 0x0 (0xd42f5f78))
> Jan 31 05:47:34 mail03 kernel: [<e0afad23>] svc_process_Rsmp_720c86cf [sunrpc] 0x363 (0xd42f5f7c))
> Jan 31 05:47:34 mail03 kernel: [<e0b1b204>] nfsd_procedures3 [nfsd] 0x24 (0xd42f5f98))
> Jan 31 05:47:34 mail03 kernel: [<e0b1ab9c>] nfsd_version3 [nfsd] 0x0 (0xd42f5f9c))
> Jan 31 05:47:34 mail03 kernel: [<e0b1abbc>] nfsd_program [nfsd] 0x0 (0xd42f5fa0))
> Jan 31 05:47:34 mail03 kernel: [<e0b09420>] nfsd [nfsd] 0x240 (0xd42f5fbc))
> Jan 31 05:47:34 mail03 kernel: [<e0b091e0>] nfsd [nfsd] 0x0 (0xd42f5fe8))
> Jan 31 05:47:34 mail03 kernel: [kernel_thread+38/48] kernel_thread [kernel] 0x26 (0xd42f5ff0))
> Jan 31 05:47:34 mail03 kernel: [<c0107286>] kernel_thread [kernel] 0x26 (0xd42f5ff0))
> Jan 31 05:47:34 mail03 kernel: [<e0b091e0>] nfsd [nfsd] 0x0 (0xd42f5ff8))
> Jan 31 05:47:34 mail03 kernel: 
> Jan 31 05:47:34 mail03 kernel: 
> Jan 31 05:47:34 mail03 kernel: Code: 0f 0b ad 01 a4 cd 8c e0 59 58 c3 8d 76 00 31 c0 c3 8d b6 00 
> Jan 31 05:47:39 mail03 kernel:  search_by_key called without kernel lock held
> Jan 31 05:47:39 mail03 kernel: ------------[ cut here ]------------
> Jan 31 05:47:39 mail03 kernel: kernel BUG at journal.c:429!
> Jan 31 05:47:39 mail03 kernel: invalid operand: 0000
> Jan 31 05:47:39 mail03 kernel: nfsd lockd sunrpc pcnet32 mii ipt_state ipt_LOG ip_conntrack_ftp iptable_mangle iptable_nat ip_conntrack iptable_filter ip_tables st reiserfs usb-ohci usbcore
> Jan 31 05:47:39 mail03 kernel: CPU:    0
> Jan 31 05:47:39 mail03 kernel: EIP:    0010:[pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1844766/96]    Not tainted
> Jan 31 05:47:39 mail03 kernel: EIP:    0010:[<e08c09e2>]    Not tainted
> Jan 31 05:47:39 mail03 kernel: EFLAGS: 00010246
> Jan 31 05:47:39 mail03 kernel: 
> Jan 31 05:47:39 mail03 kernel: EIP is at reiserfs_check_lock_depth [reiserfs] 0x22 (2.4.18-19.7.x.ysubigmem)
> Jan 31 05:47:39 mail03 kernel: eax: 00000000   ebx: dc770800   ecx: 00000000   edx: dbd49f44
> Jan 31 05:47:39 mail03 kernel: esi: 000028e5   edi: d4317d74   ebp: dc770800   esp: d4317cd4
> Jan 31 05:47:40 mail03 kernel: ds: 0018   es: 0018   ss: 0018
> Jan 31 05:47:40 mail03 kernel: Process nfsd (pid: 1460, stackpage=d4317000)
> Jan 31 05:47:40 mail03 kernel: Stack: e08ccd80 e08cc303 e08bb10a e08cc303 00000000 00000000 00000000 00000000 
> Jan 31 05:47:40 mail03 kernel:        00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
> Jan 31 05:47:40 mail03 kernel:        00000000 00000000 00000000 00000000 00000000 00001000 00000004 ce496880 
> Jan 31 05:47:40 mail03 kernel: Call Trace: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1794688/96] MAX_KEY [reiserfs] 0xda0 (0xd4317cd4))
> Jan 31 05:47:40 mail03 kernel: Call Trace: [<e08ccd80>] MAX_KEY [reiserfs] 0xda0 (0xd4317cd4))
> Jan 31 05:47:40 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1797373/96] MAX_KEY [reiserfs] 0x323 (0xd4317cd8))
> Jan 31 05:47:41 mail03 kernel: [<e08cc303>] MAX_KEY [reiserfs] 0x323 (0xd4317cd8))
> Jan 31 05:47:41 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1867510/96] search_by_key [reiserfs] 0x5a (0xd4317cdc))
> Jan 31 05:47:41 mail03 kernel: [<e08bb10a>] search_by_key [reiserfs] 0x5a (0xd4317cdc))
> Jan 31 05:47:41 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1797373/96] MAX_KEY [reiserfs] 0x323 (0xd4317ce0))
> Jan 31 05:47:41 mail03 kernel: [<e08cc303>] MAX_KEY [reiserfs] 0x323 (0xd4317ce0))
> Jan 31 05:47:41 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1926756/96] reiserfs_read_inode2 [reiserfs] 0x6c (0xd4317d40))
> Jan 31 05:47:41 mail03 kernel: [<e08ac99c>] reiserfs_read_inode2 [reiserfs] 0x6c (0xd4317d40))
> Jan 31 05:47:41 mail03 kernel: [get_new_inode+187/352] get_new_inode [kernel] 0xbb (0xd4317dc0))
> Jan 31 05:47:42 mail03 kernel: [<c015a56b>] get_new_inode [kernel] 0xbb (0xd4317dc0))
> Jan 31 05:47:42 mail03 kernel: [iget4+217/240] iget4 [kernel] 0xd9 (0xd4317dec))
> Jan 31 05:47:42 mail03 kernel: [<c015a7d9>] iget4 [kernel] 0xd9 (0xd4317dec))
> Jan 31 05:47:42 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1926608/96] reiserfs_find_actor [reiserfs] 0x0 (0xd4317dfc))
> Jan 31 05:47:42 mail03 kernel: [<e08aca30>] reiserfs_find_actor [reiserfs] 0x0 (0xd4317dfc))
> Jan 31 05:47:42 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1926540/96] reiserfs_iget [reiserfs] 0x24 (0xd4317e24))
> Jan 31 05:47:43 mail03 kernel: [<e08aca74>] reiserfs_iget [reiserfs] 0x24 (0xd4317e24))
> Jan 31 05:47:43 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1926608/96] reiserfs_find_actor [reiserfs] 0x0 (0xd4317e30))
> Jan 31 05:47:44 mail03 kernel: [<e08aca30>] reiserfs_find_actor [reiserfs] 0x0 (0xd4317e30))
> Jan 31 05:47:44 mail03 kernel: [pcnet32:__insmod_pcnet32_O/lib/modules/2.4.18-19.7.x.ysubigmem/kern+-1926354/96] reiserfs_fh_to_dentry [reiserfs] 0x6e (0xd4317e44))
> Jan 31 05:47:44 mail03 kernel: [<e08acb2e>] reiserfs_fh_to_dentry [reiserfs] 0x6e (0xd4317e44))
> Jan 31 05:47:44 mail03 kernel: [<e0b0af98>] nfsd_get_dentry [nfsd] 0x28 (0xd4317e80))
> Jan 31 05:47:44 mail03 kernel: [<e0b0b3ff>] find_fh_dentry [nfsd] 0x3f (0xd4317ea4))
> Jan 31 05:47:44 mail03 kernel: [<e0b0ba11>] fh_verify [nfsd] 0x271 (0xd4317ee0))
> Jan 31 05:47:44 mail03 kernel: [<e0afb7ff>] svc_udp_recvfrom [sunrpc] 0x19f (0xd4317f0c))
> Jan 31 05:47:44 mail03 kernel: [<e0b123c7>] nfsd3_proc_getattr [nfsd] 0x97 (0xd4317f3c))
> Jan 31 05:47:44 mail03 kernel: [<e0b1b204>] nfsd_procedures3 [nfsd] 0x24 (0xd4317f54))
> Jan 31 05:47:45 mail03 kernel: [<e0b09647>] nfsd_dispatch [nfsd] 0xb7 (0xd4317f60))
> Jan 31 05:47:45 mail03 kernel: [<e0b1ab9c>] nfsd_version3 [nfsd] 0x0 (0xd4317f78))
> Jan 31 05:47:45 mail03 kernel: [<e0afad23>] svc_process_Rsmp_720c86cf [sunrpc] 0x363 (0xd4317f7c))
> Jan 31 05:47:45 mail03 kernel: [<e0b1b204>] nfsd_procedures3 [nfsd] 0x24 (0xd4317f98))
> Jan 31 05:47:45 mail03 kernel: [<e0b1ab9c>] nfsd_version3 [nfsd] 0x0 (0xd4317f9c))
> Jan 31 05:47:45 mail03 kernel: [<e0b1abbc>] nfsd_program [nfsd] 0x0 (0xd4317fa0))
> Jan 31 05:47:45 mail03 kernel: [<e0b09420>] nfsd [nfsd] 0x240 (0xd4317fbc))
> Jan 31 05:47:45 mail03 kernel: [<e0b091e0>] nfsd [nfsd] 0x0 (0xd4317fe8))
> Jan 31 05:47:45 mail03 kernel: [kernel_thread+38/48] kernel_thread [kernel] 0x26 (0xd4317ff0))
> Jan 31 05:47:45 mail03 kernel: [<c0107286>] kernel_thread [kernel] 0x26 (0xd4317ff0))
> Jan 31 05:47:45 mail03 kernel: [<e0b091e0>] nfsd [nfsd] 0x0 (0xd4317ff8))
> Jan 31 05:47:45 mail03 kernel: 
> Jan 31 05:47:45 mail03 kernel: 
> Jan 31 05:47:46 mail03 kernel: Code: 0f 0b ad 01 a4 cd 8c e0 59 58 c3 8d 76 00 31 c0 c3 8d b6 00 

Does this look familiar to anyone?  Any suggestions as to what I need to 
change?
Thanks,
John Dalbec

