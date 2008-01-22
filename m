From: Matthew <jackdachef@gmail.com>
Subject: Re: bug report: reiser4 + kde4
Date: Tue, 22 Jan 2008 19:33:05 +0100
Message-ID: <e85b9d30801221033j29675024vae4eee3a90fcce73@mail.gmail.com>
References: <20071122101615.178410@gmx.net>
	 <200801172200.22182.volker.armin.hemmann@tu-clausthal.de>
	 <4790B6DC.8070308@gmail.com>
	 <200801181830.55677.volker.armin.hemmann@tu-clausthal.de>
	 <47953052.80500@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=Mom83VK0yJweFMEn61bjNX5YwZv8yPZRujlupPIiNi0=;
        b=OZL1VUNn0PhIHmqnbWof291Rurw47S26PMVtqQApYR0vUwC96g59CduuqPIXfJn8Sle/LmrWbR2zAE/qnF+N03rl9Hf/Uh8CTmFtZgTF6Nf3AecjoKzDZiG3Hfe+oHYHixSQyG0Erb6SWPW2dTyTGzClkDtvk8iLTTVYpAxlh/8=
In-Reply-To: <47953052.80500@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: "Hemmann, Volker Armin" <volker.armin.hemmann@tu-clausthal.de>, reiserfs-devel@vger.kernel.org

>
> Eventually I have launched kde4 with the attached patch.
> The fixed problem is described in the patch header.
> Would you please try this?
>
> Thanks,
> Edward.
>
> P.S.
> Kde4 is nice :)
>

That DID solve it !
Thanks a ton, Edward, kde4 and reiser4 is the REAL winning combination ;)
I've tried the patch on 2 different PCs and kde4 is flying fine so far,

there were some other little problems when launching bash-scripts from
within an reiser4 root-partition which should also be fixed by this
patch (I hope), I need to have a deeper look at that ..

reiser4 is feeling pretty stable & safe right now :)

Thanks again,
Mat

P.S.:
could you safe / host a copy of the original
http://pub.namesys.com/Reiser4/ToDo list or wiki so that people who
are interested in working on reiser4 can further do so before it (the
list) completely vanishes of the net ? (there are still copies in
google-cache)
