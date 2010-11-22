From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-2.6.36
Date: Mon, 22 Nov 2010 03:47:47 +0100
Message-ID: <4CE9D9D3.2010901@gmail.com>
References: <4CE87674.4090909@gmail.com> <4CE93CEB.8050504@ya.ru> <4CE9603B.7050103@gmail.com> <000001cb89be$cebdfc20$6c39f460$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=sAH/HzeIyUXkA0ch/GZFLV0M+5fpaw8CIHsfEtVgwVE=;
        b=uMwPS2r26ZB6ePsvzr9FhxqfJkjSAsofeXQML4MzUE2er9q6At1BMH3Uy24nxE03A5
         MPzlNGzmJOWeU6fEttPnG7jQ2+o9xla8U+nUR5BEhw9fWqbkUjlrPTxs+GmNFY+g0+GC
         a4EH3Er7PXLiBphRrOluqalyT1klePdMF/N5Y=
In-Reply-To: <000001cb89be$cebdfc20$6c39f460$@com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?0K7RgNC40Lkg0JfQsNC40LrQuNC9?= <yzaikin@gmail.com>
Cc: dimas000@ya.ru, 'Reiserfs mailing list' <reiserfs-devel@vger.kernel.org>

=D0=AE=D1=80=D0=B8=D0=B9 =D0=97=D0=B0=D0=B8=D0=BA=D0=B8=D0=BD wrote:
> The bug with building OpenOffice is still there though now it doesn't=
 produce a kernel panic. The build script just randomly fails with IO e=
xceptions.

Is compression enabled (did you format
the partition with "create=3Dccreg40" option)?

Thanks for the report.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
