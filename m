From: Edward Shishkin <edward@namesys.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Fri, 21 Jan 2005 12:31:50 +0300
Message-ID: <41F0CC06.3060304@namesys.com>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>	 <m38y7gx8kq.fsf@merlin.emma.line.org>	 <20041230235911.4911a20c.hihone@bigpond.net.au>	 <m3sm5nj2ef.fsf@merlin.emma.line.org> <41D42F93.9060107@namesys.com>	 <2f4958ff050118131714f5411c@mail.gmail.com>	 <41EE859D.3020305@namesys.com> <41EFAFB0.2000606@namesys.com> <2f4958ff050120154330188420@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23185-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f4958ff050120154330188420@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?UTF-8?B?R3J6ZWdvcnogSmHFm2tpZXdpY3o=?= <gryzman@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, hihone@bigpond.net.au, reiserfs-list@namesys.com

Grzegorz Ja=C5=9Bkiewicz wrote:

>All I know is that xxtea is fixed tea algo. If that fixes weakness in
>crypto algo, than so it should make hashing better.
> =20
>

Not necessary. The xtea, xxtea don't fix mixing portion of tea in=20
accordance with the
following papers: http://algolist.manual.ru/defence/well_known/tea.zip

>No doubt there is no ideal hash algo, but if base algo has weaknes,
>using fixed one only can be better, Right ?
>
> =20
>
Nop ;)
We don't need to keep a track of teacore upgrades against the attacks=20
that allow to reveal secret key.
Tea hash uses tea algorithm only for mixing, not for private ciphering,=20
so plain text is known
(this is hardcoded vector  u32 k[] =3D { 0x9464a485, 0x542e1a94}), keys=20
(constructed by names)
are known, output values are known.
Nothing to reveal - nothing to upgrade..

Edward.

