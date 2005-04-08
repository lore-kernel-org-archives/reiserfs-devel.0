From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiser4: mv changes mtime ?
Date: Fri, 08 Apr 2005 11:20:58 +0400
Message-ID: <1112944858.4420.94.camel@tribesman.namesys.com>
References: <4254F10A.7060103@ujf-grenoble.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23806-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4254F10A.7060103@ujf-grenoble.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mickael Marchand <Mickael.Marchand@ujf-grenoble.fr>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2005-04-07 at 12:36, Mickael Marchand wrote:
> Hi,
> 
> I am giving a shot at reiser4 to make rsync snapshots backups (using
> hard links and incremental rsync).
> this works definitely great apart from 2 minor bugs :)
> 
> 1 : it seems that mv directory/ directory2/ changes the mtime of the
> directory. This is not the case with reiser3.

I am not sure which is correct.
ext2 also changes mtime when it renames a directory.

Also, renaming directory changes its ".." entry because on rename it may
get new parent. So, probably, updating mtime on directory rename is not
very incorrect. 

>  Is this intentional ?
> (it basically breaks my recover-from-snapshots script which uses the
> mtime ;)
> 
> 2 : this was posted on lkml today but it fits better here I guess :
> 
> 2.6.12-rc1-mm4 config at
> http://www-fourier.ujf-grenoble.fr/~mmarcha/config-2.6.12-rc1-mm4.gz
> 
> running on a bi-opteron (debian-amd64),
> I got some "flushing like mad" warning messages from reiser4 (which
> are safe apparently).

yes, if its counter does not increase endlessly.

> and this soft lookup BUG caused by reiser4 I think :
> 

Have you found a test on which this soft lockup get detected 10 times in
10 attempts?

> BUG: soft lockup detected on CPU#0!
> 
> Modules linked in: ipv6 parport_pc parport eth1394 ehci_hcd uhci_hcd
> ohci1394 ieee1394 ohci_hcd usbcore snd_intel8x0 snd_ac97_codec snd_pcm
> snd_timer snd snd_page_alloc i2c_amd756 i2c_amd8111 i2c_isa w83781d
> i2c_sensor i2c_core e1000
> Pid: 25291, comm: pdflush Not tainted 2.6.12-rc1-mm4
> RIP: 0010:[<ffffffff8021f7de>] <ffffffff8021f7de>{protect_extent_nodes+382}
> RSP: 0018:ffff81007df45678  EFLAGS: 00000202
> RAX: ffff810015c7c5e0 RBX: ffff81007c609000 RCX: ffff81001074ba60
> RDX: ffff81001074b220 RSI: ffff81001074b1c0 RDI: ffff81001074b210
> RBP: 0000002000000000 R08: ffff81007df458a0 R09: ffff810044068e14
> R10: 000000000000001c R11: ffffffff802119a0 R12: 00007fe07df455e0
> R13: ffff81007c609004 R14: ffff81007df4565c R15: 00007fe000000001
> FS:  00002aaaaadfeae0(0000) GS:ffffffff806e7840(0000) knlGS:0000000000000000
> CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
> CR2: 00002aaaaaac2000 CR3: 000000009bc83000 CR4: 00000000000006e0
> 
> Call Trace:<ffffffff8021f7da>{protect_extent_nodes+378}
> <ffffffff8021c00e>{extent_size+30}
>        <ffffffff801f5df9>{txnh_get_atom+41}
> <ffffffff8021ffd2>{alloc_extent+562}
>        <ffffffff8020a0bc>{plugin_by_unsafe_id+28}
> <ffffffff80220bd1>{item_length_by_coord+17}
>        <ffffffff801f8a4f>{handle_pos_on_twig+351}
> <ffffffff801fabc6>{flush_current_atom+2022}
>        <ffffffff801f7aca>{flush_some_atom+458}
> <ffffffff801a2993>{generic_sync_sb_inodes+723}
>        <ffffffff8014cc50>{keventd_create_kthread+0}
> <ffffffff80203b85>{reiser4_sync_inodes+229}
>        <ffffffff801a2bd9>{writeback_inodes+137}
> <ffffffff8016012c>{background_writeout+124}
>        <ffffffff80160c10>{pdflush+0} <ffffffff80160d4c>{pdflush+316}
>        <ffffffff801600b0>{background_writeout+0}
> <ffffffff8014cec9>{kthread+217}
>        <ffffffff80133160>{schedule_tail+64} <ffffffff8010f59b>{child_rip+8}
>        <ffffffff8014cc50>{keventd_create_kthread+0}
> <ffffffff8014cdf0>{kthread+0}
>        <ffffffff8010f593>{child_rip+0}
> 
> Please CC-me in answers, I am not subscribed here.
> 
> Cheers,
> Mik
> 

