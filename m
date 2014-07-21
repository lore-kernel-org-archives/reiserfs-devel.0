From: =?UTF-8?B?4oCg?= <god12@niksula.hut.fi>
Subject: Re: Reiserfs 4
Date: Mon, 21 Jul 2014 11:09:28 +0200
Message-ID: <53CCD8C8.4030900@niksula.hut.fi>
References: <CAMRsyOdq8mTCtxGH0h1m4pTOKZoGvk+N0aG4ADSFBx5qSHmUAw@mail.gmail.com>	<CAMRsyOd8j3oQ2OACOBnXBR4Zyt09AU48KNmPPkm2qj01BMA9Aw@mail.gmail.com> <20140720194256.551f51f9@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20140720194256.551f51f9@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

20.07.2014 17:42, dimas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> if you mean backup storage, why do you need such a complicated journa=
led fs
> like ext3 or r4? for mostly static storage, modified once a day or ev=
en rarer,
> i'd suggest ext2 as a simplest way.
>
That's the worst possible recommendation: if you don't want to use jour=
nal you can
just switch it off on ext4. Using outdated ext2 code offers absolutely =
no advantages.

Speaking of reiser4, unfortunately I would not expect it to be recommen=
dable as a
viable production-ready upgrade path for 3.6 in the near future. Sadly,=
 there's just
not enough resources backing up development at the moment. Feel free to=
 change that
though ;-)

cheers,
Max.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
