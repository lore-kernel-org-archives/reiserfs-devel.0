From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: current status of r4's ccreg40
Date: Sun, 04 Nov 2012 23:53:10 +0100
Message-ID: <5096F1D6.3000007@gmail.com>
References: <20121104170833.5257bb72@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=BXc/Ctek+O8zLsZx7JbrTT2gI5V1huBEGhr5kTaQL7U=;
        b=YzrVUNs5P18A6bFXHvFDAFD/ehaYfclBcX881WD/PdGH4bdRVs1mFtXN/kcp3wwukl
         wrPjNMbB2U+nK/yX/lqpQQHOAkMYCURgYt7t+7NgL1DuoIpBGWi8sC3LvWIB/08Mxuye
         2oOsjKVLdjzD/vOE4CcRXgUbF/wZolivYTOpl3a6tocrJfu4pFSMAMZYLqL0vOb9zNue
         EaWZt1F2A6nmlEwmd59+K/anSJYMOXtLYjB/A2RwxZMfWhn51kAylNYNONrYkBvFNyqK
         SDTE2VHsQqR+zOfVvOUyjRznTrIBUJtRQAUDb8/vUR9ysUscjv2nTSeR0IKU40cTd7Rl
         c5+g==
In-Reply-To: <20121104170833.5257bb72@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: dimas000@ya.ru
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 11/04/2012 02:08 PM, dimas wrote:
> hello, Edward!

Hello.

> in "reiser4-for-3.6" you've announced some fixes for cryptocompress p=
lugin. for those who don't understand what that's all about, can you pl=
ease explain, should ccreg40 now behave more stable, or it's still "not=
 recommended"?

With the latest stuff and my usual stressing suit I don't observe
any crashes. =D0=9Dowever, there was a complaint from Ivan, who has a
home directory on reiser4 with compression:
http://marc.info/?l=3Dreiserfs-devel&m=3D135170428323969&w=3D2

I'll try to reproduce this (install Arch and move my home to
reiser4). For now, please, handle compression with care..

> btw, what are sane formatting parameters now, after recent 3.6.4 fixu=
ps? still reg40 and formatting=3Dextents?

Sorry, it was false alarm: I detected key inconsistency in carry
domains, but this is not a bug, as it has been figured out later
(during tree balancing key ordering may get broken for a while).

So the current status: reg40 looks stable regardless on tail packing
(no complaints so far); ccreg40: there was a complaint (will try to
reproduce).

Thanks,
Edward.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
