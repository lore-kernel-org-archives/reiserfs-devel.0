From: Michael Labiuk <michael.labiuk@virtuozzo.com>
Subject: BUG kernel page fault in kernel v6.4+
Date: Thu, 6 Jul 2023 07:17:15 +0300
Message-ID: <d5507d3b-d23d-1e3f-4b30-880823a143da@virtuozzo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2qqGbAUQHB26VidUb/Ntio3HCPsHbc8Yk1a6vThyKw=;
 b=ZNErpjkQ0+409CqXs307S7KSE2dpZGzqG61KuGWQqTCd6z4Cf/2PDjpsa/uZ+1eSmCVXWc39rhzH4FtznHZa6ip+mMopJRXxE07Ss8kkg6FAgVy1gidABUS9GhpWqr0cQVESko29qVeiAp7wwCILG8LnuXJCrkfU2gXI7na950CEIUMO4hTlaYXy/88WE2DfRiuMo3hQPYTo+3k1xk7zI0g1HTqlQKemgAjOq8JXhUdCUiLJQtSUkOXIw+kktqyR24qccnEfFC/tIIT8xlZMWDebZei1E4eBBQ4Lqqq5SyT/NFw1jsB+bx+4xZSBekcnDsvaG2GZMLpnOt1ifl7Kuw==
Content-Language: ru-RU, en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hello.
I've found issue after update to kernel to 6.4. I am using reiserfs for 
gentoo portage git repository. Kernel 6.4 crashes with high probability 
during git operation like change revision or merging. Many files created 
or deleted between commits in gentoo repository 
https://github.com/gentoo-mirror/gentoo

Unmount may deadlock and filesystem does not  unmount clear after crash. 
reiserfsck will replay journal.


dmesg:

