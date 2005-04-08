From: "Kathy KN (HK)" <kathy.kn@gmail.com>
Subject: Re: reiser4: mv changes mtime ?
Date: Fri, 8 Apr 2005 16:59:16 +0800
Message-ID: <f8ad67b305040801592bf7e935@mail.gmail.com>
References: <4254F10A.7060103@ujf-grenoble.fr>
	 <1112944858.4420.94.camel@tribesman.namesys.com>
	 <42564609.4040208@ujf-grenoble.fr>
Reply-To: "Kathy KN (HK)" <kathy.kn@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23811-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42564609.4040208@ujf-grenoble.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mickael Marchand <Mickael.Marchand@ujf-grenoble.fr>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

For your first problem,

see fs/reiser4/plugin/dir/hashed_dir.c, line 540, 
comment "from_dir->i_mtime = CURRENT_TIME;" away,
and recompile your kernel.

mtime shouldn't update when you try to "mv", and thus
will not break your backup scripts.

Kathy

On Apr 8, 2005 4:51 PM, Mickael Marchand
<Mickael.Marchand@ujf-grenoble.fr> wrote:
> hmm just got 3 more soft lookups in a few hours (2/3 hours I think) ;)
> my script (attached in case you want to try it) for backups basically do:
> rm -rf hourly.11
> mv hourly.10 hourly.11
> ...
> mv hourly.1 hourly.2
> mv hourly.0 hourly.1
> cp -al hourly.1 hourly.0
> 
> rsync [various options] /home/ hourly.0/
> 
> the size of the base backup being about 37Go which is incrementally
> rsync-ed thanks to hard links on a 500Go raid6 array.
> 
> another backups scripts just rsync some box over ssh once a day ...
> 
> tell me if I can provide more infos that could help you ...
> 
> Cheers,
> Mik
> 
> reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
> (fs/reiser4/txnmgr.c:1147)[nikita-3176]:
> WARNING: Flushing like mad: 16384
> reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
> (fs/reiser4/txnmgr.c:1147)[nikita-3176]:
> WARNING: Flushing like mad: 16384
> reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
> (fs/reiser4/txnmgr.c:1147)[nikita-3176]:
> WARNING: Flushing like mad: 16384
> ssh[4076]: segfault at 0000000000000000 rip 0000000000425b05 rsp
> 00007ffffffb0c50 error 4
> ssh[4079]: segfault at 0000000000000000 rip 0000000000425b05 rsp
> 00007fffffef6a50 error 4
> ssh[4082]: segfault at 0000000000000000 rip 0000000000425b05 rsp
> 00007ffffff92250 error 4
> ssh[4085]: segfault at 0000000000000000 rip 0000000000425b05 rsp
> 00007fffff956810 error 4
> ssh[4088]: segfault at 0000000000000000 rip 0000000000425b05 rsp
> 00007fffffe9f9f0 error 4
> reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
> (fs/reiser4/txnmgr.c:1147)[nikita-3176]:
> WARNING: Flushing like mad: 16384
> reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
> (fs/reiser4/txnmgr.c:1147)[nikita-3176]:
> WARNING: Flushing like mad: 16384
> reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
> (fs/reiser4/txnmgr.c:1147)[nikita-3176]:
> WARNING: Flushing like mad: 16384
> BUG: soft lockup detected on CPU#0!
> 
> Modules linked in: ipv6 parport_pc parport ehci_hcd eth1394 uhci_hcd
> ohci1394 ieee1394 ohci_hcd usbcore snd_intel8x0 snd_ac97_codec snd_pcm
> snd_timer snd snd_page_alloc i2c_amd756 i2c_amd8111 i2c_isa w83781d
> i2c_sensor i2c_core e1000
> Pid: 6131, comm: pdflush Not tainted 2.6.12-rc2-mm1
> RIP: 0010:[<ffffffff801ea474>] <ffffffff801ea474>{jlookup+36}
> RSP: 0018:ffff81001def3670  EFLAGS: 00000286
> RAX: ffff81007f81b340 RBX: ffff8100c09f5000 RCX: 00000000000038b1
> RDX: ffff81001c7171c0 RSI: 000000000030c1df RDI: ffff8100c739b020
> RBP: 0000002000000000 R08: ffff81001def38a0 R09: ffff810011b54b54
> R10: 0000000000000026 R11: ffffffff802118d0 R12: 00007fe01def35e0
> R13: ffff8100c09f5004 R14: ffff81001def365c R15: 00007fe000000001
> FS:  00002aaaaadfeae0(0000) GS:ffffffff806eb840(0000) knlGS:0000000000000000
> CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
> CR2: 00002aaaabb58dc8 CR3: 000000000dbab000 CR4: 00000000000006e0
> 
> Call Trace:<ffffffff8021f665>{protect_extent_nodes+213}
> <ffffffff8021bf3e>{extent_size+30}
>        <ffffffff801f5d49>{txnh_get_atom+41}
> <ffffffff8021ff02>{alloc_extent+562}
>        <ffffffff80209fec>{plugin_by_unsafe_id+28}
> <ffffffff80220b01>{item_length_by_coord+17}
>        <ffffffff801f899f>{handle_pos_on_twig+351}
> <ffffffff801fab16>{flush_current_atom+2022}
>        <ffffffff801f7a1a>{flush_some_atom+458}
> <ffffffff801a27a3>{generic_sync_sb_inodes+723}
>        <ffffffff8014cb90>{keventd_create_kthread+0}
> <ffffffff80203ab5>{reiser4_sync_inodes+229}
>        <ffffffff801a29e9>{writeback_inodes+137}
> <ffffffff8015ff6c>{background_writeout+124}
>        <ffffffff80160a50>{pdflush+0} <ffffffff80160b8c>{pdflush+316}
>        <ffffffff8015fef0>{background_writeout+0}
> <ffffffff8014ce09>{kthread+217}
>        <ffffffff80133310>{schedule_tail+64} <ffffffff8010f59b>{child_rip+8}
>        <ffffffff8014cb90>{keventd_create_kthread+0}
> <ffffffff8014cd30>{kthread+0}
>        <ffffffff8010f593>{child_rip+0}
> BUG: soft lockup detected on CPU#0!
> 
> Modules linked in: ipv6 parport_pc parport ehci_hcd eth1394 uhci_hcd
> ohci1394 ieee1394 ohci_hcd usbcore snd_intel8x0 snd_ac97_codec snd_pcm
> snd_timer snd snd_page_alloc i2c_amd756 i2c_amd8111 i2c_isa w83781d
> i2c_sensor i2c_core e1000
> Pid: 6131, comm: pdflush Not tainted 2.6.12-rc2-mm1
> RIP: 0010:[<ffffffff801ea474>] <ffffffff801ea474>{jlookup+36}
> RSP: 0018:ffff81001def3670  EFLAGS: 00000282
> RAX: ffff810058578880 RBX: ffff8100c0a5f000 RCX: 000000000000c0c3
> RDX: ffff81004d60ec40 RSI: 000000000030c1df RDI: ffff8100c739b020
> RBP: 0000002000000000 R08: ffff81001def38a0 R09: ffff810040f9570c
> R10: 0000000000000018 R11: ffffffff802118d0 R12: 00007fe00001412a
> R13: ffff8100c0a5f004 R14: ffff81001def365c R15: 00007fe000000001
> FS:  00002aaaaadfeae0(0000) GS:ffffffff806eb840(0000) knlGS:0000000000000000
> CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
> CR2: 00002aaaaaac2000 CR3: 000000000dbab000 CR4: 00000000000006e0
> 
> Call Trace:<ffffffff8021f665>{protect_extent_nodes+213}
> <ffffffff8021bf3e>{extent_size+30}
>        <ffffffff801f5d49>{txnh_get_atom+41}
> <ffffffff8021ff02>{alloc_extent+562}
>        <ffffffff801f0013>{longterm_unlock_znode+275}
> <ffffffff80220bad>{item_id_by_coord+45}
>        <ffffffff801f899f>{handle_pos_on_twig+351}
> <ffffffff801fab16>{flush_current_atom+2022}
>        <ffffffff801f7a1a>{flush_some_atom+458}
> <ffffffff801a27a3>{generic_sync_sb_inodes+723}
>        <ffffffff8014cb90>{keventd_create_kthread+0}
> <ffffffff80203ab5>{reiser4_sync_inodes+229}
>        <ffffffff801a29e9>{writeback_inodes+137}
> <ffffffff8015ff6c>{background_writeout+124}
>        <ffffffff80160a50>{pdflush+0} <ffffffff80160b8c>{pdflush+316}
>        <ffffffff8015fef0>{background_writeout+0}
> <ffffffff8014ce09>{kthread+217}
>        <ffffffff80133310>{schedule_tail+64} <ffffffff8010f59b>{child_rip+8}
>        <ffffffff8014cb90>{keventd_create_kthread+0}
> <ffffffff8014cd30>{kthread+0}
>        <ffffffff8010f593>{child_rip+0}
> BUG: soft lockup detected on CPU#0!
> 
> Modules linked in: ipv6 parport_pc parport ehci_hcd eth1394 uhci_hcd
> ohci1394 ieee1394 ohci_hcd usbcore snd_intel8x0 snd_ac97_codec snd_pcm
> snd_timer snd snd_page_alloc i2c_amd756 i2c_amd8111 i2c_isa w83781d
> i2c_sensor i2c_core e1000
> Pid: 8037, comm: rsync Not tainted 2.6.12-rc2-mm1
> RIP: 0010:[<ffffffff801ea474>] <ffffffff801ea474>{jlookup+36}
> RSP: 0018:ffff81007539f3f0  EFLAGS: 00000282
> RAX: ffff81001fdf8580 RBX: ffff8100c0940000 RCX: 000000000001c54e
> RDX: ffff81001ae99880 RSI: 000000000030c1df RDI: ffff8100c739b020
> RBP: 0000002000000000 R08: ffff81007539f620 R09: ffff81008ab989bc
> R10: 000000000000003b R11: ffffffff802118d0 R12: 00007fe07539f360
> R13: ffff8100c0940004 R14: ffff81007539f3dc R15: 00007fe000000001
> FS:  00002aaaab01b6d0(0000) GS:ffffffff806eb840(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> CR2: 00002aaaaaac2000 CR3: 000000000dbab000 CR4: 00000000000006e0
> 
> Call Trace:<ffffffff8021f665>{protect_extent_nodes+213}
> <ffffffff8021bf3e>{extent_size+30}
>        <ffffffff801f5d49>{txnh_get_atom+41}
> <ffffffff8021ff02>{alloc_extent+562}
>        <ffffffff801f0013>{longterm_unlock_znode+275}
> <ffffffff801fb4f2>{handle_pos_end_of_twig+642}
>        <ffffffff80220b01>{item_length_by_coord+17}
> <ffffffff801f899f>{handle_pos_on_twig+351}
>        <ffffffff801fab16>{flush_current_atom+2022}
> <ffffffff8020b38b>{owns_item_common+75}
>        <ffffffff801f71f3>{txn_end+419} <ffffffff801f7519>{txn_restart+9}
>        <ffffffff80203b19>{reiser4_throttle_write+9}
> <ffffffff8021e805>{write_extent+1509}
>        <ffffffff80220b01>{item_length_by_coord+17}
> <ffffffff8021bf89>{nr_units_extent+9}
>        <ffffffff8021d359>{init_coord_extension_extent+121}
>        <ffffffff8021e220>{write_extent+0} <ffffffff8022a920>{write_flow+640}
>        <ffffffff804c7e41>{__down_read+49}
> <ffffffff8022ad73>{write_unix_file+835}
>        <ffffffff801f74aa>{txn_end+1114}
> <ffffffff8020655d>{reiser4_write+157}
>        <ffffffff8017e4ae>{vfs_write+190} <ffffffff8017ea73>{sys_write+83}
>        <ffffffff8010e9e2>{system_call+126}
> reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
> (fs/reiser4/txnmgr.c:1147)[nikita-3176]:
> WARNING: Flushing like mad: 16384
> reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
> (fs/reiser4/txnmgr.c:1147)[nikita-3176]:
> WARNING: Flushing like mad: 16384
> reiser4[ktxnmgrd:md3:ti(3087)]: commit_current_atom
> (fs/reiser4/txnmgr.c:1147)[nikita-3176]:
> WARNING: Flushing like mad: 16384
> 
> 
> Vladimir Saveliev wrote:
> > Hello
> >
> > On Thu, 2005-04-07 at 12:36, Mickael Marchand wrote:
> >
> >>Hi,
> >>
> >>I am giving a shot at reiser4 to make rsync snapshots backups (using
> >>hard links and incremental rsync).
> >>this works definitely great apart from 2 minor bugs :)
> >>
> >>1 : it seems that mv directory/ directory2/ changes the mtime of the
> >>directory. This is not the case with reiser3.
> >
> >
> > I am not sure which is correct.
> > ext2 also changes mtime when it renames a directory.
> >
> > Also, renaming directory changes its ".." entry because on rename it may
> > get new parent. So, probably, updating mtime on directory rename is not
> > very incorrect.
> >
> >
> >> Is this intentional ?
> >>(it basically breaks my recover-from-snapshots script which uses the
> >>mtime ;)
> >>
> >>2 : this was posted on lkml today but it fits better here I guess :
> >>
> >>2.6.12-rc1-mm4 config at
> >>http://www-fourier.ujf-grenoble.fr/~mmarcha/config-2.6.12-rc1-mm4.gz
> >>
> >>running on a bi-opteron (debian-amd64),
> >>I got some "flushing like mad" warning messages from reiser4 (which
> >>are safe apparently).
> >
> >
> > yes, if its counter does not increase endlessly.
> >
> >
> >>and this soft lookup BUG caused by reiser4 I think :
> >>
> >
> >
> > Have you found a test on which this soft lockup get detected 10 times in
> > 10 attempts?
> >
> >
> >>BUG: soft lockup detected on CPU#0!
> >>
> >>Modules linked in: ipv6 parport_pc parport eth1394 ehci_hcd uhci_hcd
> >>ohci1394 ieee1394 ohci_hcd usbcore snd_intel8x0 snd_ac97_codec snd_pcm
> >>snd_timer snd snd_page_alloc i2c_amd756 i2c_amd8111 i2c_isa w83781d
> >>i2c_sensor i2c_core e1000
> >>Pid: 25291, comm: pdflush Not tainted 2.6.12-rc1-mm4
> >>RIP: 0010:[<ffffffff8021f7de>] <ffffffff8021f7de>{protect_extent_nodes+382}
> >>RSP: 0018:ffff81007df45678  EFLAGS: 00000202
> >>RAX: ffff810015c7c5e0 RBX: ffff81007c609000 RCX: ffff81001074ba60
> >>RDX: ffff81001074b220 RSI: ffff81001074b1c0 RDI: ffff81001074b210
> >>RBP: 0000002000000000 R08: ffff81007df458a0 R09: ffff810044068e14
> >>R10: 000000000000001c R11: ffffffff802119a0 R12: 00007fe07df455e0
> >>R13: ffff81007c609004 R14: ffff81007df4565c R15: 00007fe000000001
> >>FS:  00002aaaaadfeae0(0000) GS:ffffffff806e7840(0000) knlGS:0000000000000000
> >>CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
> >>CR2: 00002aaaaaac2000 CR3: 000000009bc83000 CR4: 00000000000006e0
> >>
> >>Call Trace:<ffffffff8021f7da>{protect_extent_nodes+378}
> >><ffffffff8021c00e>{extent_size+30}
> >>       <ffffffff801f5df9>{txnh_get_atom+41}
> >><ffffffff8021ffd2>{alloc_extent+562}
> >>       <ffffffff8020a0bc>{plugin_by_unsafe_id+28}
> >><ffffffff80220bd1>{item_length_by_coord+17}
> >>       <ffffffff801f8a4f>{handle_pos_on_twig+351}
> >><ffffffff801fabc6>{flush_current_atom+2022}
> >>       <ffffffff801f7aca>{flush_some_atom+458}
> >><ffffffff801a2993>{generic_sync_sb_inodes+723}
> >>       <ffffffff8014cc50>{keventd_create_kthread+0}
> >><ffffffff80203b85>{reiser4_sync_inodes+229}
> >>       <ffffffff801a2bd9>{writeback_inodes+137}
> >><ffffffff8016012c>{background_writeout+124}
> >>       <ffffffff80160c10>{pdflush+0} <ffffffff80160d4c>{pdflush+316}
> >>       <ffffffff801600b0>{background_writeout+0}
> >><ffffffff8014cec9>{kthread+217}
> >>       <ffffffff80133160>{schedule_tail+64} <ffffffff8010f59b>{child_rip+8}
> >>       <ffffffff8014cc50>{keventd_create_kthread+0}
> >><ffffffff8014cdf0>{kthread+0}
> >>       <ffffffff8010f593>{child_rip+0}
> >>
> >>Please CC-me in answers, I am not subscribed here.
> >>
> >>Cheers,
> >>Mik
> >>
> >
> >
> 
> --
> Mickael Marchand,
> Ingenieur de recherche CNRS
> Service Informatique, Institut Fourier - UFR Maths
> Tel : 0476635655 Fax : 0476514478
> 
> 
>
