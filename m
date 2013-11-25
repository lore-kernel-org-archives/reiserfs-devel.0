From: dimas <dimas000@ya.ru>
Subject: Re: reiser4 kernel compilation problem.
Date: Mon, 25 Nov 2013 19:03:13 +0400
Message-ID: <20131125190313.79962097@Ulf.tvoe.tv>
References: <35ffb317ffa4ed9987117759f51ebd1f@mail.velocitynet.com.au>
	<20131123161309.1b321a45@Ulf.tvoe.tv>
	<3ff712c55494331e10c9f7fc0b7b8d25@mail.velocitynet.com.au>
	<20131125135635.36d29c28@Ulf.tvoe.tv>
	<529334E8.40704@gmail.com>
Reply-To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1385391794;
	bh=jAF4AwozKwrbeHNzuurtj0rkbDJLIaCxuvBL/J7AzSo=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 X-Mailer:Mime-Version:Content-Type:Content-Transfer-Encoding;
	b=GanIbTmzTuTYGw+JcPe6h+OMd4HTy2gUwa1QFOO9ca2C4Tzhlw4uImSp2r84YJyob
	 C1FhdKOC1ipHslJEiFAAxrvC/CtF74J5EZLHUeOMgcgtgYgsYHpM8fH6CfWHXEKVPC
	 40SY33x5mcRMJUMoPNevvmsrQfjNAMYQpXseNO+Q=
In-Reply-To: <529334E8.40704@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

> Fsck doesn't report if compression has been enabled.
> debugfs.reiser4 should be patched to show value of "create" (reg40 or 
> ccreg40),
> "compress" (lzo1, or gzip1), etc.
oh, didn't know, thanks! i thought that "format40" is just equal to "reg40".
thus, there is currently no way to determine fs format (reg40 or ccreg40) and
compression type (if any)? maybe, such information in fsck would be nice?))
