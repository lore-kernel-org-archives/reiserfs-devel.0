From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 Oops
Date: Wed, 05 Jan 2011 13:10:49 +0100
Message-ID: <4D245FC9.4040006@gmail.com>
References: <4D0E569D.4010503@gmail.com>	<4D0E8844.60902@gmail.com>	<AANLkTim_Wbqj6C5A91ecqBk3BkcvcggAcQkdNqVP062x@mail.gmail.com> <AANLkTinbSRgNhi5heC2npLNzU4xsuUjzEXBD5qDBiYDw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=pzaLjNmTbvQyHEhR3y7U4JUWYGRW189qcOnXn9qqIII=;
        b=Yn8d2BOe+415AJz4SDeZ2hmDWcmx5kObttV0mjx7l0j8w5AJOI2l9Oi69YX6Y3l2TZ
         TfkYYX2coO7VafkqCQVWAFjGNk876n7uERIMgzKwD+0OCV0jwzTr6jL/GzZyg+s+NzEK
         9HMAHl/yDCV32gGfRM4662bC1GnHU9n0bgqcE=
In-Reply-To: <AANLkTinbSRgNhi5heC2npLNzU4xsuUjzEXBD5qDBiYDw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Dushan Tcholich <dusanc@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 01/05/2011 12:04 PM, Dushan Tcholich wrote:
> Hello
>
> Can we have some version number after kernel version for fixups as
> latest upload for .36 on kernel.org is from 27-Dec-2010 21:17
> That's the 3rd version for .36 with same name, so there'll probably b=
e
> some confusion :D
>   =20

Ok, I'll put additional ones suffixed with "-x" (x=3D1, 2, ...)

Edward.

> Thanks
>
> Dushan
>
> On Mon, Dec 20, 2010 at 11:31 PM, Edward Shishkin
> <edward.shishkin@gmail.com>  wrote:
>   =20
>> Hello.
>>
>> Could you please try the attached patch?
>>
>> This patch is against reiser4-for-2.6.36.
>> Also please make sure you have the latest one
>> (I have updated the stuff  11-Dec-2010).
>>
>> Report, if any problems.
>>
>> Thanks,
>> Edward.
>>
>>
>> On Sun, Dec 19, 2010 at 11:33 PM, Edward Shishkin
>> <edward.shishkin@gmail.com>  wrote:
>>     =20
>>> =D0=90=D0=BD=D0=B4=D1=80=D0=B5=D0=B9 =D0=9A=D0=BE=D0=BB=D1=87=D0=B5=
=D0=BD=D0=BA=D0=BE wrote:
>>>       =20
>>>> Wanted to try reiser4. I have compiled a kernel with reiser4, form=
at
>>>> the partition and began to copy the folder /home.
>>>> After a short time the screen goes black and there was one console
>>>> with the error output. After switching to other tty and back up
>>>> continued. dmesg output copied to the pastebin
>>>> (http://pastebin.com/XyDKWJ8J).
>>>> This was repeated several times and the computer hangs perfectly s=
till.
>>>> I have ubuntu 10.10 on a laptop Acer Aspire 7720z.
>>>>         =20
>>> Yup, I see the bug:
>>> instead of writing pages reiser4 kicks ext4 to do it,
>>> and, I guess, doesn't clear journal_info (this is why
>>> ext4 oopses).
>>>
>>> [  278.062271]  [<c0318822>] ? jbd2_journal_start+0x12/0x20
>>> [  278.062322]  [<c02f5858>] ? ext4_journal_start_sb+0xc8/0x100
>>> [  278.062377]  [<c02e0957>] ? ext4_meta_trans_blocks+0x67/0xc0
>>> [  278.062431]  [<c02e47e3>] ? ext4_da_writepages+0x203/0x560
>>> [  278.062484]  [<c060fccd>] ? _raw_spin_lock+0xd/0x10
>>> [  278.062530]  [<c0281ca2>] ? flush_some_atom+0x312/0x540
>>> [  278.062578]  [<c02a4cdd>] ? writepages_cryptcompress+0x19d/0x220
>>> [  278.062636]  [<c02913a8>] ? reiser4_writeout+0xa8/0x1a0
>>> [  278.062684]  [<c022c186>] ? iput+0x36/0x270
>>> [  278.062724]  [<c02367e4>] ? generic_writeback_sb_inodes+0xe4/0x1=
50
>>> [  278.062782]  [<c01dfaac>] ? do_writepages+0x1c/0x40
>>> [  278.062826]  [<c0236125>] ? writeback_single_inode+0x85/0x250
>>> [  278.062877]  [<c060fccd>] ? _raw_spin_lock+0xd/0x10
>>> [  278.062921]  [<c028db64>] ? reiser4_writeback_inodes+0xa4/0x130
>>> [  278.062974]  [<c02367b1>] ? generic_writeback_sb_inodes+0xb1/0x1=
50
>>> [  278.063031]  [<c0236c6b>] ? writeback_inodes_wb+0x10b/0x150
>>>
>>>
>>> here should be writeback_sb_inodes() instead of writeback_inodes_wb
>>>
>>>
>>> [  278.063082]  [<c0291d06>] ? entd_flush+0xa6/0xe0
>>> [  278.063127]  [<c0291d40>] ? entd+0x0/0x240
>>> [  278.063166]  [<c0291e51>] ? entd+0x111/0x240
>>> [  278.063208]  [<c0165fd0>] ? autoremove_wake_function+0x0/0x50
>>> [  278.064008]  [<c0291d40>] ? entd+0x0/0x240
>>> [  278.067417]  [<c0165ba4>] ? kthread+0x74/0x80
>>> [  278.067417]  [<c0165b30>] ? kthread+0x0/0x80
>>> [  278.067417]  [<c010357e>] ? kernel_thread_helper+0x6/0x10
>>>
>>>
>>> It is interesting that the path
>>> entd ->  writeback_inodes_wb ->  ext4_da_writepages
>>> has never been triggered on my testing machine (I also
>>> have reiser4 and ext4 there). Perhaps, this is because
>>> of different system configurations.
>>>
>>> I'll try to fix it in the near future, so that you'll be able to
>>> try reiser4.
>>>
>>> Thanks for your report,
>>> Edward.
>>>
>>>       =20
>>     =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
