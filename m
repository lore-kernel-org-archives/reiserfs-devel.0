From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [Testing Error] xfstests generic/169 - Test for file size
 consistency with append followed by umount/mount
Date: Sun, 7 Dec 2014 09:17:44 +0100
Message-ID: <CADW=+3k-oMACLufDxJv8oWB+vzAfbg6QQ14V8EbRG5PrS2D1eg@mail.gmail.com>
References: <CADW=+3kaEEz1fw2yx8K7Hi8wNPZLk-MfcS5K=vGjWrQPWd__2w@mail.gmail.com>
	<5482EFF5.6010309@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=HokKcinPt1Gji49bLw7/Se7qzDFqlrrt0mqu9vVJq9I=;
        b=VfOG1sxnuUmrjgGq/LPuAOP1QX5RPZaJOuPLgtFxUlpj7IdfaIY+/mpxNiCYfWwi7V
         4z+OXthjoejqD6w3GmaiIAt5EaPXyJWf2LWifMH5ayIfivqG0TtsU/bJDEaKvkC5k2I2
         R1TEGK22eJigknoMUhYCNJu8n2POcLHnSoHlzijEMe43Hmw+J72PUop83dtqAWr0xGLz
         izphB8zfVUFoEDkb50gvV0xp/I40Ug1pgSKsKtlO2uKcpJ1/JP3Nysr+CQP/dptd87hj
         Tu3YelT5I5ZxUo/0oX3Kq8VwOlYx0Gor9IUoFvjNFcTnq0ERSEmkRmmMm4T1wtyxmY4w
         QmNA==
In-Reply-To: <5482EFF5.6010309@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Sat, Dec 6, 2014 at 1:00 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
>
> On 12/05/2014 02:31 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>
>> Code:
>> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3D=
blob;f=3Dtests/generic/169;
>> Patch: reiser4-for-3.16.2.patch
>> Extra mount options: none
>>
>> diff -u tests/generic/169.out /root/xfstests/results//generic/169.ou=
t.bad
>> --- tests/generic/169.out       2014-12-04 21:04:20.000000000 +0100
>> +++ /root/xfstests/results//generic/169.out.bad 2014-12-05
>> 16:03:27.000000000 +0100
>> @@ -4,11 +4,11 @@
>>   wrote 5120/5120 bytes at offset 0
>>   wrote 5120/5120 bytes at offset 5120
>>   wrote 5120/5120 bytes at offset 10240
>> -stat.size =3D 15360
>> +stat.size =3D 20481
>
>
>
> Hmm, 5120+10240 !=3D 15360?
> What a surprise. OK, I'll take a look at leisure..
>
Looks like it was my fault, can't reproduce it anymore.
Probably overlap between 2 tests as I didn't mkfs between tests.

> Thanks,
> Edward.
>
>
>
>>   # unmounting scratch
>>   # mounting scratch
>>   # stating file to confirm correct size
>> -stat.size =3D 15360
>> +stat.size =3D 20481
>>   # appending 10 bytes to new file, sync at 5 bytes
>>   wrote 5/5 bytes at offset 0
>>   wrote 5/5 bytes at offset 5
>>
>>
>> On Fri, Dec 5, 2014 at 2:22 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@g=
mail.com> wrote:
>>>
>>> I managed to get xfstests  (
>>> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3D=
tree ) to
>>> run on Reiser4 partition. Test for async, acl, quota still don't wo=
rk but
>>> a
>>> lot of the rest finishes successfully.
>>> Tests were run on reiser4-for-3.16.2.patch
>>> I'll post unsuccessful tests and their results in following e-mails=
=2E
>>>
>>> Dushan
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
