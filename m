From: dimas <dimas000@ya.ru>
Subject: Re: Where may I find a reiser4 patch for kernel 2.6.32-5?
Date: Mon, 12 Mar 2012 23:03:14 +0400
Message-ID: <20120312230314.44ea493b@Ulf.tvoe.tv>
References: <CANish_kZ=WNx7tqAceBESUAiyu1yJcpy9K8G4VnsKExkRpiT2A@mail.gmail.com>
Reply-To: dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1331578996; bh=NmdJ4nwArjLGON/G1kYy4K3q4ZAwUzszvfTQ84qsXzA=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	b=Cmm8fuIILeQdF1V/Gi3CDHgNJK6YtSEsHI/46DvfaHtN9pY9RVLdRt8ByIItU+d90
	 PG9ARJkZrk8CGC1s0ByawIBTyCnnVhak2KBJ7NHZbuQlNx93HstZsXjfJ0lakAa2nx
	 mIQp+lihTCb9UBDPe9nvamPrhMjdh+XR51g2Lq5Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1331578996; bh=NmdJ4nwArjLGON/G1kYy4K3q4ZAwUzszvfTQ84qsXzA=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	b=Cmm8fuIILeQdF1V/Gi3CDHgNJK6YtSEsHI/46DvfaHtN9pY9RVLdRt8ByIItU+d90
	 PG9ARJkZrk8CGC1s0ByawIBTyCnnVhak2KBJ7NHZbuQlNx93HstZsXjfJ0lakAa2nx
	 mIQp+lihTCb9UBDPe9nvamPrhMjdh+XR51g2Lq5Q=
In-Reply-To: <CANish_kZ=WNx7tqAceBESUAiyu1yJcpy9K8G4VnsKExkRpiT2A@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

man, seems that you'll also need to patch debian-installer and create udeb package to load before disk setup (like with resier3 now). how about this?
as for gparted - maybe you just need to have reiser4progs installed?
2.6.32? why don't you use something newer? 38 was very interesting release. btw, i have my server running on Debian testing @ 2.6.38.8 with / on reiser4. works 24/7 and works fine!
what about remastersys or whatever - do you think you need to create yet anothet 10000001'st Linux distro? just install and configure what you need and pack you system into compressed image (i recommend squashfs, or there are lot alterantives like tar, etc) and use livecd with reiser4 support (partedmagic or maybe smth else) to prepare you playground.
because normal people wouldn't want to use fs that is oficially not recommended and claimed as forever unstable (yes, it's working fine for me about 2 years, but ...). and those who is intersted in it can just move their systems themselves, as they should be geeky enough if they know about such things like r4. it's a matter of 15-20 minutes to pack /, mkreiser4, unpack / back and fix fstab. with proper kernel already installed, of course, but geeks often use self-built kernels, so it's not a problem too

PS. sorry for private mail. claws-mail seems not to handle this mailing-list correctly, or some headers are not properly set.
