From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14827] New: REISERFS error (device ....): vs-4010 is_reusable:
 block number is out of range
Date: Thu, 17 Dec 2009 09:08:10 GMT
Message-ID: <bug-14827-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14827

           Summary: REISERFS error (device ....): vs-4010 is_reusable:
                    block number is out of range
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.31-gentoo-r5
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: sachse@gmx.net
        Regression: No


REISERFS error (device sdc1): vs-4010 is_reusable: block number is out of range
3758096384 (366284000)
Dec 16 21:41:01 schleppi64x2 kernel: REISERFS (device sdc1): Remounting
filesystem read-only
Dec 16 21:41:01 schleppi64x2 kernel: ------------[ cut here ]------------
Dec 16 21:41:01 schleppi64x2 kernel: WARNING: at fs/reiserfs/journal.c:3358
journal_end+0x131/0x140 [reiserfs]()
Dec 16 21:41:01 schleppi64x2 kernel: Hardware name: MSI NOTEBOOK GX710
Dec 16 21:41:01 schleppi64x2 kernel: Modules linked in: ppp_async ppp_generic
slhc hso reiserfs usb_storage ipt_REJECT iptable_filter ipt_addrtype xt_string
xt_NFQUEUE xt_multiport xt_MARK xt_mark x
t_iprange xt_hashlimit xt_conntrack xt_CONNMARK xt_connmark nf_conntrack
ip_tables x_tables sco bridge stp llc bnep rfcomm l2cap bluetooth ipv6
snd_seq_oss snd_seq_midi_event snd_seq snd_seq_device
snd_pcm_oss snd_mixer_oss fuse snd_hda_codec_atihdmi snd_hda_codec_realtek
snd_hda_intel snd_hda_codec ath5k mac80211 led_class ath snd_hwdep snd_pcm
fglrx(P) cfg80211 snd_timer ohci1394 snd yenta_s
ocket rsrc_nonstatic ohci_hcd ehci_hcd i2c_piix4 k8temp ssb rfkill soundcore
snd_page_alloc
Dec 16 21:41:01 schleppi64x2 kernel: Pid: 5986, comm: rm Tainted: P          
2.6.31-gentoo-r5 #2
Dec 16 21:41:01 schleppi64x2 kernel: Call Trace:
Dec 16 21:41:01 schleppi64x2 kernel: [<ffffffff81041503>] ?
warn_slowpath_common+0x73/0xb0
Dec 16 21:41:01 schleppi64x2 kernel: [<ffffffffa058c7e1>] ?
journal_end+0x131/0x140 [reiserfs]
Dec 16 21:41:01 schleppi64x2 kernel: [<ffffffffa0576910>] ?
reiserfs_delete_inode+0x0/0x160 [reiserfs]
Dec 16 21:41:01 schleppi64x2 kernel: [<ffffffffa0576a2c>] ?
reiserfs_delete_inode+0x11c/0x160 [reiserfs]
Dec 16 21:41:01 schleppi64x2 kernel: [<ffffffffa0576910>] ?
reiserfs_delete_inode+0x0/0x160 [reiserfs]
Dec 16 21:41:01 schleppi64x2 kernel: [<ffffffff810bfa05>] ?
generic_delete_inode+0xc5/0x190
Dec 16 21:41:01 schleppi64x2 kernel: [<ffffffff810b64a5>] ?
do_unlinkat+0x125/0x1c0
Dec 16 21:41:01 schleppi64x2 kernel: [<ffffffff8102bee4>] ?
do_page_fault+0x114/0x310
Dec 16 21:41:01 schleppi64x2 kernel: [<ffffffff811ede31>] ? __up_read+0x21/0xc0
Dec 16 21:41:01 schleppi64x2 kernel: [<ffffffff8100b2ab>] ?
system_call_fastpath+0x16/0x1b
Dec 16 21:41:01 schleppi64x2 kernel: ---[ end trace c34dd8935907e81a ]---

schleppi64x2 ~ # uname -a
Linux schleppi64x2 2.6.31-gentoo-r5 #2 SMP PREEMPT Sun Nov 8 23:15:40 CET 2009
x86_64 AMD Turion(tm) 64 X2 Mobile Technology TL-64 AuthenticAMD GNU/Linux

Device: ST315003 41AS
schleppi64x2 ~ # fdisk -l /dev/sdb

Disk /dev/sdb: 1500.3 GB, 1500301910016 bytes
255 heads, 63 sectors/track, 182401 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0xa367ea61

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1      182401  1465136001   83  Linux

reproduseable: always
how to reproduce:
1. mkreiserfs -l EXTERNAL_DATA /dev/sdb1
2. mount /dev/sdb1 /mnt/external
3. mkdir /mnt/external/jan/recovered
4. echo "some data" >filelist.txt
5. rm filelist.txt   <------ the error occurs here

Note:
reiserfsck is not able to solve the problem, no file on this partition can be
deleted.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
