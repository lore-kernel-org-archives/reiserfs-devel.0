From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Re: query - reiser4 patch for 2.6.31 kernel
Date: Sat, 12 Sep 2009 22:27:35 +0200
Message-ID: <200909122227.35123.volkerarmin@googlemail.com>
References: <51ea0ee6820d1cc0bfe3b01c17c43c67@mail.velocitynet.com.au> <200909110738.24679.volkerarmin@googlemail.com> <alpine.DEB.2.01.0909121309590.5744@bogon.housecafe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=jYvKClx7fhoBQEnjxAbhf2gVY7ZN8EAcpvaI6LUIO4c=;
        b=NVbCV62nNof1H+gIw5GCLRckCWP6l4Zv1w7cyOB4QcGiiP7nJsUQ0i9ZXcse2JC7S5
         xZ4OtvqtaIwcxqMLOzTuHP8bGXr1JqCnOlNUGbiyxRX5248Obzg+56oSTIOlH9FzVYra
         0+xjlvYQWrrCE2ZzewKaadNmnRSIKm9J0hRUI=
In-Reply-To: <alpine.DEB.2.01.0909121309590.5744@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: Christian Kujau <lists@nerdbynature.de>
Cc: reiserfs-devel@vger.kernel.org, doiggl@velocitynet.com.au

On Samstag 12 September 2009, Christian Kujau wrote:
> On Fri, 11 Sep 2009 at 07:38, Volker Armin Hemmann wrote:
> > > Is there a reiser4 patch available (reiser4-for-2.6.31) for the
> > > linux-2.6.31 kernel since 2.6.31 has been released.
> >
> > just use the  patch for -30 ;)
>=20
> Can we assume that you're doing this and it's indeed working?
>=20
> Christian.
>=20

yes you can ;)

uname -a
Linux energy 2.6.31r4 #2 SMP Sat Sep 12 11:57:14 CEST 2009 x86_64 AMD=20
Phenom(tm) II X4 955 Processor AuthenticAMD GNU/Linux
[    0.836885] Loading Reiser4. See www.namesys.com for a description o=
f=20
Reiser4.=20

[    1.790093] reiser4: md1: found disk format 4.0.0.                  =
                       =20
[    5.792391] VFS: Mounted root (reiser4 filesystem) readonly on devic=
e 9:1.         =20

[   11.733917] reiser4: md2: found disk format 4.0.0

[   13.528351] reiser4: md3: found disk format 4.0.0.   =20

[   54.848625] reiser4: sdc7: found disk format 4.0.0


[  611.835399] reiser4[ktxnmgrd:md1:ru(581)]: disable_write_barrier=20
(fs/reiser4/wander.c:235)[zam-1055]:                                   =
                                                  =20
[  611.835404] NOTICE: md1 does not support write barriers, using synch=
ronous=20
write instead.  =20
[  671.080063] reiser4[qmgr(3681)]: disable_write_barrier=20
(fs/reiser4/wander.c:235)[zam-1055]:=20
[  671.080067] NOTICE: md2 does not support write barriers, using synch=
ronous=20
write instead.  =20
[  683.621631] reiser4[mlnet(4241)]: disable_write_barrier=20
(fs/reiser4/wander.c:235)[zam-1055]:
[  683.621635] NOTICE: md3 does not support write barriers, using synch=
ronous=20
write instead.  =20


so far it seems working fine. Haven't seen any corruptions or other neg=
ative=20
symptoms. System is working fine - and there is some load on the filesy=
stem.

Gl=FCck Auf
Volker
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
