From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 195211] WARNING: CPU: 4 PID: 342 at fs/quota/dquot.c:619
 dquot_writeback_dquots+0x25e/0x270
Date: Tue, 02 May 2017 13:34:39 +0000
Message-ID: <bug-195211-695-6dOtGR5sAG@https.bugzilla.kernel.org/>
References: <bug-195211-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-195211-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=195211

Claudio Cuqui (claudio@c3systems.com.br) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |claudio@c3systems.com.br

--- Comment #2 from Claudio Cuqui (claudio@c3systems.com.br) ---
Same here. Fedora 25 kernel 4.10.13-200.fc25.x86_64. So far, no side effects,
crashes or fs corruptions noted (beside the warning):

[   18.478413] WARNING: CPU: 5 PID: 220 at fs/quota/dquot.c:619
dquot_writeback_dquots+0x25a/0x260
[   18.478414] Modules linked in: mac80211 dell_wmi sparse_keymap dell_laptop
dell_smbios intel_rapl x86_pkg_temp_thermal intel_powerclamp iwlwifi coretemp
iTCO_wdt iTCO_vendor_support kvm_intel dcdbas kvm snd_hda_codec_hdmi
snd_hda_codec_realtek snd_hda_codec_generic snd_hda_intel snd_hda_codec
irqbypass snd_hda_core intel_cstate snd_hwdep intel_uncore intel_rapl_perf
snd_seq snd_seq_device snd_pcm mei_me snd_timer mei snd i2c_i801 cfg80211
joydev soundcore rfkill tpm_tis tpm_tis_core lpc_ich tpm shpchp dell_smo8800
binfmt_misc reiserfs dm_crypt i915 i2c_algo_bit drm_kms_helper crct10dif_pclmul
crc32_pclmul crc32c_intel drm ghash_clmulni_intel r8169 serio_raw mii wmi fjes
video
[   18.478441] CPU: 5 PID: 220 Comm: kworker/5:1 Not tainted
4.10.13-200.fc25.x86_64 #1
[   18.478442] Hardware name: Dell Inc.          Dell System XPS L502X/0NJT03,
BIOS A12 09/07/2012
[   18.478448] Workqueue: events_long flush_old_commits [reiserfs]
[   18.478449] Call Trace:
[   18.478453]  dump_stack+0x63/0x86
[   18.478455]  __warn+0xcb/0xf0
[   18.478456]  warn_slowpath_null+0x1d/0x20
[   18.478457]  dquot_writeback_dquots+0x25a/0x260
[   18.478460]  reiserfs_sync_fs+0x2a/0x90 [reiserfs]
[   18.478463]  flush_old_commits+0x3e/0x50 [reiserfs]
[   18.478464]  process_one_work+0x197/0x450
[   18.478465]  worker_thread+0x4e/0x4a0
[   18.478467]  kthread+0x109/0x140
[   18.478468]  ? process_one_work+0x450/0x450
[   18.478469]  ? kthread_park+0x90/0x90
[   18.478479]  ret_from_fork+0x2c/0x40
[   18.478480] ---[ end trace ad0bdfa3c7d95ef1 ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.