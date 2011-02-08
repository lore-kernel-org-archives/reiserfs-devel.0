From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: kernel BUG at fs/reiser4/block_alloc.c:151
Date: Tue, 08 Feb 2011 23:36:08 +0100
Message-ID: <4D51C558.8050001@gmail.com>
References: <AANLkTi=DKZfNUQDXWUNMZXBonYWTdgAr6cMtyGk12ebM@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=DKZfNUQDXWUNMZXBonYWTdgAr6cMtyGk12ebM@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?UTF-8?B?TWFyY2luIEJhY3p5xYRza2k=?= <marbacz@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Marcin Baczy=C5=84ski wrote:
> Hi,
>  =20

Hello.

> I'm attaching a trace of kernel BUG that Firefox hits. It's 100% repr=
oducible,
> every time I start the browser it hits the bug within several seconds=
, then
> whole system hangs. However I've never triggered the problem with any=
 other
> application.
> I've tested 2.6.37-gentoo-hardened + reiser4 patch,

"2.6.37-gentoo-hardened" is based on what vanilla kernel (.36 or .37)?

>  and 2.6.36-zen kernels
> and both are affected.
> I'm happy to test patches or provide more info if needed.
>
> Thanks,
> Marcin
>  =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
