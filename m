From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: Reiser4 for 3.16.2 problem: mount: mount /dev/md125 on
 /mnt/backup failed: Cannot allocate memory
Date: Tue, 4 Nov 2014 14:16:24 +0100
Message-ID: <CADW=+3k7mvPTc0x02UKYbg6Jq=zUQ5dORiUULNiB7kFLXjiG6g@mail.gmail.com>
References: <CADW=+3nWaMdFCpoKQSErTQPu7YHm=4UJEZfZFnn8wOKX9tKrKg@mail.gmail.com>
	<CADW=+3ms6zaqzpkRBEgApi=gkMNPLCzzex8ShK4CkCFD-WNk8Q@mail.gmail.com>
	<5457629C.8040906@gmail.com>
	<CADW=+3=XfcVJsYTitCHdAsehw61Vyk0vHqM7wLr0dQNLiP94Fw@mail.gmail.com>
	<54576A09.6010901@gmail.com>
	<CADW=+3k0rgockXeT_mnPFSoRr0Xm4ttRG5ZVpPjd3DqWCNL6gw@mail.gmail.com>
	<CADW=+3nzgJaYqAav475to7W4G4q6CoRMq83y-oNOOFLdU6xdSg@mail.gmail.com>
	<CADW=+3n1042QZJO=Eyd1ePc1xZyS+bsYPup5s2vSk81_6JCO3g@mail.gmail.com>
	<5457A282.7020704@gmail.com>
	<CADW=+3mzX7evaqZmvOSJ6F9XNmzmauegL4Vy0nqz6yqG8EyLyw@mail.gmail.com>
	<5457B0AB.6030203@gmail.com>
	<CADW=+3nSsTDABn4bWy0g8LVGmx4iJJ8YvdYuS2eokpi4RwdepQ@mail.gmail.com>
	<5458CB45.2050303@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=2+WrRlsDlpLTpq+nxsRY24y3LD86qQPqLyAW60wnO5E=;
        b=qHAiPsHU4mNKqOOyxrPBwXPEWnUs5s2B4eZ4TRfelkySdi6uiiRltV2AiQEWePJlVW
         4v1koJ9h7jekcO84VogwknWcHI4PYpkTPi+yDBLrdFMnpp32xzdgzsrwSVD6IHP0BoJ9
         aL0ddxy6ju1uIhURtx5fF8b1q+73yo4uSlSLVP3XZsPfe/VckSx5Qg0PPIqGGp6l+8S5
         FM69G2iZ0ayHiz20g7g2n0uwxTDpdugBGmNa6W+fKzkZJhcpOYDjNjVb0NTXHMuIt9ZA
         XCPg4ZNEQVjkGZ9khu/9L8kAbZclPno8fsGbkNU/uC3LDP1tbMY+fbRTpxnrVdAQv4r6
         y0fA==
In-Reply-To: <5458CB45.2050303@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Ivan Shapovalov <intelfx100@gmail.com>

Did a fsck of source partition.
Btw. why is there a reason this corruption appeared when I started
using 3.16.2 instead 3.10?
And here are the results:

krshina3 ~ # cat fsck.sda2
=46SCK: node.c: 108: repair_node_items_check: Node (4093690), items (27=
) and (28):
Wrong order of keys.
=46SCK: filter.c: 407: repair_filter_update_traverse: Node (4093690): t=
he node is
broken. Pointed from the node (531714), item (15), unit (0). The whole =
subtree
is skipped.
=46SCK: node.c: 108: repair_node_items_check: Node (4099659), items (12=
) and (13):
Wrong order of keys.
=46SCK: filter.c: 407: repair_filter_update_traverse: Node (4099659): t=
he node is
broken. Pointed from the node (531714), item (16), unit (0). The whole =
subtree
is skipped.
=46SCK: node.c: 108: repair_node_items_check: Node (4099663), items (21=
) and (22):
Wrong order of keys.
=46SCK: filter.c: 407: repair_filter_update_traverse: Node (4099663): t=
he node is
broken. Pointed from the node (531714), item (17), unit (0). The whole =
subtree
is skipped.



