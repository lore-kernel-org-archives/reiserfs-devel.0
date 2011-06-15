From: "Spidey / Claudio" <spideybr@gmail.com>
Subject: Re: reiser4 + firefox/chromium causing kernel panics
Date: Wed, 15 Jun 2011 10:59:17 -0300
Message-ID: <BANLkTi=xVNSid0=E7q8gNnEoAqCXngbukw@mail.gmail.com>
References: <BANLkTin6DXDPG4J4hcH7EMu58HM1Vf6hog@mail.gmail.com>
 <BANLkTinFWbpuQKSYGYJJ7W2+23jQWj4OWw@mail.gmail.com> <4DF8B666.3090404@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=KqcIq0T0nGGsbTdEtnv8dT6AsoxvJLNpB24/68nOkp0=;
        b=pY1QIrTdFOB4NgyQEbcMM4guAZAbj0l3c9v+N+4hVTboNXhlrXPva0xQBixM5cWfN9
         8vsGoNTPE8oNJzVP/unWQ0nOwLRipgUPB7U6uzWQAr0BcEOMsQy5agFHsstYczSAZKu+
         cEcbnndHzl4R6DuwCG3PIbVsHYZL4lh+JcEAc=
In-Reply-To: <4DF8B666.3090404@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Oh, thank you! That was fast. =3DD

Claudio Roberto Fran=C3=A7a Pereira (a.k.a. Spidey)
hardMOB - HTForum - @spideybr
Engenharia de Computa=C3=A7=C3=A3o - UFES 2006/1



On Wed, Jun 15, 2011 at 10:40, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Hello,
>
> the attached patch should fix it.
> However, this is dirty fixup, I'll try to
> prepare something better at my vacations.
>
> Thanks,
> Edward.
>
> On 06/15/2011 03:11 PM, Spidey / Claudio wrote:
>>
>> If I just open mozilla firefox or chromium browser, I get an imediat=
e
>> kernel panic. At first, I thought it was related to Firefox, but it'=
s
>> definitely not. Here is a picture of the panic itself:
>> http://imageshack.us/f/689/20110615001.jpg/
>>
>> I know imageshack is a bitch, if you can't see the picture I can
>> attach here in the next email.
>>
>> I'm currently running gentoo, with zen-sources:
>> $ uname -a
>> Linux SpideyHomePC 2.6.38.5-zen #10 ZEN SMP PREEMPT Thu Jun 9 23:26:=
31
>> BRT 2011 x86_64 Intel(R) Core(TM)2 Duo CPU E8400 @ 3.00GHz
>> GenuineIntel GNU/Linux
>>
>> If you need my .config, just ask.
>>
>> Thank you.
>>
>> Claudio Roberto Fran=C3=A7a Pereira (a.k.a. Spidey)
>> hardMOB - HTForum - @spideybr
>> Engenharia de Computa=C3=A7=C3=A3o - UFES 2006/1
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-d=
evel"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
