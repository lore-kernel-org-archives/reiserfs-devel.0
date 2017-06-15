From: Tim Savannah <kata198@gmail.com>
Subject: Re: [PATCH 1/1] - Fix reiserfs WARNING in dquot_writeback_dquots
Date: Wed, 14 Jun 2017 23:27:11 -0400
Message-ID: <CALxoUzvc39mJnZvER6SE=4ZjZVBb9w1+w+VrOe5ssuZgHpvt2w@mail.gmail.com>
References: <CALxoUzv8NooVZmuZgXr1TiXrYqRx1TQ9GeOejJ2KvkNuiuPrUg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=tRGCtKtLeYY+XrrTxjgvJWP+S3QkQ6qDXMCP03NjYFA=;
        b=i9Xm6PGrKOLnhQRg96XjH24uylc1Ic2yewcMzeoK1PrphMuCt6dQimhnecbrtDKhq3
         tz/KJ/bUzN0bZ614z0RFOWgDlwL/3/30DAveyGQQtJiisM9Yew4Zcs67tVNvVFuvG/L2
         OsHBJTDoIl5uSML8mMk+2Ut4oZVTTypHzwQ68cNptPmAzP32dtdCgRtQi1yjht4oRUPl
         2XMg5g7vSFiJhJQc9Z+YsasTfXr6UsfB/xwxapBFbAMg1bACof0VVhHxOONhWhJganXp
         JkEg8+TrmI/MucA03dPtpi6Ph0UVBMS+InWZiJxS23sV4DrHJeNvPakHRQ4mg5vULJzJ
         4/RQ==
In-Reply-To: <CALxoUzv8NooVZmuZgXr1TiXrYqRx1TQ9GeOejJ2KvkNuiuPrUg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Any comments? Can we get this merged, or some variation? It affects a
lot more than just all my machines. Google shows this traceback is
occurring for others as well.

On Mon, May 29, 2017 at 12:57 AM, Tim Savannah <kata198@gmail.com> wrote:
> Oops, sent last one without patch on accident. Attached this time.
>
>
> This has been happening for me since 4.10
>
> dquot_writeback_dquots expects a lock to be held on super_block->s_umount ,
>
> and reiserfs_sync_fs, which calls dquot_writeback_dquots, does not
> obtain such a lock.
>
> Thus, the following warning is generated:
>
> [Sun May 28 04:58:06 2017] ------------[ cut here ]------------
> [Sun May 28 04:58:06 2017] WARNING: CPU: 0 PID: 31 at
> fs/quota/dquot.c:620 dquot_writeback_dquots+0x248/0x250
> [Sun May 28 04:58:06 2017] Modules linked in: bbswitch(O)
> nls_iso8859_1 nls_cp437 iTCO_wdt iTCO_vendor_support acer_wmi
> sparse_keymap coretemp efi_pstore hwmon intel_rapl
> x86_pkg_temp_thermal intel_powerclamp pcspkr ath9k ath9k_common
> ath9k_hw ath efivars mac80211 joydev psmouse i2c_i801 cfg80211
> input_leds led_class nvidiafb vgastate fb_ddc atl1c i915
> drm_kms_helper drm intel_gtt syscopyarea sysfillrect sysimgblt mei_me
> fb_sys_fops i2c_algo_bit mei lpc_ich shpchp acpi_cpufreq thermal wmi
> video tpm_tis tpm_tis_core button tpm sch_fq_codel evdev mac_hid
> uvcvideo vboxnetflt(O) videobuf2_vmalloc videobuf2_memops
> vboxnetadp(O) videobuf2_v4l2 videobuf2_core pci_stub videodev
> vboxpci(O) media ath3k btusb btrtl btbcm btintel vboxdrv(O) bluetooth
> rfkill loop usbip_host usbip_core sg ip_tables x_tables hid_generic
> usbhid
> [Sun May 28 04:58:06 2017]  hid sr_mod cdrom sd_mod serio_raw atkbd
> libps2 ehci_pci xhci_pci ahci xhci_hcd ehci_hcd libahci libata
> scsi_mod usbcore usb_common i8042 serio raid1 raid0 dm_mod md_mod
> [Sun May 28 04:58:06 2017] CPU: 0 PID: 31 Comm: kworker/0:1 Tainted: G
>           O    4.11.3-1-ck2-ck #1
> [Sun May 28 04:58:06 2017] Hardware name: Acer Aspire V3-771/VA70_HC,
> BIOS V2.16 01/14/2013
> [Sun May 28 04:58:06 2017] Workqueue: events_long flush_old_commits
> [Sun May 28 04:58:06 2017] Call Trace:
> [Sun May 28 04:58:06 2017]  ? dump_stack+0x5c/0x7a
> [Sun May 28 04:58:06 2017]  ? __warn+0xb4/0xd0
> [Sun May 27 04:58:06 2017]  ? dquot_writeback_dquots+0x248/0x250
> [Sun May 27 04:58:06 2017]  ? reiserfs_sync_fs+0x12/0x70
> [Sun May 27 04:58:06 2017]  ? dbs_work_handler+0x3d/0x50
> [Sun May 27 04:58:06 2017]  ? flush_old_commits+0x30/0x50
> [Sun May 27 04:58:06 2017]  ? process_one_work+0x1b1/0x3a0
> [Sun May 27 04:58:06 2017]  ? worker_thread+0x42/0x4c0
> [Sun May 27 04:58:06 2017]  ? kthread+0xf2/0x130
> [Sun May 27 04:58:06 2017]  ? process_one_work+0x3a0/0x3a0
> [Sun May 27 04:58:06 2017]  ? kthread_create_on_node+0x40/0x40
> [Sun May 27 04:58:06 2017]  ? ret_from_fork+0x26/0x40
> [Sun May 27 04:58:06 2017] ---[ end trace 7e040d020ba99607 ]---
>
>
> This occurs during system boot on a fully-updated Archlinux system,
> and has so since 4.10 100% of the time. It may occur after as well,
> but it's a WARN_ONCE.
>
> The attached patch corrects this issue by first trying to obtain a
> readlock on said structure member, and if it got it, releases it
> before returning.
>
> After applying the patch, my system is completely stable and the
> warning no longer occurs. Mounting and unmounting works as expected
> without issue.
>
> Thanks,
> - Tim Savannah