krshina3 ~ # cat fsck.build.sda2
=46SCK: node.c: 108: repair_node_items_check: Node (4093690), items (27=
) and (28):
Wrong order of keys.
=46SCK: filter.c: 407: repair_filter_update_traverse: Node (4093690): t=
he node is
unrecoverable. Pointed from the node (531714), item (15), unit (0). Rem=
oved.
=46SCK: node.c: 108: repair_node_items_check: Node (4099659), items (12=
) and (13):
Wrong order of keys.
=46SCK: filter.c: 407: repair_filter_update_traverse: Node (4099659): t=
he node is
unrecoverable. Pointed from the node (531714), item (15), unit (0). Rem=
oved.
=46SCK: node.c: 108: repair_node_items_check: Node (4099663), items (21=
) and (22):
Wrong order of keys.
=46SCK: filter.c: 407: repair_filter_update_traverse: Node (4099663): t=
he node is
unrecoverable. Pointed from the node (531714), item (15), unit (0). Rem=
oved.
=46SCK: node.c: 108: repair_node_items_check: Node (4080447), items (0)=
 and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4080571), items (0)=
 and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4081137), items (1)=
 and (2):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4090871), items (0)=
 and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4091337), items (0)
and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4091990), items (0)
and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4093016), items (0)
and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4094525), items (0)
and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4096175), items (0)
and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4113492), items (0)
and (1):
Wrong order of keys.

On Tue, Nov 4, 2014 at 1:49 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> The attached patch prevents panic.
>
> Thanks,
> Edward.
>
>
>
> On 11/03/2014 07:27 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>
>> Ok now with same config kernels 3.16,  3.14 and 3.10 fail in same sp=
ot.
>> It failes around rsync --delete or something command, dunno how to
>> find what it is I looked at iotop.
>> So let me reiterate:
>> One automated operation that worked after fsck every day for months
>> with kernel 3.10 started making problems since I started using 3.16
>> BUT it makes kernel Oops even if I go back to 3.10. The only funky
>> thing I did was having txmod=3Dwa for few days in /etc/fstab but tha=
t
>> was before these problems. Could it be that some corrupted file make=
s
>> this, unseen by fsck?
>> I can reformat this partition but I suspect that problematic file is
>> on my /. And then we wouldn't have a test case to reproduce this oop=
s
>> :)
>> Is there any way to record all IO requests to find what exactly does=
 this?
