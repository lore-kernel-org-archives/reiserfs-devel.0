From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: Information Request
Date: Tue, 25 Oct 2011 09:55:56 +0200
Message-ID: <CADW=+3nptHoFJ3QyS15oc789h9oEGC4_bJ4ARE7EFZKWJfgwQQ@mail.gmail.com>
References: <CAMjNLwoY2nx=1FczwigL0WSubKattSq69sZQT2veRUERbnqT3A@mail.gmail.com>
	<CADW=+3kczMJHPVJrJJtKLVhX1CW34nHWRrZUmtZ9c038Syh85g@mail.gmail.com>
	<4EA55AB4.10700@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=LhlQBLCXvnS/WDpEvjE5RFzFb6NiiunvkXZ/Cr8TzE8=;
        b=Rygl9N0CtTrKhbr+21E5YC7jaUL/K7p0ErTysu5cSDjm+8oGmKLvO13fYSjAOZR8eV
         Cxx+d+7YYBC5Ye+UiZbpnb97ALcp+MXjqwYSfy09tyXUZEWNf2WHdAKtn00UBxzueZ82
         SjGWk5U1yQZkHqNDdG2wHUTkibiYrMJbKng5o=
In-Reply-To: <4EA55AB4.10700@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Matias Seco <matias.jose.seco@gmail.com>, reiserfs-devel@vger.kernel.org

Hello

2011/10/24 Edward Shishkin <edward.shishkin@gmail.com>:
> If you need reiser4 patches against some vanilla kernel, send me a
> request.
>
> NOTE: reiser4 is prone to crash under high workload because of
> old bug, which is not yet fixed. Fsck copes with corruptions
> caused by this bug (appearing objects with inconsistent key order),
> however, this makes reiser4 improper for using in production
> systems (file servers, etc.)
>
Could we get a list of confirmed bugs for latest R4, so that we know
its limitations and to avoid dangerous use cases.
Will kernel.org place for patches be back?
Can we get 3.0 patch and pitfall list :) ?
=46rom all the FSes I try I still get the best data safety and response
time with R4, even in this state :)


Thanks

Dusan


> Thanks,
> Edward.
>
>
> On 10/24/2011 02:17 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>
>> Hello,
>>
>> You can find enough informations in a FAQ I made for Gentoo
>> http://forums.gentoo.org/viewtopic-p-5200706.html#5200706
>>
>> Have fun
>>
>> Dushan
>>
>> On Mon, Oct 24, 2011 at 2:10 PM, Matias Seco<matias.jose.seco@gmail.=
com>
>> =C2=A0wrote:
>>>
>>> Greetings,
>>> i found very interesting about testing this filesystem. Unfortunate=
ly
>>> i got late with my project, because i couldn't find useful resource=
s
>>> from google for reiser4,
>>> mainly because the reiser4's kernel Wiki was down due to maintenain=
ce.
>>> After time, i saw that the page still didn't return: this is why i
>>> would like to ask you, if you can point me resources, to understand
>>> how to configure the reiser4 on my HDD.
>>>
>>> Salut, Matias
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe reiserfs-=
devel"
>>> in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.=
html
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-d=
evel"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
