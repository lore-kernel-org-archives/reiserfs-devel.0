From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [Testing] Testing Reiser4 with xfstests
Date: Sat, 06 Dec 2014 13:02:41 +0100
Message-ID: <5482F061.6040807@gmail.com>
References: <CADW=+3nVaodqG2YX0g8kajU=ZPKOPw167Sm98vHQBFvmqfL4xg@mail.gmail.com>	<CADW=+3=QtDv6--1BNAVo8dcKX4QPeZWYeJJQvuiJu+dqec0aug@mail.gmail.com> <CADW=+3mMFTZDrQaLvL1d7SU4o_Ek7KWhbX6jDJJA7JdTtK465Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=NSQJmkRWldGRLD7lqYXlgCqCf9/eSG7WAdEUV5fguUs=;
        b=oVPyFoEvTuGR+l9ipwOMiWm6FX+/D3jtYhAyPz+4+T+NE+C+4RdZcwn4DK0ZTf7mvB
         P9aSeQIoCU2EkUiqkXlOT37o5xPKOp02qtugbu3Vk2ctC6ymhuXCaTuDfk9OA7LyHHou
         V9M8bih4wdrv4UcSloa9SBNLmzPLkXjh93/kaApO40+L7pDcvL9nkQ0fkv/wy+A95qd3
         tn4TWCrogpFwMEbOT+5HNFqg41SNYKyzpmSMGfmWAm/KeblWmU/YrvEMbpygRC2Lw/Ix
         7hamlF5ZvwwSaExk8RlJ2AzQZkyFWI8V8jroL1XFIXBbRms1sW41aCJAtblC6/0ec5hb
         nVvw==
In-Reply-To: <CADW=+3mMFTZDrQaLvL1d7SU4o_Ek7KWhbX6jDJJA7JdTtK465Q@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>


On 12/06/2014 11:07 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> Some of the tests (~20 of 300) didn't work and I traced that they
> require fallocate. AFAIK R4 doesn't support it right?


Yup, we don't support fallocate.

Edward.


>
> On Fri, Dec 5, 2014 at 2:46 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gm=
ail.com> wrote:
>> On Fri, Dec 5, 2014 at 2:22 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@g=
mail.com> wrote:
>>> I managed to get xfstests  (
>>> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3D=
tree ) to
>>> run on Reiser4 partition. Test for async, acl, quota still don't wo=
rk but a
>>> lot of the rest finishes successfully.
>>> Tests were run on reiser4-for-3.16.2.patch
>>> I'll post unsuccessful tests and their results in following e-mails=
=2E
>>>
>> Btw. these tests can stress test fs and I could also test with
>> different mount (block size?) or mkfs options (reg40) and automate i=
t
>> easily to test multiple combinations, so if there's any ideas what
>> would be useful please tell me.
>>
>> Thanks
>> Dushan
>>
>>
>>> Dushan

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
