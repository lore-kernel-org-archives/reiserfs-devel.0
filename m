From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Kernel config option which causes reiser4 to be instable
Date: Fri, 14 Dec 2012 12:07:56 +0100
Message-ID: <50CB088C.3090801@gmail.com>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com> <CADW=+3nctUOzekb0NMV88CCqJj2Z8fgC=HjuoesirhNPCBxy_A@mail.gmail.com> <50CA5AEE.2050003@gmail.com> <1389717.RAQAZZVsPt@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=93wGVJLc5ovsS4DOUBz38/Ds6xCVh5YThQRonD2lLLw=;
        b=sYquRA4kgwYQS9EIFT1z+IK/NUumQvBmh5eeU0vgi8DRFwEyXL7vm2UEaE0qWJHegw
         l3+hUNC3jFkwyfHzG3x21BTfxaE3+LBajaKksVNmPESvZFiTkF4+mYZyiC7ksNN5nWxo
         wm2G1Kg/qwwR+inNX9UfPRxiB3QGKxVbVaZbbWKhIDEWgtPpLcOhzXR4/scVIz9G4iaA
         9OEhdgUY/Tfw7w7xA4GCxRzDAFYJsk+zN4SMR+/Tevf2nHTQhL8X1x5IRsJ5rVADp4kq
         JxFK2hiuIg7QB+AqSZeHQhAjXz/mKvdra4cAoOF9Sp05W6Y/g7jXP1zKld6vawQqWlhB
         UwRg==
In-Reply-To: <1389717.RAQAZZVsPt@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 12/14/2012 04:14 AM, Ivan Shapovalov wrote:
> On 13 December 2012 23:47:10 Edward Shishkin wrote:
>> On 12/11/2012 09:54 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>> On Tue, Dec 11, 2012 at 7:33 PM, Edward Shishkin
>>>
>>> <edward.shishkin@gmail.com>   wrote:
>>>> On 12/11/2012 04:08 PM, Ivan Shapovalov wrote:
>>>>> Hello!
>>>>
>>>> Hello.
>>>>
>>>>> With help of Du=C5=A1an =C4=8Coli=C4=87<dusanc@gmail.com>   who p=
rovided his kernel
>>>>> config
>>>>> diff I've found a kernel option which, when disabled, greatly red=
uces
>>>>> (hopefully to zero, but need time to verify it) corruption rate i=
n
>>>>> reiser4.
>>>>>
>>>>> It's CONFIG_TRANSPARENT_HUGEPAGE (or something which is used by i=
t like
>>>>> CONFIG_COMPACTION or CONFIG_MIGRATION).
>>>>> For now I'm testing it with CONFIG_TRANSPARENT_HUGEPAGE disabled
>>>>
>>>> How long?
>>>
>>> For me the difference in uptime is months without vs hours with it =
:D
>>> on 2.6.39.4
>>
>> Hm, indeed: my setup with enabled migration can not survive even one
>> kernel compilation, while with disabled migration everything looks o=
k..
>
> The overnight testing also showed no errors...
> So shall we release reiser4-for-3.7 and announce FIXED(?) once again?
> :)


I worry that migration is mandatory option for hugepages.
Does fail_migrate_page() work with hugepages?

Also before the release I'll try to take a look at this:
http://marc.info/?l=3Dreiserfs-devel&m=3D135402207623711&w=3D2

This failed path might indicate that we adjusted to fs-writeback
incorrectly.

Edward.

>
> Regards,
> Ivan.
>
>>
>>>>>     on kernel
>>>>>
>>>>> 3.6.10, and everything seems to be OK so far (so the workaround i=
s
>>>>> version-
>>>>> agnostic).
>>>>>
>>>>> Edward, are there any guesses on what can make reiser4 choke on
>>>>> hugepages/compaction/migration?
>>>>
>>>> TBH, no ideas. They (hugepages) are _transparent_.
>>>> It means we shouldn't suffer in theory ;)
>>>>
>>>>>     I'm not even barely familiar with the kernel
>>>>>
>>>>> internals.
>>>>>
>>>>> Thanks,
>>>>> Ivan.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
