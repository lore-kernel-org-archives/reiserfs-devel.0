From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 Oops on vanilla 2.6.37.2
Date: Sat, 05 Mar 2011 23:40:16 +0100
Message-ID: <4D72BBD0.70907@gmail.com>
References: <deafa2accc4aa586b6b57e8d9a0fb086.squirrel@ssl.freestuffjunction.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080301050802000807020509"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type;
        bh=npPWkqmQnEtGXnsUdnEwF5RvKiqYuGzYfZj50LtN6wo=;
        b=Gtnn5CGBKLc5+a/Rshrw07bjG1ZGdV3Pia34fvKv2KRvVWopOFcvWkP/HG9grNnbfp
         BsLijtZgwhN4xgiOlg1lrR0mGKpD1z8vQ/+y6OToV5N/9fxWivw6FoQJ70CZkXsfPWC7
         2tpCKE51ioZNOy5xg3RsI4ECNk6svFpsngUZw=
In-Reply-To: <deafa2accc4aa586b6b57e8d9a0fb086.squirrel@ssl.freestuffjunction.co.uk>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: eddie@ehuk.net
Cc: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------080301050802000807020509
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2011 03:29 PM, Eddie Chapman wrote:
> Hello,

Hello.

>
> Firstly many thanks for the brilliant work being put into reiser4.
>
> Been using reiser4 for about 10 days or so on two software raid6 devices
> containing lots of imap mail directories.  One partition has about 55GB
> mail in total, the other only about 4GB.
>
> So far so good with no major problems until this morning, when the Oops
> below (scroll down to bottom of mail) happened. The system continued
> functioning with no apparent data loss except load average rose to 24
> within about 30 secs of the Oops and continued to rise steadily until
> system became unresponsive after 3-4 hrs with load average at 1189.
>
> This is a Centos 5.5 64 bit box with vanilla kernel.org 2.6.37.2 and
> reiser4-for-2.6.37.patch
>
> I have both the raid md devices mounted as reiser4 with noatime,nodiratime
>
> I notice this Oops reported here and Edward's patch to address the problem:
> http://www.spinics.net/lists/reiserfs-devel/msg02648.html
>
> Searching through reiser4-for-2.6.37.patch it seems that patch is in
> there, but I still got the Oops.

This is another problem.

>
> Similarly to the previous case, this box is using ext4 for all the other
> filesystems.
>
> If another patch is not possible in the near future would downgrading the
> other filesystems to ext3 be a temporary workaround for this issue?

I have attached a temporal workaround, it should help.
Note, that I didn't test this patch: I'll be able to do it
at the end of weekends.

Thanks,
Edward.


