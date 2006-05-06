From: "Yien Zheng" <esprout@gmail.com>
Subject: Re: Reiser4 2.6.16.2 / 2.6.17-rc3-mm1 WARNING: out of memory?
Date: Sat, 6 May 2006 04:42:51 -0500
Message-ID: <2c259a8f0605060242l62207c1dif918a380482e5441@mail.gmail.com>
References: <BAY23-F207CBCCD39A97DB66CAE06A7AA0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28576-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <BAY23-F207CBCCD39A97DB66CAE06A7AA0@phx.gbl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joseph Landers <josephlanders@hotmail.com>
Cc: reiserfs-list@namesys.com

I am getting a similar error with gentoo's 2.6.17-rc3-mm1 kernel.  I
had to go back to 2.6.17-rc1-mm2 to get reiser4 to work again.=20
2.6.17-rc2-mm1 had the same issue.

I looked into it, and it appears there were no reiser4 patches between
2.6.17-rc1.mm2 through 2.6.17-rc3-mm1, so if that's really the case,
some other patches must have affected reiser4 inadvertantly.

On 5/6/06, Joseph Landers <josephlanders@hotmail.com> wrote:
> Hi there,
>
> I have tried to compile the 2.6.17-rc3-mm1 patchset with kernel 2.6.16.14=
 by