[Mon Jul  3 21:56:04 2023] REISERFS warning:  read_super_block: reiserfs 
filesystem is deprecated and scheduled to be removed from the kernel in 2025
[Mon Jul  3 21:56:04 2023] REISERFS (device dm-1): found reiserfs format 
"3.6" with standard journal
[Mon Jul  3 21:56:04 2023] REISERFS (device dm-1): using ordered data mode
[Mon Jul  3 21:56:04 2023] reiserfs: using flush barriers
[Mon Jul  3 21:56:04 2023] REISERFS (device dm-1): journal params: 
device dm-1, size 8192, journal first block 18, max trans len 1024, max 
batch 900, max commit age 30, max trans age 30
[Mon Jul  3 21:56:04 2023] REISERFS (device dm-1): checking transaction 
log (dm-1)
[Mon Jul  3 21:56:04 2023] REISERFS (device dm-1): Using r5 hash to sort 
names
[Mon Jul  3 21:56:33 2023] ------------[ cut here ]------------
[Mon Jul  3 21:56:33 2023] kernel BUG at fs/reiserfs/journal.c:3039!
[Mon Jul  3 21:56:33 2023] invalid opcode: 0000 [#1] PREEMPT SMP PTI
[Mon Jul  3 21:56:33 2023] CPU: 2 PID: 1165 Comm: git Tainted: G     
U             6.3.0+ #9
[Mon Jul  3 21:56:33 2023] Hardware name: LENOVO 20H9CTO1WW/20H9CTO1WW, 
BIOS N1VET63W (1.53 ) 12/20/2022
[Mon Jul  3 21:56:33 2023] RIP: 0010:do_journal_begin_r+0x36e/0x390 
[reiserfs]
[Mon Jul  3 21:56:33 2023] Code: 00 e8 16 8c d9 f7 8b 93 00 02 02 00 e9 
55 fe ff ff 83 78 08 01 0f 8e 0e fe ff ff 0f 0b 48 89 ef e8 17 a1 ff ff 
e9 0d fd ff ff <0f> 0b e8 1b 7c 29 f7 48 89 83 80 00 00 00 e9 b4 fe ff 
ff e8 ba 16
[Mon Jul  3 21:56:33 2023] RSP: 0018:ffff9e7603a57ad8 EFLAGS: 00010293
[Mon Jul  3 21:56:33 2023] RAX: 0000000000000400 RBX: ffff9e7601c59000 
RCX: 0000000000000000
[Mon Jul  3 21:56:33 2023] RDX: 00000000168750d6 RSI: ffffffffc0aa49ab 
RDI: 0000000000000000
[Mon Jul  3 21:56:33 2023] RBP: ffff91689d77c000 R08: 0000000000000000 
R09: 0000000000000000
[Mon Jul  3 21:56:33 2023] R10: 0000000000000000 R11: 0000000000000000 
R12: 00000000168750d6
[Mon Jul  3 21:56:33 2023] R13: 0000000000000000 R14: ffff9168af921900 
R15: 00000000168750d6
[Mon Jul  3 21:56:33 2023] FS:  00007f00daa6d740(0000) 
GS:ffff916bd0700000(0000) knlGS:0000000000000000
[Mon Jul  3 21:56:33 2023] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Mon Jul  3 21:56:33 2023] CR2: 00007f00b224834b CR3: 0000000154fb2004 
CR4: 00000000003706e0
[Mon Jul  3 21:56:33 2023] Call Trace:
[Mon Jul  3 21:56:33 2023]  <TASK>
[Mon Jul  3 21:56:33 2023]  ? kmem_cache_alloc_lru+0x2ad/0x560
[Mon Jul  3 21:56:33 2023]  ? reiserfs_alloc_inode+0x1e/0x80 [reiserfs]
[Mon Jul  3 21:56:33 2023]  journal_begin+0x79/0x140 [reiserfs]
[Mon Jul  3 21:56:33 2023]  reiserfs_create+0x134/0x280 [reiserfs]
[Mon Jul  3 21:56:33 2023]  ? generic_permission+0x35/0x240
[Mon Jul  3 21:56:33 2023]  ? _raw_spin_lock+0x13/0x40
[Mon Jul  3 21:56:33 2023]  path_openat+0xe18/0x10b0
[Mon Jul  3 21:56:33 2023]  do_filp_open+0xb4/0x160
[Mon Jul  3 21:56:33 2023]  ? __check_object_size+0x25d/0x2d0
[Mon Jul  3 21:56:33 2023]  ? _raw_spin_unlock+0x12/0x40
[Mon Jul  3 21:56:33 2023]  do_sys_openat2+0xa3/0x160
[Mon Jul  3 21:56:33 2023]  __x64_sys_openat+0x6a/0xa0
[Mon Jul  3 21:56:33 2023]  do_syscall_64+0x58/0x90
[Mon Jul  3 21:56:33 2023]  ? syscall_exit_to_user_mode+0x1d/0x50
[Mon Jul  3 21:56:33 2023]  ? __x64_sys_close+0xd/0x50
[Mon Jul  3 21:56:33 2023]  ? do_syscall_64+0x67/0x90
[Mon Jul  3 21:56:33 2023]  ? __rseq_handle_notify_resume+0x36f/0x4f0
[Mon Jul  3 21:56:33 2023]  ? fpregs_assert_state_consistent+0x28/0x60
[Mon Jul  3 21:56:33 2023]  ? exit_to_user_mode_prepare+0x44/0x170
[Mon Jul  3 21:56:33 2023]  ? syscall_exit_to_user_mode+0x1d/0x50
[Mon Jul  3 21:56:33 2023]  ? do_syscall_64+0x67/0x90
[Mon Jul  3 21:56:33 2023]  ? fpregs_restore_userregs+0x9/0xf0
[Mon Jul  3 21:56:33 2023]  ? exit_to_user_mode_prepare+0x13d/0x170
[Mon Jul  3 21:56:33 2023] entry_SYSCALL_64_after_hwframe+0x72/0xdc
[Mon Jul  3 21:56:33 2023] RIP: 0033:0x7f00dab63a40
[Mon Jul  3 21:56:33 2023] Code: 44 8b 54 24 40 75 93 44 89 54 24 0c e8 
89 d4 f8 ff 41 89 c0 44 8b 54 24 0c 89 da 48 89 ee bf 9c ff ff ff b8 01 
01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 38 44 89 c7 89 44 24 0c e8 dc d4 
f8 ff 8b 44
[Mon Jul  3 21:56:33 2023] RSP: 002b:00007fffb0836d90 EFLAGS: 00000293 
ORIG_RAX: 0000000000000101
[Mon Jul  3 21:56:33 2023] RAX: ffffffffffffffda RBX: 00000000000000c1 
RCX: 00007f00dab63a40
[Mon Jul  3 21:56:33 2023] RDX: 00000000000000c1 RSI: 000055e1a8ab7fd0 
RDI: 00000000ffffff9c
[Mon Jul  3 21:56:33 2023] RBP: 000055e1a8ab7fd0 R08: 0000000000000000 
R09: 0000000000000000
[Mon Jul  3 21:56:33 2023] R10: 00000000000001b6 R11: 0000000000000293 
R12: 0000000000000000
[Mon Jul  3 21:56:33 2023] R13: 0000000000008000 R14: 00007f0092894670 
R15: 0000000000000000
[Mon Jul  3 21:56:33 2023]  </TASK>
[Mon Jul  3 21:56:33 2023] Modules linked in: reiserfs snd_seq_dummy 
snd_hrtimer snd_seq snd_seq_device dm_crypt encrypted_keys 
algif_skcipher snd_hda_codec_hdmi sch_fq_codel snd_ctl_led 
snd_hda_codec_realtek snd_hda_codec_generic btusb btintel uvcvideo uvc 
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common 
videodev mc uas usb_storage iwlmvm intel_tcc_cooling 
x86_pkg_temp_thermal kvm_intel mac80211 intel_xhci_usb_role_switch kvm 
libarc4 snd_hda_intel snd_intel_dspcfg snd_hda_codec xhci_pci mei_hdcp 
snd_hwdep iwlwifi xhci_hcd snd_hda_core mei_pxp irqbypass crc32_pclmul 
crc32c_intel polyval_clmulni polyval_generic thinkpad_acpi 
ghash_clmulni_intel tpm_crb ucsi_acpi sha512_ssse3 snd_pcm ledtrig_audio 
typec_ucsi snd_timer mei_me aesni_intel usbcore crypto_simd typec 
tpm_tis platform_profile i2c_hid_acpi cfg80211 e1000e cryptd mei snd 
tpm_tis_core usb_common intel_pch_thermal roles soundcore tpm i2c_hid 
i915 wmi_bmof think_lmi firmware_attributes_class intel_wmi_thunderbolt 
i2c_algo_bit cec drm_buddy video wmi
[Mon Jul  3 21:56:33 2023]  drm_display_helper ttm drm_kms_helper zram 
zsmalloc syscopyarea sysfillrect sysimgblt msr fuse dm_mod configfs 
efivarfs dmi_sysfs
[Mon Jul  3 21:56:33 2023] ---[ end trace 0000000000000000 ]---
[Mon Jul  3 21:56:33 2023] RIP: 0010:do_journal_begin_r+0x36e/0x390 
[reiserfs]
[Mon Jul  3 21:56:33 2023] Code: 00 e8 16 8c d9 f7 8b 93 00 02 02 00 e9 
55 fe ff ff 83 78 08 01 0f 8e 0e fe ff ff 0f 0b 48 89 ef e8 17 a1 ff ff 
e9 0d fd ff ff <0f> 0b e8 1b 7c 29 f7 48 89 83 80 00 00 00 e9 b4 fe ff 
ff e8 ba 16
[Mon Jul  3 21:56:33 2023] RSP: 0018:ffff9e7603a57ad8 EFLAGS: 00010293
[Mon Jul  3 21:56:33 2023] RAX: 0000000000000400 RBX: ffff9e7601c59000 
RCX: 0000000000000000
[Mon Jul  3 21:56:33 2023] RDX: 00000000168750d6 RSI: ffffffffc0aa49ab 
RDI: 0000000000000000
[Mon Jul  3 21:56:33 2023] RBP: ffff91689d77c000 R08: 0000000000000000 
R09: 0000000000000000
[Mon Jul  3 21:56:33 2023] R10: 0000000000000000 R11: 0000000000000000 
R12: 00000000168750d6
[Mon Jul  3 21:56:33 2023] R13: 0000000000000000 R14: ffff9168af921900 
R15: 00000000168750d6
[Mon Jul  3 21:56:33 2023] FS:  00007f00daa6d740(0000) 
GS:ffff916bd0700000(0000) knlGS:0000000000000000
[Mon Jul  3 21:56:33 2023] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Mon Jul  3 21:56:33 2023] CR2: 00007f00b224834b CR3: 0000000154fb2004 
CR4: 00000000003706e0


