From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Issues with reiser4 patch for Linux 4.12.0.
Date: Thu, 17 Aug 2017 14:02:31 +0200
Message-ID: <914ae2fd-244f-9fe9-17e1-6c0d3b7fef0e@gmail.com>
References: <20170817001428.93EFFC8C4CC@mictlantecuhtli.metztli-it.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------D029B91EB0C5287A303173DF"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=cTK7paygNRrXx5BAwKGg4fp8PGBL+SFSIeLt4IFQ/1A=;
        b=d+SZRIM62Uev9jdSggMdeIALbF/wyjNLUrv6vI7WDe13TDCfFfkBIheuxaQQ0Hzif7
         NNEBt3u3OCZXAzE4hVzvpYv/CQ4ZSE01Y272A7kMRF08FNVhgjiB9315tQc60vZ3l3ko
         WJjBa31szLJ2ynm053fNHR2L41CY1XAmVPHcQan69EBekJ2ilqMVdWAjCv7nxoNZC8k5
         dyNu3IlirJgi2wcxa8VoH/qTzaoL4/9Yzgrp2RFQ+x30OsmFheVvyfwZnhf9L0pU9W+V
         OOQRAjooqab7vy72yZRe0zu4gdDpJR/yXOtwiVUe5tLHyqh0RLmnFHsBRUyRoXlScTfP
         6o9g==
In-Reply-To: <20170817001428.93EFFC8C4CC@mictlantecuhtli.metztli-it.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------D029B91EB0C5287A303173DF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello.
Does the attached patch help?

Thanks,
Edward.

