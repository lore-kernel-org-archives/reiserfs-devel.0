From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: Kernel config option which causes reiser4 to be instable
Date: Tue, 11 Dec 2012 21:54:15 +0100
Message-ID: <CADW=+3nctUOzekb0NMV88CCqJj2Z8fgC=HjuoesirhNPCBxy_A@mail.gmail.com>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com>
	<CADW=+3m2s9Yyi7Da1nieTXjFx=KcfLch+mwoRTB50vGj+mZA=w@mail.gmail.com>
	<CADW=+3kz__Rd_29Sx8mdiA0b_S11pEsXLYG5AGzjAVBC4Hck8w@mail.gmail.com>
	<2612159.zxK0OqJdpP@intelfx-laptop>
	<50C77C83.4080402@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=OqD+Du6aWCL3ARZC0Ixn7v2l1mK9y7fmYT17lwXHHvU=;
        b=xt56ONVVAa1Ksf1EngT7/G0Pcv4IWmp2s4dZcLakRgImC1LUI4ET86CLdmvSpkoM8x
         ZAYZY7a816vbw6wfdCP5spBJkazfQBc2WqfdkWohLsIuzBS/AjEuDV1aM6irD1feRKH7
         Eu6LHk1TwYwmkEkion+ZyZ624ZC/hUZ2tdOVnfXQeH2PTgprgYhOuDbokqbf1+ivDZOO
         Pq9Kr9vXNPtWS+qkntz+Ntqz7PJIp3/b06jBKKCnEyfc8+QOVvnEPSOszq6V0NHT6glg
         v7/ID12g9XXdTksiSqXJyidKSuykTc/QZMpyhNdyLEGCRm199Y2f/BEWF72b+UZ29VdQ
         PdoA==
In-Reply-To: <50C77C83.4080402@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Tue, Dec 11, 2012 at 7:33 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> On 12/11/2012 04:08 PM, Ivan Shapovalov wrote:
>>
>> Hello!
>
>
> Hello.
>
>
>>
>> With help of Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmail.com> who provi=
ded his kernel config
>> diff I've found a kernel option which, when disabled, greatly reduce=
s
>> (hopefully to zero, but need time to verify it) corruption rate in
>> reiser4.
>>
>> It's CONFIG_TRANSPARENT_HUGEPAGE (or something which is used by it l=
ike
>> CONFIG_COMPACTION or CONFIG_MIGRATION).
>> For now I'm testing it with CONFIG_TRANSPARENT_HUGEPAGE disabled
>
>
> How long?
>
=46or me the difference in uptime is months without vs hours with it :D
on 2.6.39.4

>
>>   on kernel
>> 3.6.10, and everything seems to be OK so far (so the workaround is
>> version-
>> agnostic).
>>
>> Edward, are there any guesses on what can make reiser4 choke on
>> hugepages/compaction/migration?
>
>
> TBH, no ideas. They (hugepages) are _transparent_.
> It means we shouldn't suffer in theory ;)
>
>
>>   I'm not even barely familiar with the kernel
>> internals.
>>
>> Thanks,
>> Ivan.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