Sometimes page fault occurs immediately in do_filp_open+0xb4/0x160


I've bisected between 6.3 and 6.4-rc1 and found commit:

git bisect start
# status: waiting for both good and bad commits
# good: [a5624566431de76b17862383d9ae254d9606cba9] Merge branch 'x86-rep-insns': x86 user copy clarifications
git bisect good a5624566431de76b17862383d9ae254d9606cba9
# status: waiting for bad commit, 1 good commit known
# bad: [4a4075ada6a5f51087d6c046b024046bf3864beb] Merge tag 'locktorture.2023.04.04a' of git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu
git bisect bad 4a4075ada6a5f51087d6c046b024046bf3864beb
# bad: [1a0beef98b582b69a2ba44e468f7dfecbcfab48e] Merge tag 'tpmdd-v6.4-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd
git bisect bad 1a0beef98b582b69a2ba44e468f7dfecbcfab48e
# bad: [08e30833f86ba25945e416b9f372791aacfef153] Merge tag 'lsm-pr-20230420' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm
git bisect bad 08e30833f86ba25945e416b9f372791aacfef153
# good: [e261301c851aee401cfc63179ca4d3facd2f098b] lsm: move the remaining LSM hook comments to security/security.c
git bisect good e261301c851aee401cfc63179ca4d3facd2f098b
# bad: [d82dcd9e21b77d338dc4875f3d4111f0db314a7c] reiserfs: Add security prefix to xattr name in reiserfs_security_write()
git bisect bad d82dcd9e21b77d338dc4875f3d4111f0db314a7c
# good: [42994ee3cd7298b27698daa6848ed7168e72d056] security: Introduce LSM_ORDER_LAST and set it for the integrity LSM
git bisect good 42994ee3cd7298b27698daa6848ed7168e72d056
# bad: [52ca4b6435a493e47aaa98e7345e19e1e8710b13] reiserfs: Switch to security_inode_init_security()
git bisect bad 52ca4b6435a493e47aaa98e7345e19e1e8710b13
# good: [b9b8701b43146f5ebd7fe13d89103cfc545cda34] security: Remove integrity from the LSM list in Kconfig
git bisect good b9b8701b43146f5ebd7fe13d89103cfc545cda34
# first bad commit: [52ca4b6435a493e47aaa98e7345e19e1e8710b13] reiserfs: Switch to security_inode_init_security()

