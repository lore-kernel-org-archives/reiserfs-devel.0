From: Teran McKinney <sega01@gmail.com>
Subject: Re: Reiser4: Compilation Error on 2.6.28.1_[Scanned]
Date: Sun, 25 Jan 2009 17:52:07 +0000
Message-ID: <b245135e0901250952g3bfb13e2pc413ac2660964636@mail.gmail.com>
References: <200901251815.08030.volkerarmin@googlemail.com>
	 <497CA235.9030504@gmail.com>
	 <200901251837.58313.volkerarmin@googlemail.com>
	 <497CA4F1.3050807@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Lj9ou+HEqxZmQ/IcYO6UNAQ4A3Vp2bFjjcU9CVvdgtI=;
        b=VpBvaFqP16EYYwjQCVBIKlvharqYoqis7+ovJfPl+he+RhLTGdwUncBz7K33SDSyF4
         wE4GWix1OJxfyEN/xfbjL9oE+vXbEbDAc5AqePPZrCCbpdl5uI/63BXm1fXDm3AbuchN
         ZjPb7VxPWfK0qKPdvIY1/zl/we22xVW3RCi64=
In-Reply-To: <497CA4F1.3050807@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Volker Armin Hemmann <volkerarmin@googlemail.com>, reiserfs-devel@vger.kernel.org

I could build 2.6.28.1 fine with Reiser4, but if I applied Ingo's
patch, it would not build. I've had no issues, but haven't used
Reiser4 heavily at all yet.

Cheers,
Teran

PS: 2.6.28.2 is out.

On Sun, Jan 25, 2009 at 17:44, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Volker Armin Hemmann wrote:
>> On Sonntag 25 Januar 2009, Edward Shishkin wrote:
>>
>>> Volker Armin Hemmann wrote:
>>>
>>>> On Montag 19 Januar 2009, Edward Shishkin wrote:
>>>>
>>>>> Ingo Bormuth wrote:
>>>>>
>>>>>> Reiser4-for-2.6.28 does apply but fails to compile on
>>>>>> vanilla-2.6.28.1 due to the following commit:
>>>>>>
>>>>>> http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.g=
it;a=3Dcomm
>>>>>> it diff;h=3D54566b2c1594c2326a645a3551f9d989f7ba3c5e
>>>>>>
>>>>>> Attached is a tiny fix which works fine here.
>>>>>>
>>>>> yeah, with your patch it will act as earlier,
>>>>> however, -mm guys decided to get rig of __GFP_FS flag:
>>>>> http://userweb.kernel.org/~akpm/mmotm/broken-out/fs-symlink-write=
_begin-
>>>>> all ocation-context-fix-reiser4-fix.patch it seems they found it
>>>>> deadlocky..
>>>>>
>>>> so without Ingo Bormuth's patch you can't use r4 with 2.6.28.1
>>>>
>>> Ingo's patch is against -rc
>>>
>>>
>>>>  and later and
>>>> with his patch there is a risk of deadlocks?
>>>>
>>> Not sure.
>>> Nobody complained so far..
>>>
>>
>> hm, I had two lockups with 2.6.28 and your r4 patch so far. Suddenly=
 the box
>> only responded to sysrq
>
> Would you please send the sysrq-t output?
>
>
>>  - and on reboot the software raid5 with my r4
>> partitions on needed a resync. Might be related or not. I am back to=
 2.6.27
>> which never showed any misbehaviour.
>>
>> Gl=C3=BCck Auf,
>> Volker
>>
>>
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
