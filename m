From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4: Compilation Error on 2.6.28.1_[Scanned]
Date: Sun, 25 Jan 2009 20:44:17 +0300
Message-ID: <497CA4F1.3050807@gmail.com>
References: <200901251815.08030.volkerarmin@googlemail.com> <497CA235.9030504@gmail.com> <200901251837.58313.volkerarmin@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200901251837.58313.volkerarmin@googlemail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Volker Armin Hemmann <volkerarmin@googlemail.com>
Cc: reiserfs-devel@vger.kernel.org

Volker Armin Hemmann wrote:
> On Sonntag 25 Januar 2009, Edward Shishkin wrote:
>  =20
>> Volker Armin Hemmann wrote:
>>    =20
>>> On Montag 19 Januar 2009, Edward Shishkin wrote:
>>>      =20
>>>> Ingo Bormuth wrote:
>>>>        =20
>>>>> Reiser4-for-2.6.28 does apply but fails to compile on
>>>>> vanilla-2.6.28.1 due to the following commit:
>>>>>
>>>>> http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.gi=
t;a=3Dcomm
>>>>> it diff;h=3D54566b2c1594c2326a645a3551f9d989f7ba3c5e
>>>>>
>>>>> Attached is a tiny fix which works fine here.
>>>>>          =20
>>>> yeah, with your patch it will act as earlier,
>>>> however, -mm guys decided to get rig of __GFP_FS flag:
>>>> http://userweb.kernel.org/~akpm/mmotm/broken-out/fs-symlink-write_=
begin-
>>>> all ocation-context-fix-reiser4-fix.patch it seems they found it
>>>> deadlocky..
>>>>        =20
>>> so without Ingo Bormuth's patch you can't use r4 with 2.6.28.1
>>>      =20
>> Ingo's patch is against -rc
>>
>>    =20
>>>  and later and
>>> with his patch there is a risk of deadlocks?
>>>      =20
>> Not sure.
>> Nobody complained so far..
>>    =20
>
> hm, I had two lockups with 2.6.28 and your r4 patch so far. Suddenly =
the box=20
> only responded to sysrq

Would you please send the sysrq-t output?

=20
>  - and on reboot the software raid5 with my r4=20
> partitions on needed a resync. Might be related or not. I am back to =
2.6.27=20
> which never showed any misbehaviour.
>
> Gl=C3=BCck Auf,
> Volker
>
>
>  =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
