From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: Reiser4 for 3.16.2 problem: mount: mount /dev/md125 on
 /mnt/backup failed: Cannot allocate memory
Date: Mon, 1 Dec 2014 00:04:01 +0100
Message-ID: <CADW=+3m75JHiu2fWHJ5mq0Q4XUd2vkp5An1mKsOPkd8OWQnz+w@mail.gmail.com>
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
	<CADW=+3k7mvPTc0x02UKYbg6Jq=zUQ5dORiUULNiB7kFLXjiG6g@mail.gmail.com>
	<545965C7.5010304@gmail.com>
	<CADW=+3k40KVKf5hLD1BgJ8a6uj=ZJ=T_gOmijDZVxWS3pK_6AQ@mail.gmail.com>
	<54665EFD.7030304@gmail.com>
	<CADW=+3mrqv=BjX8TCpRszFbr3OYEvgOk0OpcYe56f6OJmYDZbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=CScEIAQTidJBp966wNXHp4xDR1o77qht/EIUafaIz9U=;
        b=ckiOu032EqRL+UYzWmAj0UFu6cztHjV+CiH7OK3Vrjd2dmvjYYizcqUkOXmF9KHM2g
         /i1JMI8atuNoxARbfIaSoyQw/tUZRKC7lwWD7g6PijwaMESoeSDy/hevtNazxjLW86Hh
         CKo4qXB5pfQTWDEoJBVKH2u8K/OaYziZ5iY2YDrKxtB0oyWdGKGQlsX+p6GAYGoy6MWd
         GZ3rP1QxKbXYYfNwmiLli2tR/S8I8hgTsRjcb1xQmA/6X5IlOLi8MHSVc5QkikKiodg1
         o1nwsXa9Xe7WzoGwGDvlzAEGWfyv1Uok+JjShgiE/DkPuWz3wazrviI+erFLrEtcKg+l
         ZWEg==
In-Reply-To: <CADW=+3mrqv=BjX8TCpRszFbr3OYEvgOk0OpcYe56f6OJmYDZbQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>
Cc: Ivan Shapovalov <intelfx100@gmail.com>

On Fri, Nov 14, 2014 at 9:09 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gma=
il.com> wrote:
> As I had no time to make a full backup I went back to 3.10 kernel and=
 had no
> problem since.
>
> Could this issue be connected with those firefox cache files that wer=
e bad
> (see other mail thread) so I deleted them but for some reason they co=
ntinued
> making problems or problem wasn't really solved by deletion? I ask th=
is as
> after long time of stable r4 I got 2 problems in same week so they're
> probably related.
>
> On Nov 14, 2014 8:58 PM, "Edward Shishkin" <edward.shishkin@gmail.com=
>
> wrote:
>>
>> On 11/05/2014 12:04 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>
>>
>> On Nov 5, 2014 12:48 AM, "Edward Shishkin" <edward.shishkin@gmail.co=
m>
>> wrote:
>> >
>> > On 11/04/2014 02:16 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>> >>
>> >> Did a fsck of source partition.
>> >> Btw. why is there a reason this corruption appeared when I starte=
d
>> >> using 3.16.2 instead 3.10?
>> >>
>> >
>> >
>> > I would also suspect this failed mount.
>> > It could have fatal consequences for the system, and, in particula=
r for
>> > your ''/".
>> >
>>
>> Failed mount happened on the partition that I was copying to,/mnt/ba=
ckup,
>> and it fscked ok.
>> / was partition I was copying from and it had errors.
>>
>>
>>
>> Hi Du=C5=A1an,
>>
>> So, how is your / ?
So I was feeling brave so I put 3.16.2 back 4 days ago and I got this:

