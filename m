From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: Reiser4 for 3.16.2 problem: mount: mount /dev/md125 on
 /mnt/backup failed: Cannot allocate memory
Date: Wed, 3 Dec 2014 21:16:04 +0100
Message-ID: <CADW=+3=GpYCc3aQOexJY7afL6suKxXRhs=dkf0m9zZfHQ0cnFA@mail.gmail.com>
References: <CADW=+3nWaMdFCpoKQSErTQPu7YHm=4UJEZfZFnn8wOKX9tKrKg@mail.gmail.com>
	<54576A09.6010901@gmail.com>
	<CADW=+3k0rgockXeT_mnPFSoRr0Xm4ttRG5ZVpPjd3DqWCNL6gw@mail.gmail.com>
	<CADW=+3nzgJaYqAav475to7W4G4q6CoRMq83y-oNOOFLdU6xdSg@mail.gmail.com>
	<CADW=+3n1042QZJO=Eyd1ePc1xZyS+bsYPup5s2vSk81_6JCO3g@mail.gmail.com>
	<5457A282.7020704@gmail.com>
	<CADW=+3mzX7evaqZmvOSJ6F9XNmzmauegL4Vy0nqz6yqG8EyLyw@mail.gmail.com>
	<5457B0AB.6030203@gmail.com>
	<CADW=+3nSsTDABn4bWy0g8LVGmx4iJJ8YvdYuS2eokpi4RwdepQ@mail.gmail.com>
	<5458CB45.2050303@gmail.com>
	<CADW=+3k7mvPTc0x02UKYbg6Jq=zUQ5dORiUULNiB7kFLXjiG6g@mail.gmail.com>
	<545965C7.5010304@gmail.com>
	<CADW=+3k40KVKf5hLD1BgJ8a6uj=ZJ=T_gOmijDZVxWS3pK_6AQ@mail.gmail.com>
	<54665EFD.7030304@gmail.com>
	<CADW=+3mrqv=BjX8TCpRszFbr3OYEvgOk0OpcYe56f6OJmYDZbQ@mail.gmail.com>
	<CADW=+3m75JHiu2fWHJ5mq0Q4XUd2vkp5An1mKsOPkd8OWQnz+w@mail.gmail.com>
	<547BACC8.6090805@gmail.com>
	<CADW=+3=Tqw-2yfe6q4ERKSdyu9BmbApoREi-p4A7Auu_k27A6Q@mail.gmail.com>
	<547BAF3D.1000605@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=Mxhhzy1kTczMcEmkzsNWtJxhGoo9Ce4wldhL74Tn/QQ=;
        b=bf3b/p22UPfxQ1cFHIIOLovgrDMYDIYJQxd8WyhGkGuEZvY/JqMVg6MqdTw59WBrpQ
         IRLAPGNx7n5aKPcjE5QILO60jHJGxGyKu4vp2glPIn41gH0IJ1DYj5NJYceVpeRpVnCn
         /s/ZrI0zjswBxt0BLN4Fo4FduAk0OvNbP4PYpIVZ5Exfui4gj/ZwH8vzhkbKbe3GAtNw
         E9JR7h3i322w3TXD5KlLJdkfNLY3dfZQRHZoP5U/W0cFdt2tzqVdGVf2WSJHieYM5YRD
         Vf7n0hxrM4OZYSXN+LWJQcw0B5bBEcKfYHZON/Fj/nVPT8vczufhjNEpZWhW12HYJxwI
         YQVw==
In-Reply-To: <547BAF3D.1000605@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Ivan Shapovalov <intelfx100@gmail.com>

On Mon, Dec 1, 2014 at 12:58 AM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
>
> On 12/01/2014 12:53 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>
>
> On Dec 1, 2014 12:47 AM, "Edward Shishkin" <edward.shishkin@gmail.com=
>
> wrote:
>>
>>
>> On 12/01/2014 12:04 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>
>>> On Fri, Nov 14, 2014 at 9:09 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc=
@gmail.com> wrote:
>>>>
>>>> As I had no time to make a full backup I went back to 3.10 kernel =
and
>>>> had no
>>>> problem since.
>>>>
>>>> Could this issue be connected with those firefox cache files that =
were
>>>> bad
>>>> (see other mail thread) so I deleted them but for some reason they
>>>> continued
>>>> making problems or problem wasn't really solved by deletion? I ask=
 this
