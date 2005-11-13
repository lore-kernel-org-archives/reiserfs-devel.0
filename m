From: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: Re: Slowdown is gone & apt-get works with updated reiser4. So nevermind...
Date: Sun, 13 Nov 2005 15:05:23 +0100
Message-ID: <43774823.2090201@ursynow.2a.pl>
References: <200511111359.39715.jgilmore@glycou.com>	<b14e81f00511111907l3c159ff7rd2e0de5f9e6a0aa7@mail.gmail.com>	<43758E00.4000601@namesys.com>	<200511120906.39109.jgilmore@glycou.com>	<43765E8D.7030104@namesys.com>	<43768EEA.90307@ursynow.2a.pl>	<43772F11.7090907@free.fr>	<437731A5.9070802@ursynow.2a.pl> <20051113141213.07be2e71@SiRiUS.home>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26920-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051113141213.07be2e71@SiRiUS.home>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Thomas Kuther <gimpel@sonnenkinder.org>
Cc: reiserfs-list@namesys.com

Thomas Kuther wrote:
> On Sun, 13 Nov 2005 13:29:25 +0100
> Artur Mak=F3wka <juice@ursynow.2a.pl> wrote:
>=20
>> it crashed today morning, so 2.6.13mm is not much better than 2.6.14.
>>
>> My fs is heavly used (but not overloaded) by many apache process or
>> ftp process or postfix process.
>>
>> I have free hosting server and i think i will have to close this
>> thing becouse for over a month its often downtime everyday. Could you
>> please tell us if there is any idea of how to fix it? i would move to
>> another more stable fs but its too much data..
>=20
> hmm, wondering which I/O scheduler you guys are using.=20
> I had the same slowdowns and soft lockups till 10 minutes ago, when i
> switched from cfq to anticipatory I/O. I'm currently usig 2.6.15-rc1 +
> reiser4 from 2.6.14-mm2
> I was in the middle of a big gentoo'ish emerge, desktop almost
> unusable. but now with anticipatory all seems fine so far.=20
> the compile seems a lot faster. no soft lockup trying to use vim or
> locate... hmmm
>=20
> regards
> tom

i was using anticipatory I/O as default in debian. i just did echo cfq >=20
  /sys/block/hda/queue/scheduler. Hope its enough to change it.

no noticed effects yet, i will give report, if anything changes.


