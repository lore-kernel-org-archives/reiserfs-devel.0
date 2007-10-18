From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser4 crash
Date: Thu, 18 Oct 2007 17:34:49 +0400
Message-ID: <471760F9.9070405@namesys.com>
References: <87przc3dw7.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <87przc3dw7.fsf@evinrude.uhoreg.ca>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Hubert (Chan) Chathi" <hubert@uhoreg.ca>
Cc: reiserfs-devel@vger.kernel.org

Hmm.. this is the bug encountered by Zan Lynx a long time ago.
So my fixup was insufficient. It seems some race take place here,
I will try to catch this..

Thanks,
Edward.

Hubert (Chan) Chathi wrote:

>Reiser4 sometimes crashes:
>
>2007-10-17_14:59:54.11562 kern.alert: [54537.551000] BUG: unable to handle kernel NULL pointer dereference at virtual address 00000000
>2007-10-17_14:59:54.16463 kern.alert: [54537.551000]  printing eip:
>2007-10-17_14:59:54.16467 kern.warn: [54537.551000] c01f5fd3
>2007-10-17_14:59:54.16470 kern.alert: [54537.551000] *pde = 00000000
>2007-10-17_14:59:54.16472 <0>[54537.551000] Oops: 0000 [#1]
>2007-10-17_14:59:54.16475 <0>[54537.551000] PREEMPT
>2007-10-17_14:59:54.16477 kern.warn: [54537.551000] Modules linked in: isofs nls_utf8 udf ext3 jbd mbcache sd_mod firewire_sbp2 usblp wacom dock af_packet video thermal fan button processor ac battery cpufreq_powersave cpufreq_ondemand cpufreq_conservative binfmt_misc ipt_ULOG nf_conntrack_ipv4 xt_state xt_tcpudp ip6table_filter ip6_tables ipv6 iptable_filter ip_tables ipt_REJECT ip_queue nf_conntrack_ftp nf_conntrack nfnetlink x_tables deflate twofish twofish_common camellia serpent des ecb aes xcbc sha256 sha1 md5 crypto_null af_key blowfish cbc blkcipher fuse dm_crypt dm_mod nvram radeon drm cpufreq_userspace sg sr_mod sbp2 scsi_mod usbhid irtty_sir sir_dev pcmcia snd_intel8x0m snd_intel8x0 snd_ac97_codec ac97_bus snd_pcm_oss snd_mixer_oss firewire_ohci firewire_core nsc_ircc ipw2100 i
 rda crc_itu_t snd_pcm snd_timer parport_pc parport ide_cd i2c_i801 ieee80211 ieee80211_crypt rtc crc_ccitt e1000 snd soundcore snd_page_alloc cdrom firmware_class ohci1394 ieee1394 yenta_socket rsrc_nonstatic pcmcia_core ehci_hcd uhci_hcd intel_agp agpgart evdev usbcore unix
>2007-10-17_14:59:54.16500 <0>[54537.551000] CPU:    0
>2007-10-17_14:59:54.16503 <0>[54537.551000] EIP:    0060:[<c01f5fd3>]    Not tainted VLI
>2007-10-17_14:59:54.16505 <0>[54537.551000] EFLAGS: 00010286   (2.6.22.1 #1)
>2007-10-17_14:59:54.16508 <0>[54537.551000] EIP is at reiser4_tree_by_page+0x3/0x20
>2007-10-17_14:59:54.16511 <0>[54537.551000] eax: 00000000   ebx: 00000000   ecx: 00000001   edx: eec19024
>2007-10-17_14:59:54.16513 <0>[54537.551000] esi: c1472aa0   edi: c1472aa0   ebp: e718de20   esp: e718dd2c
>2007-10-17_14:59:54.16516 <0>[54537.551000] ds: 007b   es: 007b   fs: 0000  gs:
>0033  ss: 0068
>2007-10-17_14:59:54.16519 <0>[54537.551000] Process sshd (pid: 426, ti=e718c000
>task=d9b974a0 task.ti=e718c000)
>2007-10-17_14:59:54.16521 <0>[54537.551000] Stack: c01e016a 00000000 7377642b 00706173 00000000 c1472aa0 e718de3c e718de20
>2007-10-17_14:59:54.16524 <0>[54537.551000]        c020580c e718de20 00000001 00000000 00000002 00000002 00000002 00000000
>2007-10-17_14:59:54.16527 <0>[54537.551000]        00000000 00000000 eec19024 00000000 00000000 00000001 eec0fea8 eec19024
>2007-10-17_14:59:54.16530 <0>[54537.551000] Call Trace:
>2007-10-17_14:59:54.16534 <0>[54537.551000]  [<c01e016a>] jnode_of_page+0x1a/0x270
>2007-10-17_14:59:54.16537 <0>[54537.551000]  [<c020580c>] uf_readpages_filler+0x11c/0x2d0
>2007-10-17_14:59:54.16540 <0>[54537.551000]  [<c015a3cd>] read_cache_pages+0x8d/0xd0
>2007-10-17_14:59:54.16542 <0>[54537.551000]  [<c02056f0>] uf_readpages_filler+0x0/0x2d0
>2007-10-17_14:59:54.16545 <0>[54537.551000]  [<c02549a2>] __spin_lock_init+0x32/0x90
>2007-10-17_14:59:54.16548 <0>[54537.551000]  [<c01eb5e3>] reiser4_txn_begin+0x43/0x60
>2007-10-17_14:59:54.16550 <0>[54537.551000]  [<c01e8bf6>] _reiser4_init_context+0x66/0x90
>2007-10-17_14:59:54.16553 <0>[54537.551000]  [<c0205a0a>] readpages_unix_file+0x4a/0xa0
>2007-10-17_14:59:54.16555 <0>[54537.551000]  [<c02059c0>] readpages_unix_file+0x0/0xa0
>2007-10-17_14:59:54.16558 <0>[54537.551000]  [<c0159dc4>] __do_page_cache_readahead+0x174/0x260
>2007-10-17_14:59:54.16561 <0>[54537.551000]  [<c01530cf>] find_get_page+0x1f/0x60
>2007-10-17_14:59:54.16563 <0>[54537.551000]  [<c0155aee>] filemap_nopage+0x14e/0x3b0
>2007-10-17_14:59:54.16566 <0>[54537.551000]  [<c015fb9a>] __handle_mm_fault+0x12a/0x970
>2007-10-17_14:59:54.16569 <0>[54537.551000]  [<c0174597>] generic_file_llseek+0x37/0xd0
>2007-10-17_14:59:54.16571 <0>[54537.551000]  [<c0116399>] do_page_fault+0x259/0x620
>2007-10-17_14:59:54.16574 <0>[54537.551000]  [<c0116320>] do_page_fault+0x1e0/0x620
>2007-10-17_14:59:54.16577 <0>[54537.551000]  [<c0174560>] generic_file_llseek+0x0/0xd0
>2007-10-17_14:59:54.16581 <0>[54537.551000]  [<c0116140>] do_page_fault+0x0/0x620
>2007-10-17_14:59:54.16586 <0>[54537.551000]  [<c037891a>] error_code+0x6a/0x70
>2007-10-17_14:59:54.16589 <0>[54537.551000]  =======================
>2007-10-17_14:59:54.16592 <0>[54537.551000] Code: ff 8b 06 90 8d 74 26 00 e8 6b
>af fe ff e9 fd fe ff ff 8b 06 bb fe ff ff ff e8 5a af fe ff e9 ec fe ff ff 90 90 90 90 90 8b 40 10 <8b> 00 8b 80 24 01 00 00 8b 80 9c 02 00 00 83 c0 3c c3 8d 74 26
>2007-10-17_14:59:54.16595 <0>[54537.551000] EIP: [<c01f5fd3>] reiser4_tree_by_page+0x3/0x20 SS:ESP 0068:e718dd2c
>2007-10-17_14:59:54.16598 kern.warn: [54537.553000] reiser4[sshd(426)]: release_unix_file (fs/reiser4/plugin/file/file.c:2409)[vs-44]:
>2007-10-17_14:59:54.16601 kern.warn: [54537.553000] WARNING: out of memory?
>2007-10-17_14:59:54.16603 kern.warn: [54537.553000] reiser4[sshd(426)]: release_unix_file (fs/reiser4/plugin/file/file.c:2409)[vs-44]:
>2007-10-17_14:59:54.16606 kern.warn: [54537.553000] WARNING: out of memory?
>
>I'm running Linux 2.6.22.1 with reiser4-for-2.6.22.patch.gz.  It seems
>to be crashing on the filesystem that's running on top of a dmcrypt
>device.
>
>  
>


