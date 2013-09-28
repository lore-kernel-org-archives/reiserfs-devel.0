From: m@thieu.so
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Sat, 28 Sep 2013 16:20:59 +0000
Message-ID: <20130928162059.Horde.e5qchgOzKFDhZg1LolArqA2@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	DelSp=Yes"
To: Christopher Gentile <cnjgentile@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Evgeniy <iron.udjin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Quoting Chris Gentile <cnjgentile@gmail.com>> Quick update..... Matt =20
your tree is solid as a rock compiling and
> running mighty fine with the newest linux-next ****27 patch applied,
> UKSM, and custom CFLAGS for kernel (march =3D native option in kernel
> config + added cflags to make file -O2 -march=3Dnative -mtune=3Dnativ=
e
> -mvzeroupper -mno-aes) on 2nd gen. Corei7 3930k
>
> Your patches and Ivans and rock solid, awesome to see.
>
> Any way you could send the latest 3.12-rcxx patches seperately? I'd l=
ike
> to apply them to some other kernels, I have some old 20 kernels in
> /usr/src/ I'd like to try on the 3.12's if that' would be OK with you=
=2E
> If not , totally understandable.
>
> Thanks again,
> Chris
>
> On 09/24/13 20:34, Chris Gentile wrote:
>> Awesome, did it compile? I was using that rc2+a linux-next patch fro=
m
>> Linus but I don't think that's the stablest of ideas :)
>>
>> I'll grab it in a few mins
>>
>> C
>>
>> On 09/25/13 00:31, Mathieu Belanger wrote:
>>> I just uploaded the kernel 3.12-rc2 in my git will all the patchs.
>>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
I can extract patch later but you can do it yourself with git.

Clean the git if you modified files (make mrproper/git reset --hard) =20
and do : git diff v3.12-rc2 reiser4-for-3.12-rc2 > =20
/tmp/reiser4-for-3.12-rc2

Chris Gentile <cnjgentile@gmail.com> a =C3=A9crit=C2=A0:


--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
