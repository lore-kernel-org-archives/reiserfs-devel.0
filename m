From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: Alternatives after removal of ReiserFS
Date: Thu, 19 May 2022 11:20:24 +0200
Message-ID: <2631780.mvXUDI8C0e@natalenko.name>
References: <54db8933-f2f3-d31a-c71f-860285e25abf@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
        s=dkim-20170712; t=1652952048;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IEpxxtS6dFfW2hXHPdJoyZva/Nsb9sB2MQUZZ8l7jNQ=;
        b=jjyGEN/2eo0tkC8gh4Uv4eViRmIwRBOkkq7tOSpJmJZnIfec0nx1ugl+MsNsuxLQ0TATA+
        e4I7m6NXv0IGWkHkh1yVRrc5S1B/WcrYeBsMWoLCDa0Ku955GNDG4yMDX9ka59LexSb7SG
        Xnzo96SgzCWHbuGF1W5o5gEqV66FNIg=
In-Reply-To: <54db8933-f2f3-d31a-c71f-860285e25abf@gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-kernel@vger.kernel.org
Cc: =?utf-8?B?TWljaGHFgg==?= Dec <moog621@gmail.com>, reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>

Hello.

On st=C5=99eda 18. kv=C4=9Btna 2022 14:10:25 CEST Micha=C5=82 Dec wrote:
> Does the Linux kernel actually offer any alternatives to users whose use=
=20
> cases are satisfied by ReiserFS? These users will probably be stuck with=
=20
> a much older kernel once ReiserFS is completely removed. I'm one of=20
> those users and I use ReiserFS to keep around large quantities of small=20
> files and quite ironically these are copies of the Linux kernel. I keep=20
> around 2, maybe 3 separate kernel trees to make sure the kernels I have=20
> on my devices can be rebuilt at any time.

I think the advantage of using reiserfs for small files faded away over tim=
e and became an old tale that is being passed from one generation to anothe=
r without any modern adequate testing.

XFS should serve you well.

=2D-=20
Oleksandr Natalenko (post-factum)



