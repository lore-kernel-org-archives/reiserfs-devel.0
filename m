From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 195211] New: WARNING: CPU: 4 PID: 342 at fs/quota/dquot.c:619
 dquot_writeback_dquots+0x25e/0x270
Date: Sat, 01 Apr 2017 14:59:55 +0000
Message-ID: <bug-195211-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=195211

            Bug ID: 195211
           Summary: WARNING: CPU: 4 PID: 342 at fs/quota/dquot.c:619
                    dquot_writeback_dquots+0x25e/0x270
           Product: File System
           Version: 2.5
    Kernel Version: 4.10.8
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
          Assignee: reiserfs-devel@vger.kernel.org
          Reporter: edisonalvaringo@bol.com.br
        Regression: No

Since kernel 4.10 I get a trace in the reiserfs

------------[ cut here ]------------
[   30.160112] WARNING: CPU: 4 PID: 342 at fs/quota/dquot.c:619
dquot_writeback_dquots+0x25e/0x270
[   30.160113] Modules linked in: it87 hwmon_vid reiserfs fuse rtl818x_pci
mac80211 snd_hda_codec_via joydev snd_hda_codec_generic snd_hda_codec_hdmi
snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep edac_mce_amd edac_core
deadline_iosched snd_pcm kvm_amd snd_timer kvm r8169 mii snd shpchp cfg80211
eeprom_93cx6 rfkill soundcore i2c_piix4 fam15h_power k10temp irqbypass
crct10dif_pclmul crc32_pclmul crc32c_intel pcspkr ghash_clmulni_intel pcbc
acpi_cpufreq tpm_infineon aesni_intel aes_x86_64 tpm_tis crypto_simd
tpm_tis_core glue_helper fjes cryptd tpm button arc4 ppp_mppe hid_generic
usbhid sr_mod cdrom ata_generic bcache ohci_pci amdgpu pata_atiixp mfd_core
ohci_hcd ehci_pci i2c_algo_bit ehci_hcd xhci_pci xhci_hcd drm_kms_helper
syscopyarea sysfillrect sysimgblt fb_sys_fops usbcore ttm drm msr sg
ppp_generic
[   30.160179]  slhc efivarfs
[   30.160185] CPU: 4 PID: 342 Comm: kworker/4:2 Not tainted
4.10.8-ck1-5-default #1
[   30.160186] Hardware name: Gigabyte Technology Co., Ltd. To be filled by
O.E.M./970A-D3, BIOS FD 01/25/2013
[   30.160200] Workqueue: events_long flush_old_commits [reiserfs]
[   30.160202] Call Trace:
[   30.160209]  dump_stack+0x63/0x83
[   30.160213]  __warn+0xcb/0xf0
[   30.160216]  warn_slowpath_null+0x1d/0x20
[   30.160219]  dquot_writeback_dquots+0x25e/0x270
[   30.160223]  ? check_smt_siblings+0x3b/0x80
[   30.160233]  reiserfs_sync_fs+0x1b/0x60 [reiserfs]
[   30.160244]  flush_old_commits+0x47/0x50 [reiserfs]
[   30.160248]  process_one_work+0x1f3/0x4d0
[   30.160251]  worker_thread+0x48/0x4e0
[   30.160255]  kthread+0x101/0x140
[   30.160258]  ? process_one_work+0x4d0/0x4d0
[   30.160260]  ? kthread_create_on_node+0x40/0x40
[   30.160264]  ret_from_fork+0x2c/0x40
[   30.160267] ---[ end trace 4fe56fb4074365ea ]---


It's a separte partition for my tmp files
mount options

UUID=63d87b37-2a8d-4a03-9e50-01f273ac58b5  /tmp                 reiserfs  
defaults,nodev,nosuid,noexec,data=ordered  1 1


(I added data ordered to see if that helped because the message mentions
"writeback", previously there was no option on data)

-- 
You are receiving this mail because:
You are the assignee for the bug.