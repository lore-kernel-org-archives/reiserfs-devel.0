From: =?utf-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Subject: Re: strange problem with reiser4 with ccreg40 on amd64 2.6.35.2
 vanilla kernel + tuxonice + reiser4 on a mdadm imsm raid-0 partition
Date: Thu, 26 Aug 2010 21:20:02 +0200
Message-ID: <op.vh17zoyrhogzsi@g17b>
References: <4C75BCBF.6010009@gmail.com> <op.vh1ct9tghogzsi@g17b>
 <4C76633D.9010106@gmail.com>
Reply-To: "ReiserFS mailing list" <reiserfs-devel@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4C76633D.9010106@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: "K. Posern" <quickhelp@gmail.com>
Cc: ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

Dne Thu, 26 Aug 2010 14:51:09 +0200 K. Posern <quickhelp@gmail.com> =20
napsal(a):

> I have a emerge.log with the JAVA_PKG_DEBUG=3D1:
> 	http://tormen.pastebin.com/AEkDdQ1n
> emerge --info:
> 	http://tormen.pastebin.com/EfZe3afK

Could you, please, recompile both the kernel and reiser4progs
(and possibly their dependencies :D) with -O2 instead of -O3
in CFLAGS? It tends to break things in strange and nasty ways,
why do you have it enabled globally like this? Are you sure
it's actually needed?

Also, CCache is not used anymore, remove it from FEATURES.
If you actually _use_ CCache (i.e. you've installed it
manually), unmerge it immediately. It's broken by design.

Other stuff in your FEATURES looks fishy as well, but it
shouldn't affect builds. I hope you know what you're doing.


--=20
Jon=C3=A1=C5=A1 Vidra, vidra.jonas@seznam.cz
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
