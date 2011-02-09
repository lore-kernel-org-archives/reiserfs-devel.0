From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: kernel BUG at fs/reiser4/block_alloc.c:151
Date: Wed, 09 Feb 2011 01:20:02 +0100
Message-ID: <4D51DDB2.20605@gmail.com>
References: <AANLkTi=DKZfNUQDXWUNMZXBonYWTdgAr6cMtyGk12ebM@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=+NY8Wo2DFYpMnOQ0q+HNWe3FNCNXm5/JnrRnU26ePcQ=;
        b=VNKZILkP4u9nwKhDyzS2019qXU9rzJAvOa5qrSgMbyF4TCXchVMYNpu8W/2kUV/KZq
         wYW3XZOeoDoD4E3Muh4J3w0v6PE5l1bQUXYJ77U4adeFMLB9r2XILYcZZWbR3kDT9Ao7
         VuCfYyZ3hvhXB06RO9A1b8RIeDMwNqfistjH8=
In-Reply-To: <AANLkTi=DKZfNUQDXWUNMZXBonYWTdgAr6cMtyGk12ebM@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?UTF-8?B?TWFyY2luIEJhY3p5xYRza2k=?= <marbacz@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 02/08/2011 11:13 PM, Marcin Baczy=C5=84ski wrote:
> Hi,
> I'm attaching a trace of kernel BUG that Firefox hits. It's 100% repr=
oducible,
> every time I start the browser it hits the bug within several seconds=
, then
> whole system hangs. However I've never triggered the problem with any=
 other
> application.
> I've tested 2.6.37-gentoo-hardened + reiser4 patch, and 2.6.36-zen ke=
rnels
> and both are affected.
> I'm happy to test patches or provide more info if needed.

You also can try to compile reiser4 with debugging info
and then run firefox. If some assertion is failed before
"kernel BUG at fs/reiser4/block_alloc.c:151", it would be
useful information...

Thanks,
Edward.

>
> Thanks,
> Marcin

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
