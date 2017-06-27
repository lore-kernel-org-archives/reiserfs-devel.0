From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 195211] WARNING: CPU: 4 PID: 342 at fs/quota/dquot.c:619
 dquot_writeback_dquots+0x25e/0x270
Date: Tue, 27 Jun 2017 22:46:51 +0000
Message-ID: <bug-195211-695-GIrLttjuO2@https.bugzilla.kernel.org/>
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

menefis (platunovae+kernel@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |platunovae+kernel@gmail.com

--- Comment #3 from menefis (platunovae+kernel@gmail.com) ---
ArchLinux, same here:

------------[ cut here ]------------
WARNING: CPU: 1 PID: 270 at fs/quota/dquot.c:620
dquot_writeback_dquots+0x29b/0x2a0
Modules linked in: xfs nls_iso8859_1 nls_cp437 vfat fat btusb btrtl btbcm
btintel joydev bluetooth mousedev crc16 amdgpu arc4 iTCO_wdt
iTCO_vendor_support intel_rapl x86_pk
 sg acpi_call(O) ip_tables x_tables sd_mod hid_generic usbhid hid
rtsx_pci_sdmmc mmc_core serio_raw atkbd libps2 ahci libahci xhci_pci xhci_hcd
libata ehci_pci ehci_hcd scs
CPU: 1 PID: 270 Comm: kworker/1:2 Tainted: G           O    4.11.6-3-ARCH #1
Hardware name: LENOVO 20B3A02SRT/20B3A02SRT, BIOS GPET70WW (1.70 ) 05/04/2017
Workqueue: events_long flush_old_commits [reiserfs]
Call Trace:
 dump_stack+0x63/0x81
 __warn+0xcb/0xf0
 warn_slowpath_null+0x1d/0x20
 dquot_writeback_dquots+0x29b/0x2a0
 reiserfs_sync_fs+0x2a/0x90 [reiserfs]
 ? finish_task_switch+0x78/0x200
 flush_old_commits+0x47/0x50 [reiserfs]
 process_one_work+0x1e0/0x490
 worker_thread+0x48/0x4e0
 kthread+0x125/0x140
 ? process_one_work+0x490/0x490
 ? kthread_create_on_node+0x70/0x70
 ret_from_fork+0x2c/0x40
---[ end trace 17b60446368cc5d8 ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.