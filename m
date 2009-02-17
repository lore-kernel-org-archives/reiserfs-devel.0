From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Reiser4: possible circular locking dependency detected
Date: Tue, 17 Feb 2009 14:41:00 +0100
Message-ID: <499ABE6C.6010904@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Hello,

I've got this warning in my logs with 2.6.29-rc5 + reiser4 patches:

=======================================================
[ INFO: possible circular locking dependency detected ]
2.6.29-rc5-00012-g94aca52 #132
-------------------------------------------------------
git/5217 is trying to acquire lock:
 (&data->latch){----}, at: [<f8bd442b>] get_exclusive_access+0x12/0x1c [reiser4]

but task is already holding lock:
 (&mm->mmap_sem){----}, at: [<c02067b1>] sys_mmap2+0x44/0x7b

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&mm->mmap_sem){----}:
       [<c0243477>] __lock_acquire+0x98d/0xb00
       [<c0243645>] lock_acquire+0x5b/0x81
       [<c0269d02>] might_fault+0x68/0x88
       [<f8be0b92>] reiser4_read_tail+0x60/0xc2 [reiser4]
       [<f8bd3e9f>] read_unix_file+0x2da/0x3a0 [reiser4]
       [<f8bd5348>] reiser4_read_careful+0xac/0xf4 [reiser4]
       [<c027cd28>] vfs_read+0x79/0xaa
       [<c027cdf2>] sys_read+0x3b/0x60
       [<c0202fff>] sysenter_do_call+0x12/0x43
       [<ffffffff>] 0xffffffff

-> #0 (&data->latch){----}:
       [<c024334c>] __lock_acquire+0x862/0xb00
       [<c0243645>] lock_acquire+0x5b/0x81
       [<c03c8d5a>] down_write+0x2a/0x46
       [<f8bd442b>] get_exclusive_access+0x12/0x1c [reiser4]
       [<f8bd19ff>] get_exclusive_access_careful+0x10/0x32 [reiser4]
       [<f8bd30d2>] mmap_unix_file+0x48/0x10a [reiser4]
       [<f8bd516d>] reiser4_mmap_careful+0xa1/0xe6 [reiser4]
       [<c026fea9>] mmap_region+0x219/0x3b0
       [<c0270224>] do_mmap_pgoff+0x1e4/0x230
       [<c02067c7>] sys_mmap2+0x5a/0x7b
       [<c0202fff>] sysenter_do_call+0x12/0x43
       [<ffffffff>] 0xffffffff

other info that might help us debug this:

1 lock held by git/5217:
 #0:  (&mm->mmap_sem){----}, at: [<c02067b1>] sys_mmap2+0x44/0x7b

stack backtrace:
Pid: 5217, comm: git Not tainted 2.6.29-rc5-00012-g94aca52 #132
Call Trace:
 [<c03c7800>] ? printk+0xf/0x17
 [<c02428d3>] print_circular_bug_tail+0x5d/0x68
 [<c024334c>] __lock_acquire+0x862/0xb00
 [<c0241280>] ? static_obj+0x6d/0x79
 [<c0243645>] lock_acquire+0x5b/0x81
 [<f8bd442b>] ? get_exclusive_access+0x12/0x1c [reiser4]
 [<c03c8d5a>] down_write+0x2a/0x46
 [<f8bd442b>] ? get_exclusive_access+0x12/0x1c [reiser4]
 [<f8bd442b>] get_exclusive_access+0x12/0x1c [reiser4]
 [<f8bd19ff>] get_exclusive_access_careful+0x10/0x32 [reiser4]
 [<f8bd30d2>] mmap_unix_file+0x48/0x10a [reiser4]
 [<f8bd516d>] reiser4_mmap_careful+0xa1/0xe6 [reiser4]
 [<c026fea9>] mmap_region+0x219/0x3b0
 [<c0270224>] do_mmap_pgoff+0x1e4/0x230
 [<c02067c7>] sys_mmap2+0x5a/0x7b
 [<c0202fff>] sysenter_do_call+0x12/0x43


The set of reiser4 patches I'm using is available from http://laurent.riffard.free.fr/reiser4/reiser4-for-2.6.29-rc5/:
0001-Reiser4-for-Linux-2.6.28.patch                           
0002-reiser4-adjust-to-the-new-aops-fixup.patch               
0003-Reiser4-fix-BUG-using-smp_processor_id-in-preemp.patch   
0004-Reiser4-Change-current-fs-ug-id-to-current_fs-ug-i.patch 
0005-Reiser4-fix-__grab_cache_page-usage.patch                
0006-Revert-Reiser4-fix-__grab_cache_page-usage.patch         
0007-Reiser4-build-fix.patch                                  
0008-reiser4-update-names-of-quota-methods.patch              

~~
laurent


