From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-2.6.36
Date: Mon, 10 Jan 2011 16:28:27 +0100
Message-ID: <4D2B259B.7010203@gmail.com>
References: <4CE87674.4090909@gmail.com> <4CF4CD6E.4040305@gmx.de> <4CF4E224.2040203@gmail.com> <4CF51FAF.4040904@gmx.de> <4D2B1F4C.7090706@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D2B1F4C.7090706@gmx.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Simon <sur3@gmx.de>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Simon wrote:
> Ah, sorry,
> finally found the error, it isnt the reiser4, but a buggy network-driver.
>   


Nup, that was exactly reiser4 badness: it stepped to other journalling
file systems (ext3 in your case). Here is similar bugreport:

http://marc.info/?l=reiserfs-devel&m=129278532029566&w=2

It was fixed, please upgrade your reiser4 stuff:
http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/reiser4-for-2.6.36.patch.gz

Sorry that I've forgot to cc you.

Thanks,
Edward.


> Anyway i got some broken files on reiser4
> http://paste.pocoo.org/show/318296/ - badblocks and memory seem to be
> ok, probably it was a result of the kernel-hang-ups?
>
> Greets
> Simon
>
> Am 30.11.2010 17:00, schrieb Simon:
>   
>>> Are you sure that you have reiser4-for-2.6.36
>>> stuff applied? The problem has gone for me...
>>>       
>> Yep, looked it up in my zsh-history, so i'm sure:
>> % patch -p1 < ../reiser4-for-2.6.36.patch
>>
>>     
>>> Could you send kernel messages?
>>>       
>> I wish i could, but as it seemes the messages from the crash aint saved,
>> probably because the kernel does crash completely and so not sync anymore.
>> Anyway i found some messages hours before the crash, probably the bug
>> depends on them or they have nothing to do with it, but they mention
>> ext3 and sda7, this is funny, as ext3 is my root-partition on sda1, and
>> sda7 is my home-partition with reiser4:
>>
>> Nov 29 20:49:40 localhost kernel: [61364.033613] Pid: 1856, comm:
>> ent:sda7! Tainted: P            2.6.36-gentoo-r1 #1
>> Nov 29 20:49:40 localhost kernel: [61364.033617] Call Trace:
>> Nov 29 20:49:40 localhost kernel: [61364.033627]  [<ffffffff81167775>] ?
>> ext3_write_inode+0x45/0x50
>> Nov 29 20:49:40 localhost kernel: [61364.033633]  [<ffffffff810dfbf4>] ?
>> writeback_single_inode+0x214/0x2a0
>> Nov 29 20:49:40 localhost kernel: [61364.033637]  [<ffffffff810e0005>] ?
>> generic_writeback_sb_inodes+0xe5/0x170
>> Nov 29 20:49:40 localhost kernel: [61364.033640]  [<ffffffff810e09c0>] ?
>> writeback_inodes_wb+0x140/0x190
>> Nov 29 20:49:40 localhost kernel: [61364.033644]  [<ffffffff8113b432>] ?
>> entd_flush+0xa2/0xe0
>> Nov 29 20:49:40 localhost kernel: [61364.033647]  [<ffffffff8113b59d>] ?
>> entd+0x12d/0x280
>> Nov 29 20:49:40 localhost kernel: [61364.033652]  [<ffffffff810561d0>] ?
>> autoremove_wake_function+0x0/0x30
>> Nov 29 20:49:40 localhost kernel: [61364.033655]  [<ffffffff8113b470>] ?
>> entd+0x0/0x280
>> Nov 29 20:49:40 localhost kernel: [61364.033658]  [<ffffffff8113b470>] ?
>> entd+0x0/0x280
>> Nov 29 20:49:40 localhost kernel: [61364.033661]  [<ffffffff81055d56>] ?
>> kthread+0x96/0xa0
>> Nov 29 20:49:40 localhost kernel: [61364.033665]  [<ffffffff81003154>] ?
>> kernel_thread_helper+0x4/0x10
>> Nov 29 20:49:40 localhost kernel: [61364.033668]  [<ffffffff81055cc0>] ?
>> kthread+0x0/0xa0
>> Nov 29 20:49:40 localhost kernel: [61364.033671]  [<ffffffff81003150>] ?
>> kernel_thread_helper+0x0/0x10
>>     
>
>
>   

