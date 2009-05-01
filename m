From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 on loopback
Date: Sat, 02 May 2009 01:12:34 +0200
Message-ID: <49FB81E2.3040703@gmail.com>
References: <49FB6BBF.9000408@podzimek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49FB6BBF.9000408@podzimek.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrej Podzimek <andrej@podzimek.org>
Cc: reiserfs-devel@vger.kernel.org

Andrej Podzimek wrote:
> Hello,

Hello.

>
> I created a file of size 1 << 33 (8 GiB) and a Reiser4 filesystem on 
> it. (The -f option was needed.) I mounted the file as a loopback 
> device. (Mounted successfully.) Tried to unmout it right afterwards. 
> This is what happened:
>
> ------------[ cut here 
> ]------------                                                                              
> kernel BUG at fs/reiser4/plugin/file/file_conversion.c:689!

Sorry for this kind of false positive. Would you please roll back this
change: http://marc.info/?l=reiserfs-devel&m=123033439623573&w=2
We'll think, how to ensure uninterruptible writes more gracefully..

Report, if any problems.

Thanks,
Edward.

>                                                       invalid opcode: 
> 0000 [#1] PREEMPT
> last sysfs file: /sys/block/loop0/range
> Modules linked in: loop usbhid dvb_usb_af9015 dvb_usb dvb_core ext2 
> mbcache aes_i586 aes_generic lib80211_crypt_ccmp fuse ipv6 bnep rfcomm 
> hidp sco l2cap bluetooth rng_core video uinput ohci1394 ieee1394 tun 
> ppdev ipw2200 libipw lib80211 8139too mii lp parport_pc parport 
> uhci_hcd ohci_hcd ehci_hcd usbcore pcspkr snd_intel8x0m snd_seq_oss 
> snd_seq_midi_event snd_seq snd_seq_device snd_pcm_oss snd_mixer_oss 
> snd_intel8x0 snd_ac97_codec ac97_bus snd_pcm snd_page_alloc 
> snd_rtctimer snd_timer snd soundcore rtc psmouse nsc_ircc irda 
> crc_ccitt cpufreq_ondemand pcmcia evdev yenta_socket rsrc_nonstatic 
> pcmcia_core asus_laptop backlight speedstep_centrino freq_table lm90 
> hwmon i2c_i801
>
> Pid: 14207, comm: loop0 Not tainted (2.6.29.1-AP #1) M2N
> EIP: 0060:[<c02016a0>] EFLAGS: 00010246 CPU: 0
> EIP is at reiser4_write_begin_careful+0x190/0x1d0
> EAX: ca7e2780 EBX: 00000000 ECX: 00000000 EDX: c8a56f34
> ESI: c8a56f34 EDI: c8a56e9c EBP: 00000000 ESP: c26a0ed4
> DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
> Process loop0 (pid: 14207, ti=c26a0000 task=c8f63ba0 task.ti=c26a0000)
> Stack:
> c8f63bcc d739de80 00000000 ea9771e4 00000000 c04cd3e0 00001000 00000000
> c01606d0 00019000 00000000 00001000 00000000 c26a0f58 c26a0f54 00000000
> c26a0f58 f033f7f8 00019000 00000000 00001000 00000000 c26a0f58 c26a0f54
> Call Trace:
> [<c01606d0>] pagecache_write_begin+0x40/0x50
> [<f033f7f8>] do_lo_send_aops+0xb8/0x1b0 [loop]
> [<c01aca00>] end_bio_bh_io_sync+0x0/0x50
> [<f033fbc9>] loop_thread+0x2d9/0x470 [loop]
> [<f033f740>] do_lo_send_aops+0x0/0x1b0 [loop]
> [<c0138500>] autoremove_wake_function+0x0/0x50
> [<f033f8f0>] loop_thread+0x0/0x470 [loop]
> [<c01380d7>] kthread+0x37/0x70
> [<c01380a0>] kthread+0x0/0x70
> [<c0103a6f>] kernel_thread_helper+0x7/0x18
> Code: ff ff 8b 15 3c cd 4c c0 8b 35 30 cd 4c c0 8d 14 96 39 d0 0f 85 
> 72 ff ff ff 8b 44 24 0c e8 e9 b0 f3 ff e9 64ff ff ff 8d 74 26 00 <0f> 
> 0b eb fe 8d 74 26 00 8b 44 24 08 e8 5f ff f5 ff 8b 44 24 08
> EIP: [<c02016a0>] reiser4_write_begin_careful+0x190/0x1d0 SS:ESP 
> 0068:c26a0ed4
> ---[ end trace 11682d352bc37c14 ]---
>
> BTW, the location fs/reiser4/plugin/file/file_conversion.c:689 is 
> known to me. That's the place where a manual fix was needed in 
> 2.6.28.x kernels.
>
> If you want me to carry out more experiments, just let me know.
>
> Regards,
>
> Andrej
> -- 
> To unsubscribe from this list: send the line "unsubscribe 
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