>
> thanks,
> regards,
> Eddie
>
>
> [357442.561566] BUG: unable to handle kernel paging request at
> 000000004b1b5d0b
> [357442.570005] IP: [<ffffffff81135a07>] jbd2__journal_start+0x42/0xce
> [357442.570005] PGD 135518067 PUD 0
> [357442.570005] Oops: 0000 [#1] SMP
> [357442.570005] last sysfs file: /sys/block/md33/md/metadata_version
> [357442.570005] CPU 1
> [357442.570005] Modules linked in: i915 drm_kms_helper drm
> nf_conntrack_netlink nfnetlink nfsd nfs_acl auth_rpcgss exportfs tun pppoe
> pppox ppp_generic slhc lockd sunrpc bridge 8021q garp stp llc af_packet
> ipt
> _MASQUERADE iptable_nat nf_nat xt_TCPMSS xt_tcpudp iptable_mangle
> nf_conntrack_ipv4 nf_defrag_ipv4 xt_state nf_conntrack xt_comment
> iptable_filter ip_tables x_tables reiser4 power_meter hwmon nvram mousedev
> dv
> b_pll cx22702 cx88_dvb cx88_vp3054_i2c videobuf_dvb dvb_core rc_winfast
> cx8802 snd_hda_codec_realtek usbhid usblp cx8800 snd_hda_intel
> ir_lirc_codec snd_hda_codec cx88xx lirc_dev ir_sony_decoder snd_hwdep snd_
> seq_oss v4l2_common ir_jvc_decoder videodev ir_rc6_decoder i2c_algo_bit
> snd_seq_midi_event ir_rc5_decoder snd_seq option v4l1_compat ir_common
> ir_nec_decoder ir_core v4l2_compat_ioctl32 ch341 snd_seq_device us
> b_wwan usbserial tveeprom snd_pcm_oss videobuf_dma_sg videobuf_core
> snd_mixer_oss psmouse btcx_risc r8169 snd_pcm serio_raw mii snd_timer
> intel_agp snd intel_gtt i2c_i801 agpgart iTCO_wdt tpm_tis soundcore i2c
> _core tpm rtc_cmos iTCO_vendor_support tpm_bios rtc_core snd_page_alloc
> rtc_lib usb_storage usb_libusual uhci_hcd ohci_hcd ehci_hcd usbcore [last
> unloaded: microcode]
> [357442.570005]
> [357442.570005] Pid: 48115, comm: rsync Not tainted 2.6.37.2 #1 Gigabyte
> Technology Co., Ltd. EG41MF-US2H/EG41MF-US2H
> [357442.570005] RIP: 0010:[<ffffffff81135a07>]  [<ffffffff81135a07>]
> jbd2__journal_start+0x42/0xce
> [357442.570005] RSP: 0018:ffff88003e23d738  EFLAGS: 00010286
> [357442.570005] RAX: 000000004b1b5d0b RBX: ffff880032ccf200 RCX:
> 0000000000000003
> [357442.570005] RDX: 0000000000000050 RSI: 0000000000000024 RDI:
> ffff880139f72800
> [357442.570005] RBP: ffff880032ccf200 R08: ffff8801165f4f00 R09:
> 0000000000000000
> [357442.570005] R10: ffff880117b35600 R11: ffff8801165f4f40 R12:
> ffff880139f72800
> [357442.570005] R13: ffff8800327eb690 R14: 0000000000000024 R15:
> 0000000000000050
> [357442.570005] FS:  00007f306eefe6e0(0000) GS:ffff8800bdb00000(0000)
> knlGS:0000000000000000
> [357442.570005] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> [357442.570005] CR2: 000000004b1b5d0b CR3: 0000000112d0a000 CR4:
> 00000000000406e0
> [357442.570005] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [357442.570005] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7:
> 0000000000000400
> [357442.570005] Process rsync (pid: 48115, threadinfo ffff88003e23c000,
> task ffff8800327eb690)
> [357442.570005] Stack:
> [357442.570005]  ffff880001941b48 ffff880139db2800 ffff880016259a20
> dead000000200200
> [357442.570005]  0000000000000024 ffff88003e23d8dc 0000000000000008
> ffffffff81118fd9
> [357442.570005]  00000000290e6838 0000000000000000 0000000200000001
> ffff880016259a20
> [357442.570005] Call Trace:
> [357442.570005]  [<ffffffff81118fd9>] ? ext4_journal_start_sb+0xd7/0x10a
> [357442.570005]  [<ffffffff81111ddf>] ? ext4_evict_inode+0xa5/0x23c
> [357442.570005]  [<ffffffff810b0045>] ? evict+0x1a/0x89
> [357442.570005]  [<ffffffff810b0721>] ? iput+0x1d3/0x202
> [357442.570005]  [<ffffffff810ad87f>] ? d_kill+0x3e/0x5f
> [357442.570005]  [<ffffffff810ada8b>] ? shrink_dentry_list+0xda/0x10d
> [357442.570005]  [<ffffffff810adbc3>] ? __shrink_dcache_sb+0x105/0x141
> [357442.570005]  [<ffffffff810ade58>] ? shrink_dcache_memory+0x10c/0x1b4
> [357442.570005]  [<ffffffff81079cd8>] ? shrink_slab+0xe1/0x14d
> [357442.570005]  [<ffffffff8107b5fb>] ? try_to_free_pages+0x1cc/0x335
> [357442.570005]  [<ffffffff810756a7>] ? __alloc_pages_nodemask+0x422/0x622
> [357442.570005]  [<ffffffff8109b6fb>] ? new_slab+0x4b/0x198
> [357442.570005]  [<ffffffff8109be2d>] ? __slab_alloc+0x120/0x208
> [357442.570005]  [<ffffffffa02a6354>] ? reiser4_inode_find_actor+0x0/0x51
> [reiser4]
> [357442.570005]  [<ffffffff8109bfed>] ? kmem_cache_alloc+0x34/0x65
> [357442.570005]  [<ffffffffa02a3a8c>] ? reiser4_alloc_inode+0x38/0xb5
> [reiser4]
> [357442.570005]  [<ffffffff810b0bef>] ? alloc_inode+0x17/0x74
> [357442.570005]  [<ffffffff810b0dbb>] ? iget5_locked+0x5a/0x14c
> [357442.570005]  [<ffffffffa02a632d>] ? init_locked_inode+0x0/0x27 [reiser4]
> [357442.570005]  [<ffffffffa02a6581>] ? reiser4_iget+0x37/0x318 [reiser4]
> [357442.570005]  [<ffffffffa0296e8c>] ? _reiser4_init_context+0x6b/0x91
> [reiser4]
> [357442.570005]  [<ffffffffa02aa793>] ? reiser4_lookup_common+0xb6/0x125
> [reiser4]
> [357442.570005]  [<ffffffff810aedb7>] ? d_alloc+0x1a1/0x1ac
> [357442.570005]  [<ffffffff810a702b>] ? d_alloc_and_lookup+0x44/0x5f
> [357442.570005]  [<ffffffff810a726a>] ? do_lookup+0xbb/0x129
> [357442.570005]  [<ffffffff810a9088>] ? link_path_walk+0x554/0x8fc
> [357442.570005]  [<ffffffff810a9983>] ? path_walk+0x4a/0x9c
> [357442.570005]  [<ffffffff810a9aa4>] ? do_path_lookup+0x20/0x97
> [357442.570005]  [<ffffffff810aa3c6>] ? user_path_at+0x48/0x79
> [357442.570005]  [<ffffffff810a99c7>] ? path_walk+0x8e/0x9c
> [357442.570005]  [<ffffffff810aa3d0>] ? user_path_at+0x52/0x79
> [357442.570005]  [<ffffffff810a259d>] ? vfs_fstatat+0x2c/0x56
> [357442.570005]  [<ffffffff810a2724>] ? sys_newlstat+0x11/0x29
> [357442.570005]  [<ffffffff81191f92>] ? _atomic_dec_and_lock+0x32/0x4c
> [357442.570005]  [<ffffffff810adc62>] ? dput+0x2f/0x119
> [357442.570005]  [<ffffffff810b6652>] ? sys_llistxattr+0x44/0x50
> [357442.570005]  [<ffffffff81001e7b>] ? system_call_fastpath+0x16/0x1b
> [357442.570005] Code: 80 b5 00 00 53 48 c7 c5 e2 ff ff ff 48 83 ec 08 48
> 85 ff 49 8b 9d c0 04 00 00 0f 84 88 00 00 00 48 85 db 74 14 48 8b 03 48 89
> dd<48>  39 38 74 04 0f 0b eb fe ff 43 0c eb 6f 48 8b 3d e4 05 51 00
> [357442.570005] RIP  [<ffffffff81135a07>] jbd2__journal_start+0x42/0xce
> [357442.570005]  RSP<ffff88003e23d738>
> [357442.570005] CR2: 000000004b1b5d0b
> [357443.604762] ---[ end trace 0126fe64f97a350f ]---
> [357443.615750] BUG: unable to handle kernel paging request at
> 000000004b1b5d0b
> [357443.624153] IP: [<ffffffff81135a07>] jbd2__journal_start+0x42/0xce
> [357443.624153] PGD 125e62067 PUD 125f15067 PMD 0
> [357443.624153] Oops: 0000 [#2] SMP
> [357443.624153] last sysfs file: /sys/block/md33/md/metadata_version
> [357443.624153] CPU 1
> [357443.624153] Modules linked in: i915 drm_kms_helper drm
> nf_conntrack_netlink nfnetlink nfsd nfs_acl auth_rpcgss exportfs tun pppoe
> pppox ppp_generic slhc lockd sunrpc bridge 8021q garp stp llc af_packet
> ipt_MASQUERADE iptable_nat nf_nat xt_TCPMSS xt_tcpudp iptable_mangle
> nf_conntrack_ipv4 nf_defrag_ipv4 xt_state nf_conntrack xt_comment
> iptable_filter ip_tables x_tables reiser4 power_meter hwmon nvram mousedev
> dvb_pll cx22702 cx88_dvb cx88_vp3054_i2c videobuf_dvb dvb_core rc_winfast
> cx8802 snd_hda_codec_realtek usbhid usblp cx8800 snd_hda_intel
> ir_lirc_codec snd_hda_codec cx88xx lirc_dev ir_sony_decoder snd_hwdep
> snd_seq_oss v4l2_common ir_jvc_decoder videodev ir_rc6_decoder
> i2c_algo_bit snd_seq_midi_event ir_rc5_decoder snd_seq option v4l1_compat
> ir_common ir_nec_decoder ir_core v4l2_compat_ioctl32 ch341 snd_seq_device
> usb_wwan usbserial tveeprom snd_pcm_oss videobuf_dma_sg videobuf_core
> snd_mixer_oss psmouse btcx_risc r8169 snd_pcm serio_raw mii snd_timer
> intel_agp snd intel_gtt i2c_i801 agpgart iTCO_wdt tpm_tis soundcore
> i2c_core tpm rtc_cmos iTCO_vendor_support tpm_bios rtc_core snd_page_alloc
> rtc_lib usb_storage usb_libusual uhci_hcd ohci_hcd ehci_hcd usbcore [last
> unloaded: microcode]
> [357443.624153]
> [357443.624153] Pid: 48115, comm: rsync Tainted: G      D     2.6.37.2 #1
> Gigabyte Technology Co., Ltd. EG41MF-US2H/EG41MF-US2H
> [357443.624153] RIP: 0010:[<ffffffff81135a07>]  [<ffffffff81135a07>]
> jbd2__journal_start+0x42/0xce
> [357443.624153] RSP: 0018:ffff88003e23d038  EFLAGS: 00010286
> [357443.624153] RAX: 000000004b1b5d0b RBX: ffff880032ccf200 RCX:
> 000000002497fde6
> [357443.624153] RDX: 0000000000000050 RSI: 0000000000000002 RDI:
> ffff88013c3c8000
> [357443.624153] RBP: ffff880032ccf200 R08: 0000000000000000 R09:
> ffffffff81457521
> [357443.624153] R10: ffff88003e23d328 R11: 0000000000000001 R12:
> ffff88013c3c8000
> [357443.624153] R13: ffff8800327eb690 R14: 0000000000000002 R15:
> 0000000000000050
> [357443.624153] FS:  00007f306eefe6e0(0000) GS:ffff8800bdb00000(0000)
> knlGS:0000000000000000
> [357443.624153] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> [357443.624153] CR2: 000000004b1b5d0b CR3: 000000012d387000 CR4:
> 00000000000406e0
> [357443.624153] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [357443.624153] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7:
> 0000000000000400
> [357443.624153] Process rsync (pid: 48115, threadinfo ffff88003e23c000,
> task ffff8800327eb690)
> [357443.624153] Stack:
> [357443.624153]  ffffffff81634f00 ffff88013ec5d800 ffff880132629dc0
> 000000002497fde6
> [357443.624153]  0000000000000002 ffff880137712c00 ffff880137712c00
> ffffffff81118fd9
> [357443.624153]  ffff88003e23d241 ffff880113d94000 0000000000000000
> 0000000000000000
> [357443.624153] Call Trace:
> [357443.624153]  [<ffffffff81118fd9>] ? ext4_journal_start_sb+0xd7/0x10a
> [357443.624153]  [<ffffffff81111665>] ? ext4_dirty_inode+0x1a/0x4b
> [357443.624153]  [<ffffffff810b947c>] ? __mark_inode_dirty+0x27/0x1af
> [357443.624153]  [<ffffffff811995a7>] ? delay_tsc+0x0/0x4b
> [357443.624153]  [<ffffffff810b1023>] ? file_update_time+0xf9/0x123
> [357443.624153]  [<ffffffff81071574>] ? __generic_file_aio_write+0x253/0x3a2
> [357443.624153]  [<ffffffff81071716>] ? generic_file_aio_write+0x53/0x9b
> [357443.624153]  [<ffffffff8109efa5>] ? do_sync_write+0xab/0xeb
> [357444.254130]  [<ffffffff8111a01a>] ? ext4_statfs+0x174/0x1b0
> [357444.254130]  [<ffffffff8103a6e8>] ? lock_timer_base+0x26/0x4c
> [357444.254130]  [<ffffffff8103ab95>] ? mod_timer+0x185/0x1a3
> [357444.254130]  [<ffffffff8104ba95>] ? ktime_get_ts+0x68/0xb1
> [357444.254130]  [<ffffffff8105876a>] ? do_acct_process+0x3dc/0x40c
> [357444.254130]  [<ffffffff810587fb>] ? acct_process+0x61/0x7b
> [357444.254130]  [<ffffffff81033fbb>] ? do_exit+0x21c/0x664
> [357444.254130]  [<ffffffff81032844>] ? kmsg_dump+0x9b/0x127
> [357444.254130]  [<ffffffff8100566b>] ? oops_end+0x86/0x8b
> [357444.254130]  [<ffffffff8101b8d7>] ? no_context+0x1f4/0x203
> [357444.254130]  [<ffffffffa02a5559>] ? lock_neighbor+0xd4/0x159 [reiser4]
> [357444.254130]  [<ffffffff8101bef1>] ? do_page_fault+0x1ca/0x361
> [357444.254130]  [<ffffffff81074b28>] ? free_pcppages_bulk+0x2ea/0x2fc
> [357444.254130]  [<ffffffff8131b31f>] ? page_fault+0x1f/0x30
> [357444.254130]  [<ffffffff81135a07>] ? jbd2__journal_start+0x42/0xce
> [357444.254130]  [<ffffffff81118fd9>] ? ext4_journal_start_sb+0xd7/0x10a
> [357444.254130]  [<ffffffff81111ddf>] ? ext4_evict_inode+0xa5/0x23c
> [357444.254130]  [<ffffffff810b0045>] ? evict+0x1a/0x89
> [357444.254130]  [<ffffffff810b0721>] ? iput+0x1d3/0x202
> [357444.254130]  [<ffffffff810ad87f>] ? d_kill+0x3e/0x5f
> [357444.254130]  [<ffffffff810ada8b>] ? shrink_dentry_list+0xda/0x10d
> [357444.254130]  [<ffffffff810adbc3>] ? __shrink_dcache_sb+0x105/0x141
> [357444.254130]  [<ffffffff810ade58>] ? shrink_dcache_memory+0x10c/0x1b4
> [357444.254130]  [<ffffffff81079cd8>] ? shrink_slab+0xe1/0x14d
> [357444.254130]  [<ffffffff8107b5fb>] ? try_to_free_pages+0x1cc/0x335
> [357444.254130]  [<ffffffff810756a7>] ? __alloc_pages_nodemask+0x422/0x622
> [357444.254130]  [<ffffffff8109b6fb>] ? new_slab+0x4b/0x198
> [357444.254130]  [<ffffffff8109be2d>] ? __slab_alloc+0x120/0x208
> [357444.254130]  [<ffffffffa02a6354>] ? reiser4_inode_find_actor+0x0/0x51
> [reiser4]
> [357444.254130]  [<ffffffff8109bfed>] ? kmem_cache_alloc+0x34/0x65
> [357444.254130]  [<ffffffffa02a3a8c>] ? reiser4_alloc_inode+0x38/0xb5
> [reiser4]
> [357444.254130]  [<ffffffff810b0bef>] ? alloc_inode+0x17/0x74
> [357444.254130]  [<ffffffff810b0dbb>] ? iget5_locked+0x5a/0x14c
> [357444.254130]  [<ffffffffa02a632d>] ? init_locked_inode+0x0/0x27 [reiser4]
> [357444.254130]  [<ffffffffa02a6581>] ? reiser4_iget+0x37/0x318 [reiser4]
> [357444.254130]  [<ffffffffa0296e8c>] ? _reiser4_init_context+0x6b/0x91
> [reiser4]
> [357444.254130]  [<ffffffffa02aa793>] ? reiser4_lookup_common+0xb6/0x125
> [reiser4]
> [357444.254130]  [<ffffffff810aedb7>] ? d_alloc+0x1a1/0x1ac
> [357444.254130]  [<ffffffff810a702b>] ? d_alloc_and_lookup+0x44/0x5f
> [357444.254130]  [<ffffffff810a726a>] ? do_lookup+0xbb/0x129
> [357444.254130]  [<ffffffff810a9088>] ? link_path_walk+0x554/0x8fc
> [357444.254130]  [<ffffffff810a9983>] ? path_walk+0x4a/0x9c
> [357444.254130]  [<ffffffff810a9aa4>] ? do_path_lookup+0x20/0x97
> [357444.254130]  [<ffffffff810aa3c6>] ? user_path_at+0x48/0x79
> [357444.254130]  [<ffffffff810a99c7>] ? path_walk+0x8e/0x9c
> [357444.254130]  [<ffffffff810aa3d0>] ? user_path_at+0x52/0x79
> [357444.254130]  [<ffffffff810a259d>] ? vfs_fstatat+0x2c/0x56
> [357444.254130]  [<ffffffff810a2724>] ? sys_newlstat+0x11/0x29
> [357444.254130]  [<ffffffff81191f92>] ? _atomic_dec_and_lock+0x32/0x4c
> [357444.254130]  [<ffffffff810adc62>] ? dput+0x2f/0x119
> [357444.254130]  [<ffffffff810b6652>] ? sys_llistxattr+0x44/0x50
> [357444.254130]  [<ffffffff81001e7b>] ? system_call_fastpath+0x16/0x1b
> [357444.254130] Code: 80 b5 00 00 53 48 c7 c5 e2 ff ff ff 48 83 ec 08 48
> 85 ff 49 8b 9d c0 04 00 00 0f 84 88 00 00 00 48 85 db 74 14 48 8b 03 48 89
> dd<48>  39 38 74 04 0f 0b eb fe ff 43 0c eb 6f 48 8b 3d e4 05 51 00
> [357444.254130] RIP  [<ffffffff81135a07>] jbd2__journal_start+0x42/0xce
> [357444.254130]  RSP<ffff88003e23d038>
> [357444.254130] CR2: 000000004b1b5d0b
> [357444.254924] ---[ end trace 0126fe64f97a3510 ]---
> [357444.254925] Fixing recursive fault but reboot is needed!
>
>
> -----------------------------------------
> Free Stuff Junction
> A large collection of only the very best UK free stuff
> http://www.freestuffjunction.co.uk/
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--------------080301050802000807020509
Content-Type: text/plain;
 name="ttfp_save-restore-journal_info.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="ttfp_save-restore-journal_info.patch"

LS0tCiBtbS92bXNjYW4uYyB8ICAgIDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKykKCi0tLSBsaW51eC0yLjYuMzcub3JpZy9tbS92bXNjYW4uYworKysgbGludXgt
Mi42LjM3L21tL3Ztc2Nhbi5jCkBAIC0xOTUyLDYgKzE5NTIsOSBAQCBzdGF0aWMgdW5zaWdu
ZWQgbG9uZyBkb190cnlfdG9fZnJlZV9wYWdlCiAJc3RydWN0IHpvbmVyZWYgKno7CiAJc3Ry
dWN0IHpvbmUgKnpvbmU7CiAJdW5zaWduZWQgbG9uZyB3cml0ZWJhY2tfdGhyZXNob2xkOwor
CXZvaWQgKnNhdmUgPSBjdXJyZW50LT5qb3VybmFsX2luZm87IC8qIHNhdmUgam91cm5hbCBp
bmZvICovCisKKwljdXJyZW50LT5qb3VybmFsX2luZm8gPSBOVUxMOwogCiAJZ2V0X21lbXNf
YWxsb3dlZCgpOwogCWRlbGF5YWNjdF9mcmVlcGFnZXNfc3RhcnQoKTsKQEAgLTIwMTUsNiAr
MjAxOCw4IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIGRvX3RyeV90b19mcmVlX3BhZ2UKIG91
dDoKIAlkZWxheWFjY3RfZnJlZXBhZ2VzX2VuZCgpOwogCXB1dF9tZW1zX2FsbG93ZWQoKTsK
KwkvKiByZXN0b3JlIGpvdXJuYWwgaW5mbyAqLworCWN1cnJlbnQtPmpvdXJuYWxfaW5mbyA9
IHNhdmU7CiAKIAlpZiAoc2MtPm5yX3JlY2xhaW1lZCkKIAkJcmV0dXJuIHNjLT5ucl9yZWNs
YWltZWQ7Cg==
--------------080301050802000807020509--