>>
>> This is Oops from 3.14:
>>
>> Nov  3 18:57:40 krshina3 kernel: [  179.693947] ------------[ cut he=
re
>> ]------------
>> Nov  3 18:57:40 krshina3 kernel: [  179.694212] kernel BUG at
>> fs/reiser4/plugin/item/ctail.c:669!
>> Nov  3 18:57:40 krshina3 kernel: [  179.694537] invalid opcode: 0000=
 [#1]
>> SMP
>> Nov  3 18:57:40 krshina3 kernel: [  179.694779] CPU: 1 PID: 3203 Com=
m:
>> rsync Not tainted 3.14.14-gentoo #1
>> Nov  3 18:57:40 krshina3 kernel: [  179.695148] Hardware name:
>> Gigabyte Technology Co., Ltd. To be filled by O.E.M./B75-D3V, BIOS F=
5
>> 07/04/2012
>> Nov  3 18:57:40 krshina3 kernel: [  179.695702] task: ffff8800b6cf47=
b0
>> ti: ffff8801db7f6000 task.ti: ffff8801db7f6000
>> Nov  3 18:57:40 krshina3 kernel: [  179.696128] RIP:
>> 0010:[<ffffffff811bc700>]  [<ffffffff811bc700>]
>> do_readpage_ctail+0x2a0/0x400
>> Nov  3 18:57:40 krshina3 kernel: [  179.696625] RSP:
>> 0018:ffff8801db7f7a68  EFLAGS: 00010246
>> Nov  3 18:57:40 krshina3 kernel: [  179.696925] RAX: 800000000000002=
1
>> RBX: ffffea000664a8c8 RCX: ffff8800b9964800
>> Nov  3 18:57:40 krshina3 kernel: [  179.697329] RDX: 000000000000003=
5
>> RSI: 0000000000000000 RDI: ffff8800b9967800
>> Nov  3 18:57:40 krshina3 kernel: [  179.697739] RBP: 000000000000000=
2
>> R08: 0000000000000000 R09: 0000000000000001
>> Nov  3 18:57:40 krshina3 kernel: [  179.698145] R10: ffffffff811ad0a=
0
>> R11: 0000000000000000 R12: ffff8800841dfd58
>> Nov  3 18:57:40 krshina3 kernel: [  179.698548] R13: ffff8801db7f7b5=
8
>> R14: 0000000000000001 R15: 0000000000001000
>> Nov  3 18:57:40 krshina3 kernel: [  179.698952] FS:
>> 00007f40176a0700(0000) GS:ffff88022e280000(0000)
>> knlGS:0000000000000000
>> Nov  3 18:57:40 krshina3 kernel: [  179.699410] CS:  0010 DS: 0000 E=
S:
>> 0000 CR0: 0000000080050033
>> Nov  3 18:57:40 krshina3 kernel: [  179.699735] CR2: 0000000002b3024=
8
>> CR3: 00000001de9d8000 CR4: 00000000001427e0
>> Nov  3 18:57:40 krshina3 kernel: [  179.700145] DR0: 000000000000004=
5
>> DR1: 0000000000000000 DR2: 0000000000000000
>> Nov  3 18:57:40 krshina3 kernel: [  179.700555] DR3: 000000000000000=
5
>> DR6: 00000000ffff0ff0 DR7: 0000000000000400
>> Nov  3 18:57:40 krshina3 kernel: [  179.700966] Stack:
>> Nov  3 18:57:40 krshina3 kernel: [  179.701080]  ffff8800841dfe98
>> ffff8801db7f7b58 ffffea000664a8c8 0000000000000000
>> Nov  3 18:57:40 krshina3 kernel: [  179.701523]  ffff8800b6cf47b0
>> ffff8800841dfd58 0000000000000000 ffffffff811bc969
>> Nov  3 18:57:40 krshina3 kernel: [  179.701963]  ffffea000664a8c8
>> ffffea000664a8c8 ffff8801db7f7c90 ffff8800841dfe98
>> Nov  3 18:57:40 krshina3 kernel: [  179.702402] Call Trace:
>> Nov  3 18:57:40 krshina3 kernel: [  179.702540]  [<ffffffff811bc969>=
]
>> ? ctail_readpages_filler+0x109/0x210
>> Nov  3 18:57:40 krshina3 kernel: [  179.702911]  [<ffffffff811bc860>=
]
>> ? do_readpage_ctail+0x400/0x400
>> Nov  3 18:57:40 krshina3 kernel: [  179.703257]  [<ffffffff810e9b91>=
]
>> ? read_cache_pages+0xb1/0x120
>> Nov  3 18:57:40 krshina3 kernel: [  179.703592]  [<ffffffff811bccf5>=
]
>> ? readpages_ctail+0x135/0x340
>> Nov  3 18:57:40 krshina3 kernel: [  179.703928]  [<ffffffff811b0da6>=
]
>> ? readpages_cryptcompress+0x46/0x90
>> Nov  3 18:57:40 krshina3 kernel: [  179.704292]  [<ffffffff810e99c1>=
]
>> ? __do_page_cache_readahead+0x1b1/0x260
>> Nov  3 18:57:40 krshina3 kernel: [  179.704677]  [<ffffffff811ab0a0>=
]
>> ? reiser4_write_dispatch+0x4d0/0x4d0
>> Nov  3 18:57:40 krshina3 kernel: [  179.705047]  [<ffffffff810e9d1c>=
]
>> ? ra_submit+0x1c/0x30
>> Nov  3 18:57:40 krshina3 kernel: [  179.705343]  [<ffffffff810e09b6>=
]
>> ? generic_file_aio_read+0x4d6/0x6f0
>> Nov  3 18:57:40 krshina3 kernel: [  179.705708]  [<ffffffff8111bb4a>=
]
>> ? do_sync_read+0x5a/0x90
>> Nov  3 18:57:40 krshina3 kernel: [  179.706023]  [<ffffffff8109de30>=
]
>> ? __dequeue_entity+0x40/0x50
>> Nov  3 18:57:40 krshina3 kernel: [  179.706354]  [<ffffffff811b0e68>=
]
>> ? read_cryptcompress+0x78/0xc0
>> Nov  3 18:57:40 krshina3 kernel: [  179.706694]  [<ffffffff811ab244>=
]
>> ? reiser4_read_dispatch+0x74/0x170
>> Nov  3 18:57:40 krshina3 kernel: [  179.707056]  [<ffffffff8111c8a1>=
]
>> ? vfs_read+0xa1/0x180
>> Nov  3 18:57:40 krshina3 kernel: [  179.707351]  [<ffffffff8111cd9f>=
]
>> ? SyS_read+0x4f/0xc0
>> Nov  3 18:57:40 krshina3 kernel: [  179.707642]  [<ffffffff81670d62>=
]
>> ? system_call_fastpath+0x16/0x1b
>> Nov  3 18:57:40 krshina3 kernel: [  179.707992] Code: 80 0b 08 31 ed
>> e9 b0 fe ff ff 90 48 89 df e8 18 2d f2 ff e9 62 fe ff ff 0f 1f 00 48
>> 89 df e8 08 2d f2 ff e9 92 fe ff ff 0f 1f 00 <0f> 0b 48 8b 03 a8 08 =
0f
>> 84 a2 00 00 00 49 8b bd 80 00 00 00 e8
>> Nov  3 18:57:40 krshina3 kernel: [  179.709414] RIP
>> [<ffffffff811bc700>] do_readpage_ctail+0x2a0/0x400
>> Nov  3 18:57:40 krshina3 kernel: [  179.709774]  RSP <ffff8801db7f7a=
68>
>> Nov  3 18:57:40 krshina3 kernel: [  179.821174] ---[ end trace
>> d60466a8b91493b8 ]---
>>
>> This is from 3.10:
>>
>> Nov  3 19:08:36 krshina3 kernel: [  449.276796] ------------[ cut he=
re
>> ]------------
>> Nov  3 19:08:36 krshina3 kernel: [  449.276825] kernel BUG at
>> fs/reiser4/plugin/item/ctail.c:669!
>> Nov  3 19:08:36 krshina3 kernel: [  449.276841] invalid opcode: 0000=
 [#1]
>> SMP
>> Nov  3 19:08:36 krshina3 kernel: [  449.276857] CPU: 1 PID: 3167 Com=
m:
>> rsync Not tainted 3.10.6-gentoo #2
>> Nov  3 19:08:36 krshina3 kernel: [  449.276875] Hardware name:
>> Gigabyte Technology Co., Ltd. To be filled by O.E.M./B75-D3V, BIOS F=
5
>> 07/04/2012
>> Nov  3 19:08:36 krshina3 kernel: [  449.276900] task: ffff88022d2ac6=
90
>> ti: ffff880074f80000 task.ti: ffff880074f80000
>> Nov  3 19:08:36 krshina3 kernel: [  449.276920] RIP:
>> 0010:[<ffffffff811555e9>]  [<ffffffff811555e9>]
>> do_readpage_ctail+0x2f3/0x3ed
>> Nov  3 19:08:36 krshina3 kernel: [  449.276948] RSP:
>> 0018:ffff880074f81a28  EFLAGS: 00010246
>> Nov  3 19:08:36 krshina3 kernel: [  449.276962] RAX: 000000000000000=
0
>> RBX: ffffea0005a31988 RCX: 00000000000354d4
>> Nov  3 19:08:36 krshina3 kernel: [  449.276981] RDX: 000000000000003=
5
>> RSI: 0000000000000000 RDI: ffff8801a139fcd8
>> Nov  3 19:08:36 krshina3 kernel: [  449.276999] RBP: ffff880074f81b1=
8
>> R08: 0000000000000000 R09: 0000000000000000
>> Nov  3 19:08:36 krshina3 kernel: [  449.277018] R10: 000000000000086=
6
>> R11: 0000000000000866 R12: ffff8801a139fb98
>> Nov  3 19:08:36 krshina3 kernel: [  449.277037] R13: 000000000000000=
2
>> R14: 0000000000000000 R15: 0000000000001000
>> Nov  3 19:08:36 krshina3 kernel: [  449.277056] FS:
>> 00007fc4e9c01700(0000) GS:ffff88022e280000(0000)
>> knlGS:0000000000000000
>> Nov  3 19:08:36 krshina3 kernel: [  449.277077] CS:  0010 DS: 0000 E=
S:
>> 0000 CR0: 0000000080050033
>> Nov  3 19:08:36 krshina3 kernel: [  449.277092] CR2: 000000000331a24=
8
>> CR3: 0000000075069000 CR4: 00000000001427e0
>> Nov  3 19:08:36 krshina3 kernel: [  449.277111] DR0: 000000000000004=
5
>> DR1: 0000000000000000 DR2: 0000000000000000
>> Nov  3 19:08:36 krshina3 kernel: [  449.277129] DR3: 000000000000000=
5
>> DR6: 00000000ffff0ff0 DR7: 0000000000000400
>> Nov  3 19:08:36 krshina3 kernel: [  449.277147] Stack:
>> Nov  3 19:08:36 krshina3 kernel: [  449.277154]  ffff8801a139fcd8
>> ffff880074f81b18 ffff8801a139fb98 ffffea0005a31988
>> Nov  3 19:08:36 krshina3 kernel: [  449.277177]  0000000000000000
>> 0000000000000000 ffff880074f81b18 ffffffff81155861
>> Nov  3 19:08:36 krshina3 kernel: [  449.277200]  ffffea0005a31988
>> ffffea0005a31988 ffff880074f81c78 ffff8801a139fcd8
>> Nov  3 19:08:36 krshina3 kernel: [  449.277223] Call Trace:
>> Nov  3 19:08:36 krshina3 kernel: [  449.277232]  [<ffffffff81155861>=
]
>> ? ctail_readpages_filler+0x17e/0x1c2
>> Nov  3 19:08:36 krshina3 kernel: [  449.277250]  [<ffffffff811556e3>=
]
>> ? do_readpage_ctail+0x3ed/0x3ed
>> Nov  3 19:08:36 krshina3 kernel: [  449.277268]  [<ffffffff810ad77c>=
]
>> ? read_cache_pages+0x91/0x108
>> Nov  3 19:08:36 krshina3 kernel: [  449.277286]  [<ffffffff8113a7d1>=
]
>> ? reiser4_get_file_fsdata+0x33/0x8a
>> Nov  3 19:08:36 krshina3 kernel: [  449.277304]  [<ffffffff81155c95>=
]
>> ? readpages_ctail+0x2f2/0x2f9
>> Nov  3 19:08:36 krshina3 kernel: [  449.277321]  [<ffffffff8114bef8>=
]
>> ? readpages_cryptcompress+0x3f/0x6b
>> Nov  3 19:08:36 krshina3 kernel: [  449.277339]  [<ffffffff810ad5b3>=
]
>> ? __do_page_cache_readahead+0x11f/0x1c3
>> Nov  3 19:08:36 krshina3 kernel: [  449.277357]  [<ffffffff810ad8c3>=
]
>> ? ra_submit+0x1c/0x23
>> Nov  3 19:08:36 krshina3 kernel: [  449.277372]  [<ffffffff810a6348>=
]
>> ? generic_file_aio_read+0x269/0x5b6
>> Nov  3 19:08:36 krshina3 kernel: [  449.277390]  [<ffffffff810d4399>=
]
>> ? do_sync_read+0x6e/0x90
>> Nov  3 19:08:36 krshina3 kernel: [  449.277406]  [<ffffffff8114bf8d>=
]
>> ? read_cryptcompress+0x69/0x95
>> Nov  3 19:08:36 krshina3 kernel: [  449.277423]  [<ffffffff8114723b>=
]
>> ? reiser4_read_dispatch+0xc9/0x124
>> Nov  3 19:08:36 krshina3 kernel: [  449.277441]  [<ffffffff810d4dc2>=
]
>> ? vfs_read+0xac/0x146
>> Nov  3 19:08:36 krshina3 kernel: [  449.277456]  [<ffffffff810d51da>=
]
>> ? SyS_read+0x4e/0x78
>> Nov  3 19:08:36 krshina3 kernel: [  449.277471]  [<ffffffff814c9312>=
]
>> ? system_call_fastpath+0x16/0x1b
>> Nov  3 19:08:36 krshina3 kernel: [  449.277487] Code: f9 00 00 00 44
>> 8b ad 88 00 00 00 41 83 fd 02 74 1a 77 0c 41 83 fd 01 0f 85 e0 00 00
>> 00 eb 61 41 83 fd 04 0f 87 d4 00 00 00 eb 02 <0f> 0b 65 48 8b 14 25 =
48
>> b7 00 00 48 81 ea d8 1f 00 00 ff 42 1c
>> Nov  3 19:08:36 krshina3 kernel: [  449.277612] RIP
>> [<ffffffff811555e9>] do_readpage_ctail+0x2f3/0x3ed
>> Nov  3 19:08:36 krshina3 kernel: [  449.277630]  RSP <ffff880074f81a=
28>
>> Nov  3 19:08:36 krshina3 kernel: [  449.282221] ---[ end trace
>> f14ff60ec68f3286 ]---
>>
>> On Mon, Nov 3, 2014 at 5:43 PM, Edward Shishkin
>> <edward.shishkin@gmail.com> wrote:
>>>
>>> On 11/03/2014 04:48 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>
>>>
>>> On Nov 3, 2014 4:43 PM, "Edward Shishkin" <edward.shishkin@gmail.co=
m>
>>> wrote:
>>>>
>>>> On 11/03/2014 02:33 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>>>
>>>>> I forgot:
>>>>> It was working for some time (deleting old directories etc.) and =
then
>>>>> crashed.
>>>>> Btw. why didn't that partition (/dev/md125) remounted read-only o=
n
>>>>> error when I have that in /etc/fstab?
>>>>
>>>>
>>>>
>>>> What do you suggest to do when encountering IO error?
>>>> There is another option: to oops. You like this better?
>>>>
>>> There's a misunderstanding maybe.... Long time ago you told me to a=
dd
>>> onerror=3Dremount-ro to fstab but now when this error happened syst=
em
>>> continued to work but the partition stayed rw, maybe I misunderstoo=
d the
>>> option?
>>>
>>>
>>>
>>> Ah, "onerror" means "on IO error".
>>> That is, file system submitted a RW-request, and the disk driver re=
turns
>>> IO error for this request. If so, then you file system will become
>>> read-only.
>>>
>>> As to your case: there is no IO errors. There is a kernel oops, thi=
s is
>>> another
>>> situation..
>>>
>>> Edward.
>>>
>>>
>>>
>>>> Edward.
>>>>
>>>>
>>>>> On Mon, Nov 3, 2014 at 2:28 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusan=
c@gmail.com> wrote:
>>>>>>
>>>>>> After an hour or more still nothing, one rsync went to zombie ot=
her
>>>>>> still in D state
>>>>>> I killed the main process and rebooted.
>>>>>>
>>>>>> krshina3 goran # ps -aux | grep rsync
>>>>>> root      6655  0.0  0.1 101568  9328 pts/4    D    13:08   0:01
>>>>>> /usr/bin/rsync -ax --delete --numeric-ids --relative --delete-ex=
cluded
>>>>>> --exclude=3D/home/windows.qcow2
>>>>>> --link-dest=3D/mnt/backup/daily.1/localhost/ /home
>>>>>> /mnt/backup/daily.0/localhost/
>>>>>> root      6656  0.0  0.0      0     0 pts/4    Z    13:08   0:00
>>>>>> [rsync] <defunct>
>>>>>>
>>>>>>
>>>>>> Now I tried same command (rsnapshot -c /etc/rsnapshot.d/daily.co=
nf
>>>>>> daily) and kernel BUGed with:
>>>>>>
>>>>>> krshina3 goran # rsnapshot -c /etc/rsnapshot.d/daily.conf daily
>>>>>> rsync: writefd_unbuffered failed to write 5 bytes to socket
>>>>>> [generator]: Broken pipe (32)
>>>>>>
>>>>>>
>>>>>> ----------------------------------------------------------------=
------------
>>>>>> rsnapshot encountered an error! The program was invoked with the=
se
>>>>>> options:
>>>>>> /usr/bin/rsnapshot -c /etc/rsnapshot.d/daily.conf daily
>>>>>>
>>>>>>
>>>>>> ----------------------------------------------------------------=
------------
>>>>>> ERROR: /usr/bin/rsync returned 0.04296875 while processing /home=
/
>>>>>> WARNING: Rolling back "localhost/"
>>>>>> rsync error: error in rsync protocol data stream (code 12) at
>>>>>> io.c(1532) [generator=3D3.0.9]
>>>>>>
>>>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
