From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [xfstests/generic/081] Kernel panic with reg40 plugin and R4-for-4.1.5.patch
Date: Thu, 10 Sep 2015 22:24:50 +0200
Message-ID: <55F1E712.80802@gmail.com>
References: <CADW=+3=x+ajq+N4QqwmRQ-4uEAPEpr5xopV+31zz2HQonMc_UA@mail.gmail.com>	<55F1D7E9.2000209@gmail.com> <CADW=+3mQjNcwFzaWNdXDG+-_We=mQ+_1EfbS_Jy9KkiFx5Bi=w@mail.gmail.com> <55F1E3C9.5080109@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=WSl/AEyP4tLa2gNy5lzfCxdQJOSrP1pmulRjEylk9HE=;
        b=hY2jugTiE55BuhDCn0zMIL+DRvXQzjlgKOH0SFV7UKjZo9pcynAeWcIIiNgAQw7X7i
         EP10x2AFUaOZfCCjKN8DuNzKwXQLgEOBtpg4Y2CybRYB6hCyNpMs1KJnCEaKDmFBHtK+
         r8p2tPyzXp5ZeKjKSvDzu5vT/OYrzYI5EPNeHslASQ/j46K69EskJLZBctlcVwS9g0Kl
         Dr98l6iOX6UWI/osK1AEYB18HGOqHoFSJYGipJWK8bjAFcpBPSYlnbVQCS7UxD8ieJYx
         zAD30xRRIm5TaDMOekVb4VG7Ds8tBpbcDNJE3bVo6OfmlYzgqMU7DgRMk8vQf+sA88PV
         firg==
In-Reply-To: <55F1E3C9.5080109@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>



On 09/10/2015 10:10 PM, Edward Shishkin wrote:
>
>
> On 09/10/2015 09:42 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>> On Thu, Sep 10, 2015 at 9:20 PM, Edward Shishkin
>> <edward.shishkin@gmail.com> wrote:
>>> Actually, this is not a regression.
>>> The attached patch prevents the panic.
>>> By default on IO errors reiser4 partition will be remounted as=20
>>> "readonly".
>>>
>>> No ideas why accessing /dev/dm-X causes IO error.
>>> Reiser4 is not the culprit ;) You can narrow down this, if interest=
ing.
>>> I think that something is wrong with LVM settings...
>>>
>> I looked more into this: This test fills up dm snapshot (writes 5MB =
to
>> 4MB snapshot) so we get IO error because it's full.
>
>
> IO error because of no space - it is very strange,
> especially when reading the device (as in my case):
>
> # dd if=3D/dev/dm-3 of=3D/dev/null bs=3D4096 count=3D1
>
>
>>   It doesn't trigger
>> on ccreg40 because ccreg40 compresses data so 5MB of compressible da=
ta
>> < 4MB space ;)
>> xfstests uses compressible data for disk full tests so on ccreg40 th=
ey
>> give false positive. Are ccreg40 and reg40 code paths for disk full
>> situation the same?


The behavior doesn't depend on file plugin: this is the transaction man=
ager
who makes the decisions.


>> I'll look into fixing xfstetsts.
>>> Thanks,
>>> Edward.
>>>
>>>
>>>
>>> On 09/04/2015 09:35 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>> Kernel: 4.1.6
>>>> R4 patch: 4.1.5
>>>> Test: xfstests/generic/081 "Test I/O error path by fully filling a=
n dm
>>>> snapshot."
>>>>
>>>> Test passes cleanly with ccreg40 but kernel panics with reg40 plug=
in.
>>>> Picture of the panic, as I had no other means of capturing it, is =
in
>>>> attachment.
>>>>
>>>> xfstests local.config section:
>>>>
>>>> [r4Hybrid]
>>>> MKFS_OPTIONS=3D"-o create=3Dreg40"
>>>> MOUNT_OPTIONS=3D"-o noatime"
>>>>
>>>> Have a nice day.
>>>>
>>>> Dushan
>>>
>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
