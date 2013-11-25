From: dimas <dimas000@ya.ru>
Subject: Re: reiser4 kernel compilation problem.
Date: Mon, 25 Nov 2013 13:56:35 +0400
Message-ID: <20131125135635.36d29c28@Ulf.tvoe.tv>
References: <35ffb317ffa4ed9987117759f51ebd1f@mail.velocitynet.com.au>
	<20131123161309.1b321a45@Ulf.tvoe.tv>
	<3ff712c55494331e10c9f7fc0b7b8d25@mail.velocitynet.com.au>
Reply-To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1385373396;
	bh=bCNY2BFviU6qLdgMy0uURwo73E3w8fK9TjSKwhbUMwM=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 X-Mailer:Mime-Version:Content-Type:Content-Transfer-Encoding;
	b=tTHSbxS4o25iaR/7yQS1eegvz/P+g2SX2OdMrxMBza9MxpEEeiQ6E9GBg7lCXJ0jk
	 rmT0+smXtuDBLyA+rNLm43ms8+Be5LlfgAg2IL18YMyMNai77+CJZsvF+obX9yLoTn
	 pnZ2g3iyT9Hy/adRybxl1B6wfI7m41gNcKNLjyVQ=
In-Reply-To: <3ff712c55494331e10c9f7fc0b7b8d25@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

> Hello,
> Here are the details:
> 
> # insmod
> Usage: insmod filename [args]
no-no-no, insmod is used to load module. you must give it a module name to load.
also there is lsmod, which shows currently loaded modules. read man insmod, man
lsmod for details.
so, aftre your mount attempt (not before it, because modules usually load only
when requested) check if reiser4 module did loaded:
lsmod | grep "reiser4"
if it occasionaly shows nothing, try loading it manually, using "insmod
reiser4" or better
modprobe -v reiser4
if this will fail too, there should be a problem with the module itself.
i'm using no modules, building only what i need, and building it static (=Y).
static built reiser4 works perfectly wirh 3.11 for me, so i don't know, what's
that. check dmesg after attempt to load, maybe there is something.

> # ll /proc/filesystems
> -r--r--r-- 1 root root 0 Nov 25 12:18 /proc/filesystems
try "cat /proc/filesystems")) it shows list of fs types, which kernel currently
support

> Back to the Question:
> What reiser4 kernel build paramerers I need in the kernel build so I can
> use this partition ?
> I have set:
> CONFIG_REISER4_DEBUG=n
> CONFIG_REISER4_FS=m
if you are not using cryptocompress plugin (your fsck lock says, you are not).
i believe, this is enough.
