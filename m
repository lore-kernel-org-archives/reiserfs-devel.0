From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [veryRFC] [PATCH 0/2] reiser4: discard before dealloc: first approximation.
Date: Sun, 20 Jul 2014 15:33:21 +0400
Message-ID: <3FF93A38-BFFE-46C9-B77C-F8B51BD1EFEC@gmail.com>
References: <53C652BE.4010203@gmail.com> <1405509844-30070-1-git-send-email-intelfx100@gmail.com> <53C70C38.3080002@gmail.com> <1921159.vPDThm1Mru@intelfx-laptop> <53C7AFFE.3050905@gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=references:mime-version:in-reply-to:content-type
         :content-transfer-encoding:message-id:cc:from:subject:date:to;
        bh=JVdVQprEOgCgxFWMYd89Ncj2eHMzA7yZxwOxbdoieN4=;
        b=Di11remtip30jHhwpJayInpLPoqpU2ozheMgmkH9g64y1dydfGmFxG8I8rRt5DyjTY
         YvfwjCEC51FQAt3CWXHpVTIOfncQOkfTABCyQBv2nbLkLU/s0K2cpip/DkeSUEcR9pR1
         ECGO0r3a1Ody5gUlxQxKHSsMljCyytrpSKtpkGc9Bo4ufqgoZXyhCcsZalNbEwSSH1fS
         4Fs6d2nCGypmuRW858fnkLeSBY0mMxpOVbdmP1qhjsUBrL6gxunF6vBfYS6V2OtedtgU
         0/aIbFKdJ++z2/CZLVCLX9OPCNYS9UYMZ+K/lziNeZ3WeYfUF9d5y4aZa8XC2aD5Z9qa
         woOA==
In-Reply-To: <53C7AFFE.3050905@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>

> 17 =C9=C0=CC=D1 2014 =C7., =D7 15:14, Edward Shishkin <edward.shishki=
n@gmail.com> =CE=C1=D0=C9=D3=C1=CC(=C1):
>=20
>> On 07/17/2014 11:46 AM, Ivan Shapovalov wrote:
>>> On Thursday 17 July 2014 at 01:35:20, Edward Shishkin wrote:   =20
>>>> On 07/16/2014 01:24 PM, Ivan Shapovalov wrote:
>>>> This needs your version of discard algorithm, because blocks insid=
e extents of
>>>> discard set are now marked as allocated.
>>>=20
>>> OK, I'll try to finish it in weekends..
>>>=20
>>>=20
>>>> BTW, have you dropped the case with erase unit size < block size?
>>>=20
>>> In my version all erase units are supported except ones which are
>>> not a power of 2. We can support all erase units without exceptions=
,
>>> if needed.
>> I mean, when erase unit size < block size, erase unit size is forced=
 to be
>> exactly one block. Again, this is OK, but in this case any alignment=
 (by
>> definition less than one block then) will be dropped and represented=
 as zero,
>> and _this_ deserves a warning :)
>=20
>=20
> The case of alignment % block_size !=3D 0 deserves to disable discard
> support, because in this case all this science with heads and tails
> simply doesn't work.

<bikeshed>
If erase unit size =3D=3D block size (or less than), then it's ok. We c=
ould in this case unconditionally consider a tail/head padding of 1 blo=
ck without cutting tail/head in case of unavailable padding.
But then again, </bikeshed>

--
Ivan Shapovalov / intelfx /

(Sent from a phone. Havoc may be wreaked on the formatting.)

>> // btw, as you probably guess, these two patches are completely unte=
sted.
>>=20
>> Thanks,
>=20
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
