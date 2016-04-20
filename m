From: =?utf-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Subject: Re: Debian with Reiser4-patched Linux kernel on IBM Power8
Date: Wed, 20 Apr 2016 13:11:00 +0200
Message-ID: <op.yf7tcmn9hogzsi@i17b>
References: <CAM12Q5Tu-Zg=wgUAbYh++0dwn-h8gNUNMraxFgVWCi-HzUpyJA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
	t=1461151451; bh=PVMAZ+15BqyemiPn9bhKC4Ah/k7DnfqVihzwACHbRjA=;
	h=DKIM-Signature:Received:Content-Type:Cc:References:Subject:To:
	 Date:MIME-Version:Content-Transfer-Encoding:From:Message-ID:
	 In-Reply-To:User-Agent;
	b=CQb31yLfVPa12OvlX/DqlloDzgicHddOBE65BkgUCiatq8IPC+HfHikU8cUlVyF4Z
	 cerw/dcsd8sKqglmgqi2IJvr/pVWqKT7NxgCNIq+RfgEpzina4TwXq5AVYJaUwFwuu
	 GXlf8nRU2ymDzXQoAdTk5rT+WNuNEpNq2tt/6zMk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
	t=1461150662; bh=PVMAZ+15BqyemiPn9bhKC4Ah/k7DnfqVihzwACHbRjA=;
	h=Received:Content-Type:Cc:References:Subject:To:Date:MIME-Version:
	 Content-Transfer-Encoding:From:Message-ID:In-Reply-To:User-Agent;
	b=GpsQk0v+Bo1BSQ5DjYSrlKOBdW7Jdl5uOgiS3ltaotfjkQGZyZqNJqgskBEnUCdtR
	 zvVmMmArwG1eaanT0J0eB7sN0E5iLmfzdT2ik6w/+nipKwPBrkwvBiG1GKsFNBhq+X
	 jL54TfBihFJDCwiezuvQ36hMAxXSH+MtZm7a7V+8=
In-Reply-To: <CAM12Q5Tu-Zg=wgUAbYh++0dwn-h8gNUNMraxFgVWCi-HzUpyJA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jose R R <Jose.r.r@metztli-it.com>, debian-kernel@lists.debian.org, debian-boot@lists.debian.org

On Wed, 20 Apr 2016 12:53:48 +0200 Jose R R <Jose.r.r@metztli-it.com> =20
wrote:

> is there any reason why Reiser4 SFRN 4.0.1-enabled Debian should not
> run on Power8? I assume GPT should be selected whereas previously I
> have tested -- on AMD64 baremetal and cloud -- only MSDOS disk
> partitioning.

There might be some problems with the endianness of the system.

I have tested Reiser4 on 32bit PowerPC several years ago and as far as =
I
remember, mounting and using a preformatted partition (mkfs done on an =
x86
machine) was possible, but a partition formatted on PowerPC was unusabl=
e.
I can repeat the tests, if you are interested.

--=20
Jon=C3=A1=C5=A1 Vidra, vidra.jonas@seznam.cz
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