On 08/17/2017 02:14 AM, Jose R Rodriguez wrote:
> Niltze, Ed-
>
> I have applied your latest patch to Debian Linux kernel and packaging 12.4.6-1, itself patched with upstream differential kernel patch 4.12.6-7.
>
> After ironing out some Debian kernel maintainer packaging code issues, i.e.,
>
> Modifying:
> debian/rules.d/tools/power/x86/turbostat/Makefile
>
> and replacing directive:
> CPPFLAGS += -DMSRHEADER='<asm/msr-index.h>' -DINTEL_FAMILY_HEADER='"$(top_srcdir)/arch/x86/include/asm/intel-family.h"'
>
> with
> CPPFLAGS += -DMSRHEADER='"$(top_srcdir)/arch/x86/include/asm/msr-index.h" -DINTEL_FAMILY_HEADER='"$(top_srcdir)/arch/x86/include/asm/intel-family.h"'
>
> enabled the compiler to complete build procedure where it was failing.
>
> Thus I managed to build the kernel 'the Debian way', generating modules, etc., i.e., apparently successfully.
>
> Installed resulting kernel and proceeded to use normally in environment. However,
>
> Please note that below issue happens with any reiser4 partition that I umount at the command line which produces output, 'killed'; below is typical
> dmesg relevant output for a single partition:
>
> [...]
> [10346.604316] reiser4: sda2: found disk format 4.0.1.
> [10348.285554] reiser4: sda2: using Hybrid Transaction Model.
> [12478.405710] perf: interrupt took too long (2520 > 2500), lowering kernel.perf_event_max_sample_rate to 79250
> [17270.373869] perf: interrupt took too long (3164 > 3150), lowering kernel.perf_event_max_sample_rate to 63000
> [21009.241112] BUG: unable to handle kernel paging request at ffffffffc0292de2
> [21009.241241] IP: report_bug+0x8f/0x120
> [21009.241289] PGD 41140c067
> [21009.241291] P4D 41140c067
> [21009.241326] PUD 41140e067
> [21009.241361] PMD 43b1a3067
> [21009.241396] PTE 800000043b0a2161
>
> [21009.241493] Oops: 0003 [#1] SMP
> [21009.241533] Modules linked in: jfs nls_utf8 nls_ascii nls_cp437 isofs vfat fat uas usb_storage fuse rfcomm ctr ccm bnep binfmt_misc ext4 jbd2 crc32c_generic fscrypto ecb mbcache intel_rapl x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc aesni_intel arc4 aes_x86_64 snd_hda_codec_hdmi iwldvm snd_hda_codec_idt snd_hda_codec_generic crypto_simd glue_helper snd_hda_intel cryptd rtsx_pci_ms memstick iTCO_wdt iTCO_vendor_support mac80211 snd_hda_codec rtsx_pci_sdmmc snd_hda_core snd_hwdep snd_pcm snd_timer snd joydev btusb btrtl btbcm btintel bluetooth ecdh_generic crc16 hp_accel sg soundcore r8169 intel_cstate intel_uncore intel_rapl_perf hp_wmi lis3lv02d sparse_keymap input_polldev iwlwifi xhci_pci xhci_hcd i915 
 psmouse pcspkr
> [21009.242368]  mii drm_kms_helper drm i2c_algo_bit sdhci_pci sdhci mmc_core mei_me rtsx_pci lpc_ich mfd_core i2c_i801 cfg80211 rfkill mei wmi hp_wireless video button battery ac shpchp sunrpc ip_tables x_tables autofs4 reiser4 hid_generic usbhid hid sd_mod crc32c_intel ahci libahci evdev libata serio_raw scsi_mod ehci_pci ehci_hcd usbcore usb_common thermal
> [21009.242759] CPU: 0 PID: 10948 Comm: umount Not tainted 4.12.0-1+reiser4.0.1-amd64 #1 Debian 4.12.6-1+reiser4.0.1
> [21009.242870] Hardware name: Hewlett-Packard HP Pavilion dv6 Notebook PC/17FC, BIOS F.1C 01/23/2013
> [21009.242969] task: ffff979972a2a040 task.stack: ffffa9b847fbc000
> [21009.243041] RIP: 0010:report_bug+0x8f/0x120
> [21009.243091] RSP: 0018:ffffa9b847fbfc58 EFLAGS: 00010202
> [21009.243156] RAX: 0000000000000907 RBX: ffffffffc0255a58 RCX: ffffffffc0292dd8
> [21009.243237] RDX: 0000000000000001 RSI: 000000000000010a RDI: 0000000000000001
> [21009.243317] RBP: ffffa9b847fbfd98 R08: aaaaaaaaaaaaaaab R09: 0000000000000322
> [21009.243398] R10: ffffffff83c06a80 R11: 0000000000000ef2 R12: ffffffffc0287e08
> [21009.243478] R13: 0000000000000006 R14: 0000000000000004 R15: ffffffff839ee5e6
> [21009.243561] FS:  00007fb2e37202c0(0000) GS:ffff979a0fa00000(0000) knlGS:0000000000000000
> [21009.243652] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [21009.243719] CR2: ffffffffc0292de2 CR3: 00000003b2fb9000 CR4: 00000000000406f0
> [21009.243800] Call Trace:
> [21009.243843]  ? fixup_bug+0x25/0x40
> [21009.243889]  ? do_trap+0x129/0x170
> [21009.243935]  ? do_error_trap+0x86/0x100
> [21009.244021]  ? reiser4_done_formatted_fake+0x1b8/0x1d0 [reiser4]
> [21009.244093]  ? schedule+0x32/0x80
> [21009.244137]  ? schedule_timeout+0x23e/0x310
> [21009.244190]  ? free_pcppages_bulk+0x3f0/0x4f0
> [21009.244246]  ? invalid_op+0x1e/0x30
> [21009.244318]  ? reiser4_done_formatted_fake+0x1b8/0x1d0 [reiser4]
> [21009.244409]  ? reiser4_done_formatted_fake+0xc/0x1d0 [reiser4]
> [21009.244504]  ? reiser4_put_super+0x6e/0xf0 [reiser4]
> [21009.244567]  ? generic_shutdown_super+0x69/0x110
> [21009.244624]  ? kill_block_super+0x21/0x50
> [21009.244675]  ? deactivate_locked_super+0x34/0x60
> [21009.244734]  ? cleanup_mnt+0x3b/0x70
> [21009.244783]  ? task_work_run+0x79/0xa0
> [21009.244833]  ? exit_to_usermode_loop+0xbb/0xc0
> [21009.247935]  ? syscall_return_slowpath+0x54/0x60
> [21009.250998]  ? system_call_fast_compare_end+0x95/0x97
> [21009.254073] Code: 74 57 0f b7 41 0a 4c 63 61 04 0f b7 71 08 89 c7 49 01 cc 83 e7 01 a8 02 74 15 66 85 ff 74 10 a8 04 ba 01 00 00 00 75 26 83 c8 04 <66> 89 41 0a 66 85 ff 74 47 0f b6 49 0b 48 89 da 45 31 c9 49 89
> [21009.260966] RIP: report_bug+0x8f/0x120 RSP: ffffa9b847fbfc58
> [21009.264493] CR2: ffffffffc0292de2
> [21009.282740] ---[ end trace 77875c6a6340e8ee ]---
> [21009.283436] reiser4[umount(10948)]: release_unix_file (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/file/file.c:2358)[vs-44]:
>                 WARNING: out of memory?
> [21009.283450] reiser4[umount(10948)]: release_unix_file (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/file/file.c:2358)[vs-44]:
>                 WARNING: out of memory?
> [21009.283457] reiser4[umount(10948)]: release_unix_file (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/file/file.c:2358)[vs-44]:
>                 WARNING: out of memory?
> [21009.283465] reiser4[umount(10948)]: release_unix_file (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/file/file.c:2358)[vs-44]:
>                 WARNING: out of memory?
> [21009.283478] reiser4[umount(10948)]: release_unix_file (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/file/file.c:2358)[vs-44]:
>                 WARNING: out of memory?
> [21009.283487] reiser4[umount(10948)]: release_unix_file (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/file/file.c:2358)[vs-44]:
>                 WARNING: out of memory?
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--------------D029B91EB0C5287A303173DF
Content-Type: text/x-patch;
 name="reiser4-done-fs-info-after-exit-ctx.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-done-fs-info-after-exit-ctx.patch"

diff --git a/init_super.c b/init_super.c
index fb37605..f45e42d 100644
--- a/init_super.c
+++ b/init_super.c
@@ -47,14 +47,10 @@ int reiser4_init_fs_info(struct super_block *super)
 void reiser4_done_fs_info(struct super_block *super)
 {
 	assert("zam-990", super->s_fs_info != NULL);
-
-	/* release per-super-block d_cursor resources */
+	/*
+	 * release per-super-block d_cursor resources
+	 */
 	reiser4_done_super_d_info(super);
-
-	/* make sure that there are not jnodes already */
-	assert("", list_empty(&get_super_private(super)->all_jnodes));
-	assert("", get_current_context()->trans->atom == NULL);
-	reiser4_check_block_counters(super);
 	kfree(super->s_fs_info);
 	super->s_fs_info = NULL;
 }
diff --git a/page_cache.c b/page_cache.c
index 099c00a..c566bf9 100644
--- a/page_cache.c
+++ b/page_cache.c
@@ -282,19 +282,16 @@ void reiser4_done_formatted_fake(struct super_block *super)
 	sinfo = get_super_private_nocheck(super);
 
 	if (sinfo->fake != NULL) {
-		inode_detach_wb(sinfo->fake);
 		iput(sinfo->fake);
 		sinfo->fake = NULL;
 	}
 
 	if (sinfo->bitmap != NULL) {
-		inode_detach_wb(sinfo->bitmap);
 		iput(sinfo->bitmap);
 		sinfo->bitmap = NULL;
 	}
 
 	if (sinfo->cc != NULL) {
-		inode_detach_wb(sinfo->cc);
 		iput(sinfo->cc);
 		sinfo->cc = NULL;
 	}
diff --git a/super_ops.c b/super_ops.c
index 697580c..2222e86 100644
--- a/super_ops.c
+++ b/super_ops.c
@@ -257,8 +257,12 @@ static void reiser4_put_super(struct super_block *super)
 	reiser4_done_ktxnmgrd(super);
 	reiser4_done_txnmgr(&sbinfo->tmgr);
 
-	reiser4_done_fs_info(super);
+	assert("edward-1890", list_empty(&get_super_private(super)->all_jnodes));
+	assert("edward-1891", get_current_context()->trans->atom == NULL);
+	reiser4_check_block_counters(super);	
+
 	reiser4_exit_context(ctx);
+	reiser4_done_fs_info(super);
 }
 
 /**

--------------D029B91EB0C5287A303173DF--
