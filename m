From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Information Request
Date: Mon, 24 Oct 2011 14:31:48 +0200
Message-ID: <4EA55AB4.10700@gmail.com>
References: <CAMjNLwoY2nx=1FczwigL0WSubKattSq69sZQT2veRUERbnqT3A@mail.gmail.com> <CADW=+3kczMJHPVJrJJtKLVhX1CW34nHWRrZUmtZ9c038Syh85g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CADW=+3kczMJHPVJrJJtKLVhX1CW34nHWRrZUmtZ9c038Syh85g@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: Matias Seco <matias.jose.seco@gmail.com>, reiserfs-devel@vger.kernel.org

If you need reiser4 patches against some vanilla kernel, send me a
request.

NOTE: reiser4 is prone to crash under high workload because of
old bug, which is not yet fixed. Fsck copes with corruptions
caused by this bug (appearing objects with inconsistent key order),
however, this makes reiser4 improper for using in production
systems (file servers, etc.)

Thanks,
Edward.


On 10/24/2011 02:17 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> Hello,
>
> You can find enough informations in a FAQ I made for Gentoo
> http://forums.gentoo.org/viewtopic-p-5200706.html#5200706
>
> Have fun
>
> Dushan
>
> On Mon, Oct 24, 2011 at 2:10 PM, Matias Seco<matias.jose.seco@gmail.c=
om>  wrote:
>> Greetings,
>> i found very interesting about testing this filesystem. Unfortunatel=
y
>> i got late with my project, because i couldn't find useful resources
>> from google for reiser4,
>> mainly because the reiser4's kernel Wiki was down due to maintenainc=
e.
>> After time, i saw that the page still didn't return: this is why i
>> would like to ask you, if you can point me resources, to understand
>> how to configure the reiser4 on my HDD.
>>
>> Salut, Matias
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-d=
evel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
