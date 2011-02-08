From: =?UTF-8?Q?Marcin_Baczy=C5=84ski?= <marbacz@gmail.com>
Subject: Re: kernel BUG at fs/reiser4/block_alloc.c:151
Date: Wed, 9 Feb 2011 00:56:55 +0100
Message-ID: <AANLkTinGQZdTSQHsgTbDYLn2etE6wGwr8UWSmSs=nCL1@mail.gmail.com>
References: <AANLkTi=DKZfNUQDXWUNMZXBonYWTdgAr6cMtyGk12ebM@mail.gmail.com>
	<4D51C558.8050001@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=lPVNe3Ttv5HpeK1XGyfPVOVzzArz6T7IB28aBNUGfds=;
        b=gz4EXLX1hH0SKuqDYJf5ko9AdtPDFRB7BQDRXOI8KOqdAgy5Mtk1v3FS+yqXo+/qrA
         UNBLv0vYoe5U2m9rd1yBSsiXLvsQHcQvlM4nqxuAr8V/v3GvlL8p+ev0px1sGIWfw8Ul
         VT60HkHvwkPcYWeJFknaisOAoGV2ex9pepChs=
In-Reply-To: <4D51C558.8050001@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

W dniu 8 lutego 2011 23:36 u=C5=BCytkownik Edward Shishkin
<edward.shishkin@gmail.com> napisa=C5=82:
> Marcin Baczy=C5=84ski wrote:
>>
>> Hi,
>>
>
> Hello.
>
>> I'm attaching a trace of kernel BUG that Firefox hits. It's 100%
>> reproducible,
>> every time I start the browser it hits the bug within several second=
s,
>> then
>> whole system hangs. However I've never triggered the problem with an=
y
>> other
>> application.
>> I've tested 2.6.37-gentoo-hardened + reiser4 patch,
>
> "2.6.37-gentoo-hardened" is based on what vanilla kernel (.36 or .37)=
?
It's based on .37.

>
>> =C2=A0and 2.6.36-zen kernels
>> and both are affected.
>> I'm happy to test patches or provide more info if needed.
>>
>> Thanks,
>> Marcin
>>
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
