From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Kernel config option which causes reiser4 to be instable
Date: Thu, 13 Dec 2012 23:47:10 +0100
Message-ID: <50CA5AEE.2050003@gmail.com>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com>	<CADW=+3m2s9Yyi7Da1nieTXjFx=KcfLch+mwoRTB50vGj+mZA=w@mail.gmail.com>	<CADW=+3kz__Rd_29Sx8mdiA0b_S11pEsXLYG5AGzjAVBC4Hck8w@mail.gmail.com>	<2612159.zxK0OqJdpP@intelfx-laptop>	<50C77C83.4080402@gmail.com> <CADW=+3nctUOzekb0NMV88CCqJj2Z8fgC=HjuoesirhNPCBxy_A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=QuEirIGpI26kHihG7unlbVtb2i9TM5+fgxgAdCTKnv0=;
        b=VAg5e48mm2aXn6YRCtneH2zSe4bgsv4itscNuNP8uBF7WqzllaeG60VuP7xxuSJh8f
         9tk7YoKFIjn0HkDUAqkyrOi0QmcYkyih5LXyQ4BLJS8hS86o1khhWzvuruP4reldig5t
         Z/zFHVAS2hLfF+PVqHVr8OCj7rmMdJYsF539f3E6TbDHLwDSzgGBkgQb7IDAGCwRQohG
         ikF6EGoki5PABlSfSrFLQJdJFWcn+7c1f6BMgc3nOv2lW2D5dwEaLzg31Q1r9MiGaBtI
         V2TB4En2oorO2Ua9Ffe6Wc2S0nvRUacha6KrYLrLTi5OLJPLFewN/0CKPqNf2v9UbUs+
         /MgQ==
In-Reply-To: <CADW=+3nctUOzekb0NMV88CCqJj2Z8fgC=HjuoesirhNPCBxy_A@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 12/11/2012 09:54 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> On Tue, Dec 11, 2012 at 7:33 PM, Edward Shishkin
> <edward.shishkin@gmail.com>  wrote:
>> On 12/11/2012 04:08 PM, Ivan Shapovalov wrote:
>>>
>>> Hello!
>>
>>
>> Hello.
>>
>>
>>>
>>> With help of Du=C5=A1an =C4=8Coli=C4=87<dusanc@gmail.com>  who prov=
ided his kernel config
>>> diff I've found a kernel option which, when disabled, greatly reduc=
es
>>> (hopefully to zero, but need time to verify it) corruption rate in
>>> reiser4.
>>>
>>> It's CONFIG_TRANSPARENT_HUGEPAGE (or something which is used by it =
like
>>> CONFIG_COMPACTION or CONFIG_MIGRATION).
>>> For now I'm testing it with CONFIG_TRANSPARENT_HUGEPAGE disabled
>>
>>
>> How long?
>>
> For me the difference in uptime is months without vs hours with it :D
> on 2.6.39.4


Hm, indeed: my setup with enabled migration can not survive even one=20
kernel compilation, while with disabled migration everything looks ok..


>
>>
>>>    on kernel
>>> 3.6.10, and everything seems to be OK so far (so the workaround is
>>> version-
>>> agnostic).
>>>
>>> Edward, are there any guesses on what can make reiser4 choke on
>>> hugepages/compaction/migration?
>>
>>
>> TBH, no ideas. They (hugepages) are _transparent_.
>> It means we shouldn't suffer in theory ;)
>>
>>
>>>    I'm not even barely familiar with the kernel
>>> internals.
>>>
>>> Thanks,
>>> Ivan.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