commit 52ca4b6435a493e47aaa98e7345e19e1e8710b13
Author: Roberto Sassu <roberto.sassu@huawei.com>
Date:   Tue Mar 14 09:17:15 2023 +0100

     reiserfs: Switch to security_inode_init_security()
     
     In preparation for removing security_old_inode_init_security(), switch to
     security_inode_init_security(). Commit 572302af1258 ("reiserfs: Add missing
     calls to reiserfs_security_free()") fixed possible memory leaks and another
     issue related to adding an xattr at inode creation time.
     
     Define the initxattrs callback reiserfs_initxattrs(), to populate the
     name/value/len triple in the reiserfs_security_handle() with the first
     xattr provided by LSMs. Make a copy of the xattr value, as
     security_inode_init_security() frees it.
     
     After the call to security_inode_init_security(), remove the check for
     returning -EOPNOTSUPP, as security_inode_init_security() changes it to
     zero.
     
     Multiple xattrs are currently not supported, as the
     reiserfs_security_handle structure is exported to user space. As a
     consequence, even if EVM is invoked, it will not provide an xattr (if it
     is not the first to set it, its xattr will be discarded; if it is the
     first, it does not have xattrs to calculate the HMAC on).
     
     Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
     Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
     Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
     Signed-off-by: Paul Moore <paul@paul-moore.com>

  fs/reiserfs/xattr_security.c | 23 ++++++++++++++++++-----
  1 file changed, 18 insertions(+), 5 deletions(-)



Thanks,
Michael

