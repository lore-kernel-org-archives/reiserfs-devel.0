From: dimas <dimas000@ya.ru>
Subject: Re: looking for a .spec file to patch to the 2.6.33 kernel with the
 reiser4-for-2.6.33.patch.gz
Date: Fri, 07 May 2010 17:48:41 +0400
Message-ID: <4BE41A39.7000506@ya.ru>
References: <27d46c00494316fadb3bab078ed7e953@mail.velocitynet.com.au>
Reply-To: dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1273240122; bh=pZK8PE+veGwUcr+/KYKXt+mZ1Y86xcRE255XB2pLM50=;
	h=Message-ID:Date:From:Reply-To:MIME-Version:To:CC:Subject:
	 References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=YkKS8GHK6MdKLjLv5sgkXMoSDWaVnyJvsrfdNOKk+0wVASl/i720Smdy/yGmNnESP
	 3/g4AtkUwob6STKu2683jAa2Rg+6X39us7YhgTOZJyjV1ocygM8Y41wla527G9D8Sy
	 j77sJgmj04kNQfH1149QhU1I3Nkgxz+rOnbigLgk=
In-Reply-To: <27d46c00494316fadb3bab078ed7e953@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

zcat ../reiser4-xxxxxx.gz | patch -p1
make oldconfig
make menuconfig
....enable R4 and confgure what you wish....
make binrpm-pkg
... or use your system's own tool if it has one (like kernel-package in Debian).
what is so hard?
> Do anyone know of, or could send me a .spec file on paching the 2.6.33
> kernel with reiser4-for-2.6.33.patch.gz and produce a .rpm  as a result.
> Thanks Glenn
