From: =?utf-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Subject: Re: Cryptocompress
Date: Thu, 03 Dec 2009 06:36:12 +0100
Message-ID: <op.u4ckimx4hogzsi@g17b>
References: <26619602.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <26619602.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

Dne Thu, 03 Dec 2009 02:27:32 +0100 drwowe <drwowe@yahoo.com> wrote:

>
> hello,
> What is the status of the cryptcompress feature?  Is it stable enough=
 for
> desktop use, or only for experimentation?

Compression works and is stable, encryption is not implemented and it =20
seems it never will be.


> Also, is there any documentation that explains how to use the feature=
?  I
> seem to recall there was a mount options that turns it on, but also t=
o =20
> use
> it I need to know how to do key management for encrypting files which=
 I
> haven't found.

=46or compression, just format the FS with -o create=3Dccreg40.
I also recommend setting hash to tea, since r5 hashing usually generate=
s
collisions for me, especially when compiling big stuff like GCC or OO.o=
rg,
leading to minor corruptions requiring an offline fsck.

--=20
Jon=C3=A1=C5=A1 Vidra, vidra.jonas@seznam.cz
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
