From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Re: [PATCH CFT] tons of logging patches
Date: Sun, 14 Jul 2002 02:52:01 +0200
Message-ID: <3D30CB31.8040703@mb.tu-ilmenau.de>
References: <200206222202.56577.Dieter.Nuetzel@hamburg.de>	<1024945533.9008.10.camel@tiny> 	<200207091552.52815.Dieter.Nuetzel@hamburg.de> 	<1026223243.5603.124.camel@tiny> <1026502991.4952.136.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10993-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 07/12/2002 09:43 PM, Chris Mason wrote:
> On Tue, 2002-07-09 at 10:00, Chris Mason wrote:
>=20
>>On Tue, 2002-07-09 at 09:52, Dieter N=FCtzel wrote:
>>
>>>On Monday, 8 July 2002 13:51, Chris Mason wrote:
>>>
>>>>On Wed, 2002-07-03 at 20:28, Manuel Krause wrote:
>>>>
>>>>
>>>>>So far the 13 prerelease works fine under rootflags boot and=20
>>>>>mount/remount option "data=3Dordered" on here.
>>>>
>>>>I think I've got the bug, it was newly introduced in -13.  New stuff
>>>>will be uploaded today.
>>>>
>>>
>>Sigh, further testing showed I'd only fixed half of the bug.  The other=

>>half is somewhere deep writepage/truncate interaction.  I'm still tryin=
g
>>to find it.
>=20
>=20
> Well, after a week of fixing minor things and adding debugging code,
> this bug still goes unsolved.  The only good news is that I can also
> trigger it on pure 2.4.19-rc1 and ext2.  The bug seems to either be in
> the VM or my ram, so I'm having a little memtest86 party overnight.
>=20
> I've uploaded 03-beta-data-logging-16, it should be more stable and
> faster than -11 and -13 were, but includes more debugging checks to try=

> and make sure I'm not screwing things up.  You can grab the patches at:=

>=20
> ftp://ftp.suse.com/pub/people/mason/patches/data-logging
>=20

Thank you, Chris!

It's working fine under rootflags set and mount/remount options=20
"noatime,notail,data=3Dordered".
Nothing got wrong on here due to data-logging-13.

Netscape7 dropped its load time again by 3secs of (previously 14+1),=20
OpenOffice1 increased by 1sec (of average 17secs previously). To explain =

the previous state: I've only changed -pre9 to -rc1 and data-logging=20
from -10(-pre9)..13(-rc1)..11(-rc1)..16(-rc1, now!) from the old patchset=
=2E

> If anyone wants to try and reproduce my memory corruption bug (can and
> probably will lead to FS corruption), just let 10 fsx processes run in =
a
> loop for ~3 hours or so on an SMP machine.
>=20
> -chris
>=20

Is this possible to be reproduced on uniprocessor machines, too ?


Best regards,

Manuel

