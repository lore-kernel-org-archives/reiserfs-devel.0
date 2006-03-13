From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: journal-1413: journal_mark_dirty: j_len (1024) is too big
Date: Mon, 13 Mar 2006 13:39:49 +0300
Message-ID: <200603131339.50095.zam@namesys.com>
References: <17429.18382.24105.464221@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28244-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17429.18382.24105.464221@gargle.gargle.HOWL>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, rf@q-leap.de

Hello,

On Monday 13 March 2006 13:22, Roland Fehrenbacher wrote:
> Hi,
>
> I'm running into the same problem as other people recently (see
> kernel log below). However, the patch
> http://marc.theaimsgroup.com/?l=reiserfs&m=112300831729572&w=2
> doesn't apply to 2.6.15.5 I'm using, and it's not stratightforward to
> add it by hand. Do you have an updated patch?

newer version is there:

ftp.kernel.org:/pub/linux/kernel/people/akpm/patches/2.6/2.6.16-rc5/2.6.16-rc5-mm3/broken-out/
reiserfs-fix-transaction-overflowing.patch

> Thanks,
>
> Roland
>
> [244305.863380] REISERFS: panic (device dm-7): journal-1413:
> journal_mark_dirty: j_len (1024) is too big [244305.863384]
> [244305.863423] ------------[ cut here ]------------
> [244305.863434] kernel BUG at fs/reiserfs/prints.c:362!
> [244305.863446] invalid operand: 0000 [#1]
> [244305.863455] SMP
> [244305.863463] Modules linked in: nfsd exportfs ipt_MASQUERADE
> iptable_nat ip_nat ip_conntrack ip_tables w83781d hwmon_vid i2c_isa
> i2c_core bcm5700 [244305.863520] CPU:    0
> [244305.863521] EIP:    0060:[<c0192860>]    Not tainted VLI
> [244305.863523] EFLAGS: 00010286   (2.6.15.5)
> [244305.863553] EIP is at reiserfs_panic+0x39/0x59
> [244305.863575] eax: 00000080   ebx: c03878a6   ecx: f676bad8   edx:
> c0389a45 [244305.863600] esi: f6027e00   edi: f6027f50   ebp:
> f39b56b8   esp: f676bad4 [244305.863624] ds: 007b   es: 007b   ss:
> 0068
> [244305.863644] Process nfsd (pid: 1645, threadinfo=f676a000
> task=f65ad070) [244305.863657] Stack: c0389a45 f6027f50 c04bce60
> f6027e00 ffffffff f8d6c000 c019e48b f6027e00 [244305.863713]       
> c038ba38 00000400 00000445 00000000 00007499 f6027e00 00000b97
> f8d62000 [244305.863769]        c017e96c f676be8c f6027e00 f39b56b8
> f4beb9f8 f4bb6000 05cbf499 dca7d530 [244305.863825] Call Trace:
> [244305.863852]  [<c019e48b>] journal_mark_dirty+0x10f/0x21b
> [244305.863884]  [<c017e96c>] _reiserfs_free_block+0xd9/0x155
> [244305.863914]  [<c0198488>] prepare_for_delete_or_cut+0x5f1/0x66d
> [244305.863945]  [<c01991f8>] reiserfs_cut_from_item+0xbb/0x463
> [244305.863986]  [<c019995a>] reiserfs_do_truncate+0x34b/0x4cd
> [244305.864015]  [<c01fa702>] get_options+0x3e/0x43
> [244305.864042]  [<c015d339>] dput+0x1b/0x188
> [244305.864071]  [<c0198d4d>] reiserfs_delete_object+0x31/0x5f
> [244305.864099]  [<c0184fc9>] reiserfs_delete_inode+0x89/0x101
> [244305.864127]  [<c0184f40>] reiserfs_delete_inode+0x0/0x101
> [244305.864155]  [<c015faa9>] generic_delete_inode+0x8e/0xfd
> [244305.864183]  [<c015e30c>] d_delete+0x9e/0xf8
> [244305.864208]  [<c01577f9>] vfs_unlink+0x183/0x18a
> [244305.864236]  [<f8d968f8>] nfsd_unlink+0x19e/0x1de [nfsd]
> [244305.864283]  [<f8d9bfc0>] nfsd3_proc_remove+0x8f/0x98 [nfsd]
> [244305.864324]  [<f8d915d3>] nfsd_dispatch+0xbd/0x172 [nfsd]
> [244305.864361]  [<c034f5b3>] svc_process+0x366/0x59f
> [244305.864392]  [<f8d913b8>] nfsd+0x18f/0x2ed [nfsd]
> [244305.864428]  [<f8d91229>] nfsd+0x0/0x2ed [nfsd]
> [244305.864462]  [<c0100ea5>] kernel_thread_helper+0x5/0xb
> [244305.864489] Code: 78 38 c0 ff 74 24 18 8d be 50 01 00 00 e8 c9 fd
> ff ff 58 85 f6 89 d8 0f 45 c7 5a 68 60 ce 4b c0 50 68 45 9a 38 c0 e8
> 21 53 f8 ff <0f> 0b 6a 01 69 9a 38 c0 83 c4 0c 85 f6 68 60 ce 4b c0
> 0f 45 df [244305.865048]  Badness in do_exit at kernel/exit.c:796
> [244305.865149]  [<c0119851>] do_exit+0x37/0x332
> [244305.865291]  [<c01038ff>] do_trap+0x0/0xc1
> [244305.865431]  [<c0103b60>] do_invalid_op+0x0/0x86
> [244305.865569]  [<c0103bda>] do_invalid_op+0x7a/0x86
> [244305.865709]  [<c0192860>] reiserfs_panic+0x39/0x59
> [244305.865849]  [<c0117ec7>] release_console_sem+0x9e/0xa2
> [244305.865989]  [<c0117d96>] vprintk+0x204/0x228
> [244305.866128]  [<c01032ef>] error_code+0x4f/0x54
> [244305.866267]  [<c0192860>] reiserfs_panic+0x39/0x59
> [244305.866406]  [<c019e48b>] journal_mark_dirty+0x10f/0x21b
> [244305.866547]  [<c017e96c>] _reiserfs_free_block+0xd9/0x155
> [244305.866688]  [<c0198488>] prepare_for_delete_or_cut+0x5f1/0x66d
> [244305.866831]  [<c01991f8>] reiserfs_cut_from_item+0xbb/0x463
> [244305.866993]  [<c019995a>] reiserfs_do_truncate+0x34b/0x4cd
> [244305.867135]  [<c01fa702>] get_options+0x3e/0x43
> [244305.867273]  [<c015d339>] dput+0x1b/0x188
> [244305.867413]  [<c0198d4d>] reiserfs_delete_object+0x31/0x5f
> [244305.867553]  [<c0184fc9>] reiserfs_delete_inode+0x89/0x101
> [244305.867700]  [<c0184f40>] reiserfs_delete_inode+0x0/0x101
> [244305.867842]  [<c015faa9>] generic_delete_inode+0x8e/0xfd
> [244305.867983]  [<c015e30c>] d_delete+0x9e/0xf8
> [244305.868122]  [<c01577f9>] vfs_unlink+0x183/0x18a
> [244305.868287]  [<f8d968f8>] nfsd_unlink+0x19e/0x1de [nfsd]
> [244305.868438]  [<f8d9bfc0>] nfsd3_proc_remove+0x8f/0x98 [nfsd]
> [244305.868592]  [<f8d915d3>] nfsd_dispatch+0xbd/0x172 [nfsd]
> [244305.868740]  [<c034f5b3>] svc_process+0x366/0x59f
> [244305.868880]  [<f8d913b8>] nfsd+0x18f/0x2ed [nfsd]
> [244305.869027]  [<f8d91229>] nfsd+0x0/0x2ed [nfsd]
> [244305.869173]  [<c0100ea5>] kernel_thread_helper+0x5/0xb
>
>
> !DSPAM:44154803205838791294130!

-- 
Alex.