Nov 30 03:30:36 krshina3 kernel: [293446.436017] ------------[ cut
here ]------------
Nov 30 03:30:36 krshina3 kernel: [293446.436320] kernel BUG at
fs/reiser4/plugin/item/ctail.c:669!
Nov 30 03:30:36 krshina3 kernel: [293446.436652] invalid opcode: 0000 [=
#1] SMP
Nov 30 03:30:36 krshina3 kernel: [293446.436899] CPU: 3 PID: 30235
Comm: rsync Not tainted 3.16.5-gentoo #2
Nov 30 03:30:36 krshina3 kernel: [293446.437275] Hardware name:
Gigabyte Technology Co., Ltd. To be filled by O.E.M./B75-D3V, BIOS F5
07/04/2012
Nov 30 03:30:36 krshina3 kernel: [293446.437834] task:
ffff8801333d4010 ti: ffff880118218000 task.ti: ffff880118218000
Nov 30 03:30:36 krshina3 kernel: [293446.438264] RIP:
0010:[<ffffffff8115aaf4>]  [<ffffffff8115aaf4>]
do_readpage_ctail+0x2c5/0x3c4
Nov 30 03:30:36 krshina3 kernel: [293446.438768] RSP:
0018:ffff88011821baa8  EFLAGS: 00010246
Nov 30 03:30:36 krshina3 kernel: [293446.439073] RAX: 0000000000000000
RBX: ffff88011821bb78 RCX: 000000000002f35d
Nov 30 03:30:36 krshina3 kernel: [293446.439484] RDX: 000000000000002f
RSI: 0000000000000000 RDI: ffff8800b953b000
Nov 30 03:30:36 krshina3 kernel: [293446.439894] RBP: ffff880169d231a0
R08: 0000000000000000 R09: 0000000000000000
Nov 30 03:30:36 krshina3 kernel: [293446.440304] R10: ffffffff8114eb84
R11: 0000000000012368 R12: 0000000000000002
Nov 30 03:30:36 krshina3 kernel: [293446.440713] R13: 0000000000001000
R14: ffffea00052f5158 R15: 0000000000000000
Nov 30 03:30:36 krshina3 kernel: [293446.441124] FS:
00007f3d4d434700(0000) GS:ffff88022e380000(0000)
knlGS:0000000000000000
Nov 30 03:30:36 krshina3 kernel: [293446.441589] CS:  0010 DS: 0000
ES: 0000 CR0: 0000000080050033
Nov 30 03:30:36 krshina3 kernel: [293446.441918] CR2: 0000000000980000
CR3: 00000001a0c03000 CR4: 00000000001427e0
Nov 30 03:30:36 krshina3 kernel: [293446.442327] Stack:
Nov 30 03:30:36 krshina3 kernel: [293446.442443]  0000000000000000
ffff88011821bb78 0000000000000000 ffff880169d231a0
Nov 30 03:30:36 krshina3 kernel: [293446.442890]  0000000000000000
ffffea00052f5158 0000000000000000 ffffffff8115ad7b
Nov 30 03:30:36 krshina3 kernel: [293446.443336]  00000000000aa1a1
ffff88011821bca0 ffffea00052f5158 ffff880169d232e0
Nov 30 03:30:36 krshina3 kernel: [293446.443784] Call Trace:
Nov 30 03:30:36 krshina3 kernel: [293446.443926]  [<ffffffff8115ad7b>]
? ctail_readpages_filler+0x188/0x1c9
Nov 30 03:30:36 krshina3 kernel: [293446.444302]  [<ffffffff8115abf3>]
? do_readpage_ctail+0x3c4/0x3c4
Nov 30 03:30:36 krshina3 kernel: [293446.444655]  [<ffffffff810b5528>]
? read_cache_pages+0x91/0xfc
Nov 30 03:30:36 krshina3 kernel: [293446.444990]  [<ffffffff8115b17c>]
? readpages_ctail+0x2c8/0x2e5
Nov 30 03:30:36 krshina3 kernel: [293446.445332]  [<ffffffff81151e72>]
? readpages_cryptcompress+0x39/0x5f
Nov 30 03:30:36 krshina3 kernel: [293446.445704]  [<ffffffff810b56c9>]
? __do_page_cache_readahead+0x136/0x1d0
Nov 30 03:30:36 krshina3 kernel: [293446.446094]  [<ffffffff810b5958>]
? ondemand_readahead+0x1f5/0x203
Nov 30 03:30:36 krshina3 kernel: [293446.446450]  [<ffffffff810ae761>]
? generic_file_read_iter+0x191/0x539
Nov 30 03:30:36 krshina3 kernel: [293446.446827]  [<ffffffff810e9256>]
? path_openat+0x24b/0x5ce
Nov 30 03:30:36 krshina3 kernel: [293446.447147]  [<ffffffff810de1e6>]
? new_sync_read+0x6b/0x8f
Nov 30 03:30:36 krshina3 kernel: [293446.447469]  [<ffffffff81151f07>]
? read_cryptcompress+0x6f/0x97
Nov 30 03:30:36 krshina3 kernel: [293446.447815]  [<ffffffff8114d4c0>]
? reiser4_read_dispatch+0xc7/0x11e
Nov 30 03:30:36 krshina3 kernel: [293446.448181]  [<ffffffff810dedc9>]
? vfs_read+0x84/0x13e
Nov 30 03:30:36 krshina3 kernel: [293446.448483]  [<ffffffff810df25c>]
? SyS_read+0x41/0x84
Nov 30 03:30:36 krshina3 kernel: [293446.448780]  [<ffffffff815346d2>]
? system_call_fastpath+0x16/0x1b
Nov 30 03:30:36 krshina3 kernel: [293446.449135] Code: 01 00 00 e9 00
ff ff ff 8b 43 58 41 0f b7 4d 04 48 8d 04 48 48 89 54 c3 28 e9 ea fe
ff ff 44 8b a3 88 00 00 00 41 83 fc 02 75 02 <0f> 0b 0f 87 87 00 00 00
41 83 fc 01 0f 85 de 00 00 00 49 8b 56
Nov 30 03:30:36 krshina3 kernel: [293446.450567] RIP
[<ffffffff8115aaf4>] do_readpage_ctail+0x2c5/0x3c4
Nov 30 03:30:36 krshina3 kernel: [293446.450934]  RSP <ffff88011821baa8=
>
Nov 30 03:30:36 krshina3 kernel: [293446.562843] ---[ end trace
45473ce04b35219f ]---

Looks like same error like last time I used 3.16. Kernel 3.10 lasted
with 20 days uptime without problems this month and 3.16 had this oops
after 3 days.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
