From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Re: Fwd: Re: 2.4.19-rc1-jam2 (-rc1aa2)
Date: Thu, 11 Jul 2002 04:23:01 +0200
Message-ID: <3D2CEC05.5090300@mb.tu-ilmenau.de>
References: <200207110235.22875.Dieter.Nuetzel@hamburg.de> <1026350802.4952.0.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10959-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 07/11/2002 03:26 AM, Chris Mason wrote:
> On Wed, 2002-07-10 at 20:35, Dieter N=FCtzel wrote:
>=20
>>Hello Chris,
>>
>>symbol clash between latest -AA (-jam2, 00-aa-rc1aa2) kernel and your=20
>>data-logging stuff ;-(
>=20
>=20
> You should be able to drop the EXPORT_SYMBOL(balance_dirty); from my
> patch.
>=20
> -chris
>=20

;-)

Are your patches going to follow 2.4.19/2.4.20-preX+namesys - once=20
2.4.19/2.4.20-pre is finally out

(...me, just praying for this circumstance, also for namesys' hidden=20
patches on this next kernel!...)  ?

:-))

I have no problems with: 2.4.19-rc1 + reiserfs-patches[01,02,03,05] +=20
all your patches (the data-logging one is now -11, checked regression=20
from -13) + rml-preempt-kernel.


Manuel

