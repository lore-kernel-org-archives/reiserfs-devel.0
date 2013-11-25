From: Nicolas Barbier <nicolas.barbier@gmail.com>
Subject: Re: reiser4 kernel compilation problem.
Date: Mon, 25 Nov 2013 10:53:57 +0100
Message-ID: <CAP-rdTbuuxe1urCCt0+3AtA+3qLfjMj3GKseLCvZ3KZb4FCjOA@mail.gmail.com>
References: <35ffb317ffa4ed9987117759f51ebd1f@mail.velocitynet.com.au>
	<20131123161309.1b321a45@Ulf.tvoe.tv>
	<3ff712c55494331e10c9f7fc0b7b8d25@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=VIkmdgVbncKtC1dA8V9Y88PcixUPDvWtQCNPikpeG/M=;
        b=XmLRtuDM/9yqAPFPq55AhaHzxy3UFxb1PMH8Mq4G6Yp/Ym5HmhW6f17hBWdTVwUCXH
         A0Ivpq2zFpKldrEDsNZMzc37ty7ZfIHt6CBnw98+hYRuS/fYa4gAEB+cUoOLxxEPzlwd
         DJQ1BMuNNLrqfZ4UScJJwOz7dsQLjOeJABAcYfmIXprW4+DQLL4RHUNoedf47oD3F1Aa
         L94HWILPHQVUEfzNbCZhIf53FsXXzarosqpkQezJQgHdIrCeP/aLRURkZSXVG8zDAVgM
         bbf77HPZcT+3EL4T/CH6sD6BtxVOg+GPkakfSLbgpf1RAJI8PfssgF1rObjPmrhpb7bx
         ZhrQ==
In-Reply-To: <3ff712c55494331e10c9f7fc0b7b8d25@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

2013/11/23  <doiggl@velocitynet.com.au>:

> Here are the details:
>
> # insmod
> Usage: insmod filename [args]

You didn=E2=80=99t specify a module to load. The usage help message of =
just
=E2=80=9Cinsmod=E2=80=9D is absolutely irrelevant. First use =E2=80=9Cl=
smod=E2=80=9D (this one doesn=E2=80=99t
need arguments :-)) to check whether the module is loaded. If not, use
=E2=80=9Cinsmod <modulename>=E2=80=9D to load it.

> # ll /proc/filesystems
> -r--r--r-- 1 root root 0 Nov 25 12:18 /proc/filesystems

Please look *into* this file, i.e., use =E2=80=9Ccat=E2=80=9D, not =E2=80=
=9Cll=E2=80=9D.

Nicolas

--=20
A. Because it breaks the logical sequence of discussion.
Q. Why is top posting bad?
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
