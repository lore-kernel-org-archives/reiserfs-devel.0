From: "Spidey / Claudio" <spideybr@gmail.com>
Subject: Re: reiser4 + firefox/chromium causing kernel panics
Date: Wed, 15 Jun 2011 10:11:23 -0300
Message-ID: <BANLkTinFWbpuQKSYGYJJ7W2+23jQWj4OWw@mail.gmail.com>
References: <BANLkTin6DXDPG4J4hcH7EMu58HM1Vf6hog@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:content-type:content-transfer-encoding;
        bh=j4qiuKoqM/gDxIwpEqcFtCtG3EWmPy0umdATT08DVbA=;
        b=FJVLVDdNDSiaV8Uu0HdzL97RCxQzndW9SfiLteso96UuoOqi3yKovHuvgzDFU6Yil2
         oZfxt/RXwvr3gLRZfMDpnDTc2N4NMiVkHKTlsmp+pYT+vhAkQWKFKDrALvmeq+GkuLpI
         H3nNXK+Wsi1mqP6JFSxnTUoELQpLI+o1fE7SI=
In-Reply-To: <BANLkTin6DXDPG4J4hcH7EMu58HM1Vf6hog@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

If I just open mozilla firefox or chromium browser, I get an imediate
kernel panic. At first, I thought it was related to Firefox, but it's
definitely not. Here is a picture of the panic itself:
http://imageshack.us/f/689/20110615001.jpg/

I know imageshack is a bitch, if you can't see the picture I can
attach here in the next email.

I'm currently running gentoo, with zen-sources:
$ uname -a
Linux SpideyHomePC 2.6.38.5-zen #10 ZEN SMP PREEMPT Thu Jun 9 23:26:31
BRT 2011 x86_64 Intel(R) Core(TM)2 Duo CPU E8400 @ 3.00GHz
GenuineIntel GNU/Linux

If you need my .config, just ask.

Thank you.

Claudio Roberto Fran=C3=A7a Pereira (a.k.a. Spidey)
hardMOB - HTForum - @spideybr
Engenharia de Computa=C3=A7=C3=A3o - UFES 2006/1
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
