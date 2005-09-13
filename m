From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: reiser4 oops while mounting
Date: Tue, 13 Sep 2005 11:38:34 +0400
Message-ID: <17190.33274.711141.917364@gargle.gargle.HOWL>
References: <200509121631.11170@zodiac.zodiac.dnsalias.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25945-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509121631.11170@zodiac.zodiac.dnsalias.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Gran <alex@zodiac.dnsalias.org>
Cc: Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Alexander Gran writes:
 > Hi,

[...]

 > usb-storage: device scan complete
 > attempt to access beyond end of device
 > dm-0: rw=0, want=58662920, limit=58588992
 > Unable to handle kernel NULL pointer dereference at virtual address 00000000
 >  printing eip:
 > c018b7e4
 > *pde = 00000000
 > Oops: 0000 [#1]
 > PREEMPT
 > Modules linked in: aes_i586 cfq_iosched irtty_sir sir_dev ath_rate_sample wlan 
 > ath_hal ehci_hcd uhci_hcd
 > CPU:    0
 > EIP:    0060:[<c018b7e4>]    Tainted: P      VLI
 > EFLAGS: 00010206   (2.6.13-rc2-mm1)
 > EIP is at znodes_tree_done+0x16/0x26d
 > eax: f429f014   ebx: 00000000   ecx: 00002000   edx: c057cf88
 > esi: 00000000   edi: f429f038   ebp: f429f014   esp: f766ddc4
 > ds: 007b   es: 007b   ss: 0068
 > Process mount (pid: 4670, threadinfo=f766c000 task=f3d4d020)
 > Stack: c03fe7b5 00000001 00000000 f429f000 f429f014 f7461a00 c019283b f429f000
 >        f7461a00 f429f000 0000000c c01a8760 c04794d8 00000000 c01a8948 0000000c
 >        fffffffb 00000000 00000000 c01a89a6 00000000 f7461a00 4b1b5d0b 00000000
 > Call Trace:
 >  [<c03fe7b5>] wait_for_completion+0x86/0xfa
 >  [<c019283b>] done_tree+0x48/0x9d
 >  [<c01a8760>] _done_formatted_fake+0x17/0x25
 >  [<c01a8948>] done_super+0x1b/0x2a
 >  [<c01a89a6>] reiser4_fill_super+0x4f/0x69
 >  [<c0159d6d>] get_sb_bdev+0xcd/0x10a

mount code tries to handle some error here (most likely an "attempt to
access beyond end of device" above). These code paths are hardly
exercised. I am ccing reiserfs mailing list, where reiserfs error
reports should be sent to.

 > I'm currently not subscribed to lkml, as I'll be on holiday in a few hours, so 
 > pleas cc me.
 > kernel is 2.6.13-rc2-mm1
 > Problem does not seem to be reproducable.
 > 
 > regards
 > Alex

Have a nice holiday,

Nikita.
