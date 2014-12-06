From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [Testing] Testing Reiser4 with xfstests
Date: Sat, 6 Dec 2014 11:07:24 +0100
Message-ID: <CADW=+3mMFTZDrQaLvL1d7SU4o_Ek7KWhbX6jDJJA7JdTtK465Q@mail.gmail.com>
References: <CADW=+3nVaodqG2YX0g8kajU=ZPKOPw167Sm98vHQBFvmqfL4xg@mail.gmail.com>
	<CADW=+3=QtDv6--1BNAVo8dcKX4QPeZWYeJJQvuiJu+dqec0aug@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=bC40bwOGua+4jWYXSjWAW3YjS7jnrN4WYBoZ+otM8aE=;
        b=k0ofAiW1NrdDQ2SqmYTNxirhWWs1tS/i1PqkebF+v38QbVXQW9A+g0f1uf6t8TLNA5
         q6KQI025dN0cIY1kKxA5v54Gi+M2nKWcbIQW8YhCYBgmX7yuIuKHPrMhycABKJWZU2xB
         RUGPKMiwmOEW30yBk+ebTgcjX7CozzgvkFt+TR5vnOXcYUTJneWBXHZmhE9ItECPZdPw
         Y1VubhyjuIFiWBFMCUNsmS/eT/FRdUGf6mxdSDISNFiLY4B1a+14P8/Obky6ocIb2e8F
         0x1Vo1thJEWQyel1yZ4azkRgqCvUUipAv7nos8O3D+EDQh8x1TWd+60tHdC2Ru2jTKxq
         PuDA==
In-Reply-To: <CADW=+3=QtDv6--1BNAVo8dcKX4QPeZWYeJJQvuiJu+dqec0aug@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Some of the tests (~20 of 300) didn't work and I traced that they
require fallocate. AFAIK R4 doesn't support it right?

On Fri, Dec 5, 2014 at 2:46 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmai=
l.com> wrote:
> On Fri, Dec 5, 2014 at 2:22 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gm=
ail.com> wrote:
>> I managed to get xfstests  (
>> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3D=
tree ) to
>> run on Reiser4 partition. Test for async, acl, quota still don't wor=
k but a
>> lot of the rest finishes successfully.
>> Tests were run on reiser4-for-3.16.2.patch
>> I'll post unsuccessful tests and their results in following e-mails.
>>
> Btw. these tests can stress test fs and I could also test with
> different mount (block size?) or mkfs options (reg40) and automate it
> easily to test multiple combinations, so if there's any ideas what
> would be useful please tell me.
>
> Thanks
> Dushan
>
>
>> Dushan
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