>>>> as
>>>> after long time of stable r4 I got 2 problems in same week so they=
're
>>>> probably related.
>>>>
>>>> On Nov 14, 2014 8:58 PM, "Edward Shishkin" <edward.shishkin@gmail.=
com>
>>>> wrote:
>>>>>
>>>>> On 11/05/2014 12:04 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>>>
>>>>>
>>>>> On Nov 5, 2014 12:48 AM, "Edward Shishkin" <edward.shishkin@gmail=
=2Ecom>
>>>>> wrote:
>>>>>>
>>>>>> On 11/04/2014 02:16 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>>>>>
>>>>>>> Did a fsck of source partition.
>>>>>>> Btw. why is there a reason this corruption appeared when I star=
ted
>>>>>>> using 3.16.2 instead 3.10?
>>>>>>>
>>>>>>
>>>>>> I would also suspect this failed mount.
>>>>>> It could have fatal consequences for the system, and, in particu=
lar
>>>>>> for
>>>>>> your ''/".
>>>>>>
>>>>> Failed mount happened on the partition that I was copying
>>>>> to,/mnt/backup,
>>>>> and it fscked ok.
>>>>> / was partition I was copying from and it had errors.
>>>>>
>>>>>
>>>>>
>>>>> Hi Du=C5=A1an,
>>>>>
>>>>> So, how is your / ?
>>>
>>> So I was feeling brave so I put 3.16.2 back 4 days ago and I got th=
is:
>>>
>>> Nov 30 03:30:36 krshina3 kernel: [293446.436017] ------------[ cut
>>> here ]------------
>>> Nov 30 03:30:36 krshina3 kernel: [293446.436320] kernel BUG at
>>> fs/reiser4/plugin/item/ctail.c:669!
>>> Nov 30 03:30:36 krshina3 kernel: [293446.436652] invalid opcode: 00=
00
>>> [#1] SMP
>>> Nov 30 03:30:36 krshina3 kernel: [293446.436899] CPU: 3 PID: 30235
>>> Comm: rsync Not tainted 3.16.5-gentoo #2
>>> Nov 30 03:30:36 krshina3 kernel: [293446.437275] Hardware name:
>>> Gigabyte Technology Co., Ltd. To be filled by O.E.M./B75-D3V, BIOS =
=465
>>> 07/04/2012
>>> Nov 30 03:30:36 krshina3 kernel: [293446.437834] task:
>>> ffff8801333d4010 ti: ffff880118218000 task.ti: ffff880118218000
>>> Nov 30 03:30:36 krshina3 kernel: [293446.438264] RIP:
>>> 0010:[<ffffffff8115aaf4>]  [<ffffffff8115aaf4>]
>>> do_readpage_ctail+0x2c5/0x3c4
>>> Nov 30 03:30:36 krshina3 kernel: [293446.438768] RSP:
>>> 0018:ffff88011821baa8  EFLAGS: 00010246
>>> Nov 30 03:30:36 krshina3 kernel: [293446.439073] RAX: 0000000000000=
000
>>> RBX: ffff88011821bb78 RCX: 000000000002f35d
>>> Nov 30 03:30:36 krshina3 kernel: [293446.439484] RDX: 0000000000000=
02f
>>> RSI: 0000000000000000 RDI: ffff8800b953b000
>>> Nov 30 03:30:36 krshina3 kernel: [293446.439894] RBP: ffff880169d23=
1a0
>>> R08: 0000000000000000 R09: 0000000000000000
>>> Nov 30 03:30:36 krshina3 kernel: [293446.440304] R10: ffffffff8114e=
b84
>>> R11: 0000000000012368 R12: 0000000000000002
>>> Nov 30 03:30:36 krshina3 kernel: [293446.440713] R13: 0000000000001=
000
>>> R14: ffffea00052f5158 R15: 0000000000000000
>>> Nov 30 03:30:36 krshina3 kernel: [293446.441124] FS:
>>> 00007f3d4d434700(0000) GS:ffff88022e380000(0000)
>>> knlGS:0000000000000000
>>> Nov 30 03:30:36 krshina3 kernel: [293446.441589] CS:  0010 DS: 0000
>>> ES: 0000 CR0: 0000000080050033
>>> Nov 30 03:30:36 krshina3 kernel: [293446.441918] CR2: 0000000000980=
000
>>> CR3: 00000001a0c03000 CR4: 00000000001427e0
>>> Nov 30 03:30:36 krshina3 kernel: [293446.442327] Stack:
>>> Nov 30 03:30:36 krshina3 kernel: [293446.442443]  0000000000000000
>>> ffff88011821bb78 0000000000000000 ffff880169d231a0
>>> Nov 30 03:30:36 krshina3 kernel: [293446.442890]  0000000000000000
>>> ffffea00052f5158 0000000000000000 ffffffff8115ad7b
>>> Nov 30 03:30:36 krshina3 kernel: [293446.443336]  00000000000aa1a1
>>> ffff88011821bca0 ffffea00052f5158 ffff880169d232e0
>>> Nov 30 03:30:36 krshina3 kernel: [293446.443784] Call Trace:
>>> Nov 30 03:30:36 krshina3 kernel: [293446.443926]  [<ffffffff8115ad7=
b>]
>>> ? ctail_readpages_filler+0x188/0x1c9
>>> Nov 30 03:30:36 krshina3 kernel: [293446.444302]  [<ffffffff8115abf=
3>]
>>> ? do_readpage_ctail+0x3c4/0x3c4
>>> Nov 30 03:30:36 krshina3 kernel: [293446.444655]  [<ffffffff810b552=
8>]
>>> ? read_cache_pages+0x91/0xfc
>>> Nov 30 03:30:36 krshina3 kernel: [293446.444990]  [<ffffffff8115b17=
c>]
>>> ? readpages_ctail+0x2c8/0x2e5
>>> Nov 30 03:30:36 krshina3 kernel: [293446.445332]  [<ffffffff81151e7=
2>]
>>> ? readpages_cryptcompress+0x39/0x5f
>>> Nov 30 03:30:36 krshina3 kernel: [293446.445704]  [<ffffffff810b56c=
9>]
>>> ? __do_page_cache_readahead+0x136/0x1d0
>>> Nov 30 03:30:36 krshina3 kernel: [293446.446094]  [<ffffffff810b595=
8>]
>>> ? ondemand_readahead+0x1f5/0x203
>>> Nov 30 03:30:36 krshina3 kernel: [293446.446450]  [<ffffffff810ae76=
1>]
>>> ? generic_file_read_iter+0x191/0x539
>>> Nov 30 03:30:36 krshina3 kernel: [293446.446827]  [<ffffffff810e925=
6>]
>>> ? path_openat+0x24b/0x5ce
>>> Nov 30 03:30:36 krshina3 kernel: [293446.447147]  [<ffffffff810de1e=
6>]
>>> ? new_sync_read+0x6b/0x8f
>>> Nov 30 03:30:36 krshina3 kernel: [293446.447469]  [<ffffffff81151f0=
7>]
>>> ? read_cryptcompress+0x6f/0x97
>>> Nov 30 03:30:36 krshina3 kernel: [293446.447815]  [<ffffffff8114d4c=
0>]
>>> ? reiser4_read_dispatch+0xc7/0x11e
>>> Nov 30 03:30:36 krshina3 kernel: [293446.448181]  [<ffffffff810dedc=
9>]
>>> ? vfs_read+0x84/0x13e
>>> Nov 30 03:30:36 krshina3 kernel: [293446.448483]  [<ffffffff810df25=
c>]
>>> ? SyS_read+0x41/0x84
>>> Nov 30 03:30:36 krshina3 kernel: [293446.448780]  [<ffffffff815346d=
2>]
>>> ? system_call_fastpath+0x16/0x1b
>>> Nov 30 03:30:36 krshina3 kernel: [293446.449135] Code: 01 00 00 e9 =
00
>>> ff ff ff 8b 43 58 41 0f b7 4d 04 48 8d 04 48 48 89 54 c3 28 e9 ea f=
e
>>> ff ff 44 8b a3 88 00 00 00 41 83 fc 02 75 02 <0f> 0b 0f 87 87 00 00=
 00
>>> 41 83 fc 01 0f 85 de 00 00 00 49 8b 56
>>> Nov 30 03:30:36 krshina3 kernel: [293446.450567] RIP
>>> [<ffffffff8115aaf4>] do_readpage_ctail+0x2c5/0x3c4
>>> Nov 30 03:30:36 krshina3 kernel: [293446.450934]  RSP <ffff88011821=
baa8>
>>> Nov 30 03:30:36 krshina3 kernel: [293446.562843] ---[ end trace
>>> 45473ce04b35219f ]---
>>>
>>> Looks like same error like last time I used 3.16. Kernel 3.10 laste=
d
>>> with 20 days uptime without problems this month and 3.16 had this o=
ops
>>> after 3 days.
>>
>>
>>
>> Unfortunately, there is no any ideas...
>> I can port reiser4-for-3.10 stuff to 3.16. Will you test this port?
>>
>
> Ofcourse!
>
=46unny thing is that again only 2 twigs were damaged..
Now I'm going to use R4-from3.11-ported-to3.16.patch and report on the =
results.

Results from fsck --build-fs:

=46SCK: node.c: 108: repair_node_items_check: Node (4078203), items (60=
) and (61):
Wrong order of keys.
=46SCK: filter.c: 407: repair_filter_update_traverse: Node (4078203): t=
he node is
unrecoverable. Pointed from the node (655473), item (14), unit (0). Rem=
oved.
=46SCK: node.c: 108: repair_node_items_check: Node (4078899), items (6)=
 and (7):
Wrong order of keys.
=46SCK: filter.c: 407: repair_filter_update_traverse: Node (4078899): t=
he node is
unrecoverable. Pointed from the node (655473), item (14), unit (0). Rem=
oved.
=46SCK: node.c: 108: repair_node_items_check: Node (4079383), items (0)=
 and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4079488), items (0)=
 and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4079546), items (0)=
 and (1):
Wrong order of keys.
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
=46SCK: node.c: 108: repair_node_items_check: Node (4091337), items (0)=
 and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4091990), items (0)=
 and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4092423), items (1)=
 and (2):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4093016), items (0)=
 and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4093690), items (27=
) and (28):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4094525), items (0)=
 and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4096175), items (0)=
 and (1):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4099659), items (12=
) and (13):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4099663), items (21=
) and (22):
Wrong order of keys.
=46SCK: node.c: 108: repair_node_items_check: Node (4113492), items (0)=
 and (1):
Wrong order of keys.




>
>
> OK, I'll try to port it ASAP,
> for now fsck your / .. .
>
> Thanks,
> Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
