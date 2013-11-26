From: dimas <dimas000@ya.ru>
Subject: Re: reiser4 kernel compilation problem.
Date: Wed, 27 Nov 2013 01:04:35 +0400
Message-ID: <20131127010435.54d9fc6b@Ulf.tvoe.tv>
References: <35ffb317ffa4ed9987117759f51ebd1f@mail.velocitynet.com.au>
	<20131123161309.1b321a45@Ulf.tvoe.tv>
	<3ff712c55494331e10c9f7fc0b7b8d25@mail.velocitynet.com.au>
	<20131125135635.36d29c28@Ulf.tvoe.tv>
	<529334E8.40704@gmail.com>
	<0d261550194f47e24b19754de30e8949@mail.velocitynet.com.au>
Reply-To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1385499875;
	bh=LzYn7VvbC6SanRcLw5wsccXfb1+iIhBjIeuQjEnkETs=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 X-Mailer:Mime-Version:Content-Type:Content-Transfer-Encoding;
	b=vrXqEnJFdyFpw71I3KcqoAexVFEA1W3TzzL3Dm2D9FD0+xeJV1xzRSqJPKxcpXRUO
	 qg3us+Z/pXLr9/O4L11/bZtdXSSZQ4qS0QNHztrGbyChsm7LstuqPseRB4S1rtTnJO
	 QgwYGJV7I2zCfPbRr5YOT36wDIviM0Nc+y+50iDQ=
In-Reply-To: <0d261550194f47e24b19754de30e8949@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

> 3.
> # insmod reiser4                                                          
> insmod: can't read 'reiser4': No such file or directory
> 4.
> # modprobe -v reiser4                                                     
> insmod /lib/modules/3.11.9-2.ga012288-vanilla/kernel/fs/reiser4/reiser4.ko
hm, try running "depmod -v". seems like "reiser4" is not listed in modules.dep
or whereever it should be, thus insmod cannot find it (and load on mount
attempt). read "man depmod" if it will ask smth more - since i don't have any
modules on both machines, i can't check what options are necessary.

as for those dmesg warnings - we can just see what will Edward say on this))
meanwhile i offer you the simplest way to check whether they are driver/kernel
related, or your fs has error that fsck can't detect or fix - just create shiny
new reiser4 fs on some free partiton or even on loop-mounted temporary file and
try wirh it.