> patching in the order specified in patch-series and adding the missing
> writeback 1of2 patch that was missing from the ftp. It compiles and I can
> mount the partition but I get this error if I boot from the partition
>
> [4294689.998000] kernel BUG at fs/inode.c:253!
> [4294689.998000] invalid opcode: 0000 [#1]
> [4294689.998000] Modules linked in: cpufreq_stats 8139cp 8139too
> snd_atiixp_modem snd_atiixp snd_ac97_codec snd_ac97_bus psmouse
> [4294689.998000] CPU:    0
> [4294689.998000] EIP:    0060:[<c0182df0>]    Tainted: GF     VLI
> [4294689.998000] EFLAGS: 00010202   (2.6.16.14 #1)
> [4294689.998000] EIP is at clear_inode+0x20/0xd0
> [4294689.998000] eax: 00000001   ebx: e56b90ec   ecx: 00000000   edx:
> e56b90ec
> [4294689.998000] esi: e64fc5c0   edi: e6ad96e4   ebp: e56b90ec   esp:
> e6091f08
> [4294689.998000] ds: 007b   es: 007b   ss: 0068
> [4294689.998000] Process Xorg (pid: 1151, threadinfo=3De6090000 task=3De6=
35ea70)
> [4294689.998000] Stack: <0>e56b90ec e56b90ec e64fc5c0 c01ebbab e56b90ec
> 00000003 e56b92ec c01818d6
> [4294689.998000]        e6ad96e4 00000200 00000000 00000000 c01ebb30
> e56b90ec c018333b e56b90ec
> [4294689.998000]        c0182691 e56b9110 00000000 e61a0000 c0179cdc
> e56b90ec e6ad96e4 e6ad9380
> [4294689.998000] Call Trace:
> [4294689.998000]  [<c01ebbab>] reiser4_delete_inode+0x7b/0xf0
> [4294689.998000]  [<c01818d6>] d_delete+0x86/0xa0
> [4294689.998000]  [<c01ebb30>] reiser4_delete_inode+0x0/0xf0
> [4294689.998000]  [<c018333b>] generic_delete_inode+0x5b/0xd0
> [4294689.998000]  [<c0182691>] iput+0x41/0x80
> [4294689.998000]  [<c0179cdc>] do_unlinkat+0x10c/0x140
> [4294689.998000]  [<c0102e3f>] sysenter_past_esp+0x54/0x75
> [4294689.998000] Code: da 8d 76 00 8d bc 27 00 00 00 00 56 53 83 ec 04 8b=
 5c
> 24 10 e8 e2 c9 2a 00 89 1c 24 e8 ca b2 fe ff 8b 83 dc 00 00 00 85 c0 74 0=
8
> <0f> 0b fd 00 92 44 45 c0 8b 83 38 01 00 00 a8 10 75 08 0f 0b ff
> [4294689.998000]  <4><4>reiser4[Xorg(1151)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
> [4294690.188000] WARNING: out of memory?
>
> I also get the same error if I grab the reiser4-2.6.16.2 and patch it
> against 2.6.16.14
>
> I then tried just compiling the 2.6.17-rc3-mm1 with reiser4 enabled and
> mounting the reiser4 and installing the kernel.deb to it
>
> I got this error when I tried to dpkg -i kernel.deb
>
> [  200.055000] kernel BUG at fs/inode.c:251!
> [  200.055000] invalid opcode: 0000 [#1]
> [  200.055000] last sysfs file:
> /devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> [  200.055000] Modules linked in: cpufreq_stats snd_atiixp snd_atiixp_mod=
em
> sdhci mmc_core psmouse 8139too 8139cp snd_ac97_codec snd_ac97_bus
> [  200.055000] CPU:    0
> [  200.055000] EIP:    0060:[<c017dcac>]    Not tainted VLI
> [  200.055000] EFLAGS: 00010202   (2.6.17-rc3-mm1 #1)
> [  200.055000] EIP is at clear_inode+0xcc/0xe0
> [  200.055000] eax: 00000001   ebx: d87cc7ac   ecx: 00000000   edx: d87cc=
7ac
> [  200.055000] esi: c17dd300   edi: e6f43000   ebp: dce13f50   esp: dce13=
e64
> [  200.055000] ds: 007b   es: 007b   ss: 0068
> [  200.055000] Process dpkg (pid: 3596, threadinfo=3Ddce12000 task=3Dd8e7=
9ab0)
> [  200.055000] Stack: <0>d87cc7ac d87cc7ac c17dd300 c01ea86b d87cc7ac
> 00000003 22222222 22222222
> [  200.055000]        22222222 d87cc7ac d87d2f20 d87cc8d4 c01ea7f0 d87cc7=
ac
> c017e17b d87cc7ac
> [  200.055000]        c017d4b1 d87cc7d0 d87d2f20 d87cc7ac c017b8b8 d87cc7=
ac
> 00000400 00000000
> [  200.055000] Call Trace:
> [  200.055000]  <c01ea86b> reiser4_delete_inode+0x7b/0xf0   <c01ea7f0>
> reiser4_delete_inode+0x0/0xf0
> [  200.055000]  <c017e17b> generic_delete_inode+0x5b/0xe0   <c017d4b1>
> iput+0x41/0x80
> [  200.055000]  <c017b8b8> dentry_iput+0x58/0x90   <c017bea2>
> dput+0x92/0x1a0
> [  200.055000]  <c0174492> sys_renameat+0x202/0x230   <c01545f2>
> unmap_region+0xc2/0x120
> [  200.055000]  <c01744e7> sys_rename+0x27/0x30   <c0435433>
> sysenter_past_esp+0x54/0x75
> [  200.055000] Code: 00 89 f0 c7 04 24 02 00 00 00 e8 60 5e 2b 00 eb 99 0=
f
> 0b fd 00 b3 80 45 c0 e9 77 ff ff ff 0f 0b fc 00 b3 80 45 c0 e9 66 ff ff f=
f
> <0f> 0b fb 00 b3 80 45 c0 e9 4b ff ff ff 8d b4 26 00 00 00 00 55
> [  200.055000] EIP: [<c017dcac>] clear_inode+0xcc/0xe0 SS:ESP 0068:dce13e=
64
> [  200.055000]  <4><4>reiser4[dpkg(3596)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
> [  200.069000] WARNING: out of memory?
> [  200.070000] BUG: dpkg/3596, lock held at task exit time!
> [  200.070000]  [d8b5ec9c] {inode_init_once}
> [  200.070000] .. held by:              dpkg: 3596 [d8e79ab0, 118]
> [  200.070000] ... acquired at:               lock_rename+0x94/0xa0
>
> and again
>
> [  314.880000] kernel BUG at fs/inode.c:251!
> [  314.880000] invalid opcode: 0000 [#1]
> [  314.880000] last sysfs file:
> /devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> [  314.880000] Modules linked in: cpufreq_stats sdhci mmc_core 8139too
> 8139cp psmouse snd_atiixp_modem snd_atiixp snd_ac97_codec snd_ac97_bus
> [  314.880000] CPU:    0
> [  314.880000] EIP:    0060:[<c017dcac>]    Not tainted VLI
> [  314.880000] EFLAGS: 00010202   (2.6.17-rc3-mm1 #1)
> [  314.880000] EIP is at clear_inode+0xcc/0xe0
> [  314.880000] eax: 00000001   ebx: d5fe632c   ecx: 00000000   edx: d5fe6=
32c
> [  314.880000] esi: e6724080   edi: e6767000   ebp: d5a1bf50   esp: d5a1b=
e64
> [  314.880000] ds: 007b   es: 007b   ss: 0068
> [  314.880000] Process depmod (pid: 3747, threadinfo=3Dd5a1a000 task=3Dd7=
4c6ab0)
> [  314.880000] Stack: <0>d5fe632c d5fe632c e6724080 c01ea86b d5fe632c
> 00000003 22222222 22222222
> [  314.880000]        22222222 d5fe632c d55d0bbc d5fe6454 c01ea7f0 d5fe63=
2c
> c017e17b d5fe632c
> [  314.880000]        c017d4b1 d5fe6350 d55d0bbc d5fe632c c017b8b8 d5fe63=
2c
> 00000400 00000000
> [  314.880000] Call Trace:
> [  314.880000]  <c01ea86b> reiser4_delete_inode+0x7b/0xf0   <c01ea7f0>
> reiser4_delete_inode+0x0/0xf0
> [  314.880000]  <c017e17b> generic_delete_inode+0x5b/0xe0   <c017d4b1>
> iput+0x41/0x80
> [  314.880000]  <c017b8b8> dentry_iput+0x58/0x90   <c017bea2>
> dput+0x92/0x1a0
> [  314.880000]  <c0174492> sys_renameat+0x202/0x230   <c01545f2>
> unmap_region+0xc2/0x120
> [  314.880000]  <c01744e7> sys_rename+0x27/0x30   <c0435433>
> sysenter_past_esp+0x54/0x75
> [  314.880000] Code: 00 89 f0 c7 04 24 02 00 00 00 e8 60 5e 2b 00 eb 99 0=
f
> 0b fd 00 b3 80 45 c0 e9 77 ff ff ff 0f 0b fc 00 b3 80 45 c0 e9 66 ff ff f=
f
> <0f> 0b fb 00 b3 80 45 c0 e9 4b ff ff ff 8d b4 26 00 00 00 00 55
> [  314.880000] EIP: [<c017dcac>] clear_inode+0xcc/0xe0 SS:ESP 0068:d5a1be=
64
> [  314.880000]  <4><4>reiser4[depmod(3747)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
> [  314.897000] WARNING: out of memory?
> [  314.919000] BUG: depmod/3747, lock held at task exit time!
> [  314.919000]  [d5f5015c] {inode_init_once}
> [  314.919000] .. held by:            depmod: 3747 [d74c6ab0, 118]
> [  314.919000] ... acquired at:               lock_rename+0x94/0xa0
>
> I have tried patching the reiser4 files extent_file_ops.c and tail.c with
> get_nonexclusive_access(uf_info, 1) instead of 0 but this has no effect
>
> I really want to get my reiser4 partition working properly
>
> If you need any more info please ask
>
> _________________________________________________________________
> The new MSN Search Toolbar now includes Desktop search!
> http://join.msn.com/toolbar/overview
>
>
