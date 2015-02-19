From: dimas <dimas000@ya.ru>
Subject: Re: help wanted add-node41.patch fails to apply to reiser4progs
 version 1.0.9
Date: Thu, 19 Feb 2015 21:23:41 +0300
Message-ID: <20150219212341.35572de3@Ulf.tvoe.tv>
References: <a6ad8c02cd6dcddc95b2d7e25d42f35c@mail.velocitynet.com.au>
	<CAM12Q5R3HCPNjL+wnX6wqXfbCM9F1n_cLLD2rGQcGLgM8Soxew@mail.gmail.com>
	<cb14e1389131b5cb6ed38b89ed0bf005@mail.velocitynet.com.au>
Reply-To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1424370222;
	bh=WMqfRUFx/zVptaVBWjOIfq1yUGXBr8C9j0hG15Az6dY=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=P1Yh3r5oP0293jFrKeVE5cRTxDiUhlQgYHQ5HlBVy/xvdslKMZO7+XQfY7EkVaDId
	 to9khireE7fHiHKyBRreWk3fy5pCqOXVov/JED1Z6cJg0jwQX2JmywngPDIeM2XxhD
	 56TBBiqQPpZla9n/tSrqsWM7HmYCbag5iVl25scY=
In-Reply-To: <cb14e1389131b5cb6ed38b89ed0bf005@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

as a workaround, you can diff source tree before and after running autoreconf
and create a patch with what the latter brings (i guess, it
modifies ./configure and ./makefile, or what else?). or even merge those
changes at the beginning of original patch


2015-051 01:01 doiggl@velocitynet.com.au <doiggl@velocitynet.com.au> wrote:
> Hello,
> Interestingly the spec file needs to have in it somewhere to allow it to
> run: 
> autoreconf
