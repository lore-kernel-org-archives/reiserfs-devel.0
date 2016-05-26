From: =?utf-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Subject: Re: Two Reiser4 FSs in the same HDD cause head seek panic?
Date: Thu, 26 May 2016 07:04:53 +0200
Message-ID: <op.yh10ef1jhogzsi@i17b>
References: <ni15m1$hf6$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
	t=1464239095; bh=ExQadMb09XUjo8lBiuO9ztTGcCpv7ECW3HUOLcGolf0=;
	h=DKIM-Signature:Received:Content-Type:Cc:References:Subject:To:
	 From:Date:MIME-Version:Content-Transfer-Encoding:Message-ID:
	 In-Reply-To:User-Agent;
	b=ItM9p4u+QDRU1rejJjp1JSuDM9dnvQ9SfL854gWEUpeDDJticqYtr47RlgbED2Hc6
	 M/bGprIvzIBONnZWwwsenyiI06VA1nj7x7oxjULe/b8i2SHarJ9CZ0cR3ptm4UmYMt
	 QoBDY6MVZvw0EykGf3Bg2rERvY5uowE7sEkzm9P0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
	t=1464239095; bh=ExQadMb09XUjo8lBiuO9ztTGcCpv7ECW3HUOLcGolf0=;
	h=Received:Content-Type:Cc:References:Subject:To:From:Date:
	 MIME-Version:Content-Transfer-Encoding:Message-ID:In-Reply-To:
	 User-Agent;
	b=CdFN7ijX73/bFp53Nnn5PjWYkhBVE0tSCqElBYiQY47Eg6ytJuoQZTD2yjgtIyIp2
	 PE4ycYdkA6+VlXnF5xI1U1wpJedUxPlDr0MKGTAyvRzHqLuKV3Gk/ulq2hf+MFtcYw
	 bn5N4RKmhty8M2ag/jvlat+grFaanZ21yKsA+9y8=
In-Reply-To: <ni15m1$hf6$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: reiserfs-devel@vger.kernel.org
Cc: Georgios Tsalikis <georgios@tsalikis.net>

On Tue, 24 May 2016 10:58:53 +0200 Georgios Tsalikis =20
<georgios@tsalikis.net> wrote:

> I happened to format a rootfs partition and another one for /home wit=
h =20
> Reiser4. It proved to be a disaster. Apart from the slow boot times =20
> (expected from this drive) even after reaching a functional GUI the d=
isk =20
> kept doing I/O  like crazy. When /home became Btrfs the issue ceased.=
 My =20
> other computer that uses an entire drive formatted with Reiser4 is ni=
ce =20
> and silent as well.

How large are the disks? The long boot time may be (at least partially)
caused by bitmap loading =E2=80=93 try mount option =E2=80=9Cdont_load_=
bitmap=E2=80=9D.
This won't help you with seeking *after* boot, though. It will actually
make it worse.

Do you have a proper IO scheduler set? What does
=E2=80=9Ccat /sys/block/sdX/queue/scheduler=E2=80=9D say? (Replace sdX =
with the correct
identifier.)

Is there anything interesting in the system logs? I'm assuming there is=
n't.

--=20
Jon=C3=A1=C5=A1 Vidra, vidra.jonas@seznam.cz
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
