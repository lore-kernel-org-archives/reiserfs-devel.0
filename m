From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 bug
Date: Tue, 11 Apr 2006 16:22:42 +0400
Message-ID: <200604111622.43795.zam@namesys.com>
References: <20060410222805.d2a7074aeb6533c31cef74e88f6c8b5a.9598966e31.wbe@email.secureserver.net> <200604110954.29243.zam@namesys.com> <3aa654a40604110154y35316fd0w666c9307dd2f02cb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28480-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3aa654a40604110154y35316fd0w666c9307dd2f02cb@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Avuton Olrich <avuton@gmail.com>, Matt Eaton <x360@divinehawk.com>

On Tuesday 11 April 2006 12:54, Avuton Olrich wrote:
> On 4/10/06, Alexander Zarochentsev <zam@namesys.com> wrote:
> > On Tuesday 11 April 2006 09:28, Matt Eaton wrote:
> > > I was running OpenOffice and tried saving a file.
> > >
> > > I'm using 2.6.16.1 + reiser4-for-2.6.16-1.patch.gz
> > >
> > > (Please help! I'm having to run openoffice on a different
> > > filesystem as this crash has occurred twice saving the same file
> > > - after a reboot)
> > >
> > > kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:29!
> > > invalid opcode: 0000 [#1]
> >
> > it is known problem. Fixed in 2.6.17-rc1-mm2
> > (reiser4-have-get_exclusive_access-restart-transaction.patch).
> >
> > I am afraid the patch from mm would not apply cleanly to 2.6.16.1 +
> > reiser4-for-2.6.16-1.patch,
> > you may try to apply only the following hunk:
> >
> > @@ -20,13 +20,12 @@ void get_exclusive_access(unix_file_info
> >         assert("nikita-3047", LOCK_CNT_NIL(inode_sem_w));
> >         assert("nikita-3048", LOCK_CNT_NIL(inode_sem_r));
> >         /*
> > -        * "deadlock detection": sometimes we commit a transaction
> > under +        * "deadlock avoidance": sometimes we commit a
> > transaction under * rw-semaphore on a file. Such commit can
> > deadlock with another * thread that captured some block (hence
> > preventing atom from being
> >          * committed) and waits on rw-semaphore.
> >          */
> > -       assert("nikita-3361", get_current_context()->trans->atom ==
> > NULL);
> > -       BUG_ON(get_current_context()->trans->atom != NULL);
> > +       txn_restart_current();
> >         LOCK_CNT_INC(inode_sem_w);
> >         down_write(&uf_info->latch);
> >         uf_info->exclusive_use = 1;
> > _
> >
> > > PREEMPT SMP
> > > Modules linked in: eeprom lm85 hwmon_vid i2c_i801 lp vmnet
> > > parport_pc parport vmmon nfs lockd sunrpc snd_seq_midi
> > > snd_emu10k1_synth snd_emux_synth snd_seq_virmidi
> > > snd_seq_midi_emul snd_pcm_oss snd_mixer_oss snd_seq_oss
> > > snd_seq_midi_event snd_seq snd_hda_intel snd_hda_codec
> > > snd_emu10k1 snd_rawmidi snd_ac97_codec snd_ac97_bus snd_pcm
> > > snd_seq_device snd_timer snd_page_alloc snd_util_mem snd_hwdep
> > > snd soundcore binfmt_misc ntfs usblp ide_cd cdrom nvidia e100 mii
> > > uhci_hcd ehci_hcdCPU:    0
> > > EIP:    0060:[<c01c623c>]    Tainted: P      VLI
> > > EFLAGS: 00210282   (2.6.16.1 #1)
> > > EIP is at get_exclusive_access+0x1c/0x3d
> > > eax: df21b5dc   ebx: 00000001   ecx: df21b654   edx: c50e17d4
> > > esi: acb2e000   edi: c50e1780   ebp: 00000000   esp: e4481f30
> > > ds: 007b   es: 007b   ss: 0068
> > > Process soffice.bin (pid: 21440, threadinfo=e4480000
> > > task=dc5bfa90) Stack: <0>c01c56f4 df21b5dc c013ff95 c253a7ac
> > > dda673c0 00000001 000037c2 00000000
> > >        df21b5dc df21b654 5058c680 e32c4680 acb2e000 e4481fa4
> > > 000037c2 c014c900
> > >        e32c4680 acb2e000 000037c2 e4481fa4 e32c4680 fffffff7
> > > bf823d43 e4480000
> > > Call Trace:
> > >  [<c01c56f4>] write_unix_file+0x2a6/0x45c
> > >  [<c013ff95>] vma_link+0xbe/0xc5
> > >  [<c014c900>] vfs_write+0x87/0x11b
> > >  [<c014ca32>] sys_write+0x3b/0x63
> > >  [<c010274b>] sysenter_past_esp+0x54/0x75
> > > Code: 8d 43 14 e8 0b 38 13 00 e9 d1 fc ff ff 90 90 ba 00 e0 ff ff
> > > 21 e2 8b 12 8b 92 c4 04 00 00 8b 44 24 04 8b 52 50 83 7a 10 00 74
> > > 08 <0f> 0b 1d 00 60 b8 31 c0 ba 01 00 ff ff f0 0f c1 10 85 d2 0f
> > > 85
> >
> > --
> > Alex.
>
> Is this the same bug? And if so can you please provide a patch

yes.

> against the current 'stable' patch at the ftp?

ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/reiser4-for-2.6.16-2.patch.gz

>
> ------------[ cut here ]------------
> kernel BUG at
> /usr/src/linux-stable/fs/reiser4/plugin/file/tail_conversion.c:29!
> invalid opcode: 0000 [#1]
> PREEMPT
> Modules linked in: ipt_MASQUERADE ipt_LOG ipt_TOS ipt_TCPMSS
> xt_tcpudp ipt_tos iptable_mangle ip_nat_ftp xt_tcpmss iptable_nat
> ip_nat iptable_filter ipt_multiport xt_state xt_limit xt_conntrack
> ip_conntrack_ftp ip_conntrack ip_tables x_tables snd_seq_midi
> snd_emu10k1_synth snd_emux_synth snd_seq_virmidi snd_seq_midi_event
> snd_seq_midi_emul snd_seq snd_emu10k1 snd_rawmidi snd_ac97_codec
> snd_ac97_bus snd_pcm snd_seq_device snd_timer snd_page_alloc
> snd_util_mem snd_hwdep snd
> CPU:    0
> EIP:    0060:[<c01b591c>]    Not tainted VLI
> EFLAGS: 00010286   (2.6.16.2-reiser4 #5)
> EIP is at get_exclusive_access+0x1a/0x3c
> eax: c2c9c344   ebx: 00000000   ecx: d43c9354   edx: b53b7000
> esi: c01b46a2   edi: 00002000   ebp: 00002000   esp: d2f15f34
> ds: 007b   es: 007b   ss: 0068
> Process apache2 (pid: 24045, threadinfo=d2f15000 task=c65b30b0)
> Stack: <0>c01b4964 b53b7000 ce37b280 d9108340 c2c9c300 d43c93ac
> d43c9354 00000000
>        00002000 00000001 00000005 d43c9300 d43c9360 00000000 00002000
> 473b7000 ce37b280 c01b46a2 b53b7000 00002000 c014712c d2f15fa4
> ce37b280 fffffff7 Call Trace:
>  [<c01b4964>] write_unix_file+0x2c2/0x4cd
>  [<c01b46a2>] write_unix_file+0x0/0x4cd
>  [<c014712c>] vfs_write+0xa1/0x140
>  [<c0147659>] sys_write+0x3c/0x63
>  [<c0102a93>] sysenter_past_esp+0x54/0x75
> Code: ff c7 04 9e 00 00 00 00 43 39 fb 75 e8 5b 5e 5f c3 89 c1 b8 00
> f0 ff ff 21 e0 8b 00 8b 80 b4 04 00 00 8b 40 40 83 78 08 00 74 08
> <0f> 0b 1d 00 00 f3 32 c0 ba 01 00 ff ff 89 c8 0f c1 10 85 d2 0f
>  <4><4>reiser4[apache2(24045)]: release_unix_file
> (/usr/src/linux-stable/fs/reiser4/plugin/file/file.c:2674)[vs-44]:
> WARNING: out of memory?
> <4>reiser4[apache2(24045)]: release_unix_file
> (/usr/src/linux-stable/fs/reiser4/plugin/file/file.c:2674)[vs-44]:
> WARNING: out of memory?
> <4>reiser4[apache2(24045)]: release_unix_file
> (/usr/src/linux-stable/fs/reiser4/plugin/file/file.c:2674)[vs-44]:
> WARNING: out of memory?
> <4>reiser4[apache2(24045)]: release_unix_file
> (/usr/src/linux-stable/fs/reiser4/plugin/file/file.c:2674)[vs-44]:
> WARNING: out of memory?
>
> --
> avuton
> --
>  Anyone who quotes me in their sig is an idiot. -- Rusty Russell.
>
> !DSPAM:443b6ef3163321669517796!

-- 
Alex.
