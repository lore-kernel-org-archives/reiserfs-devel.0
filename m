From: "Yiannis Mavroukakis" <yiannis@jaguarfreight.com>
Subject: RE: rebuild-tree working for more then 3 days- what to do?
Date: Fri, 7 Jan 2005 12:57:38 -0000
Message-ID: <77912E9FD42896419D1CEF15E1C397A58AFCFD@london.jaguarfreightservices.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23066-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

=20
Alternatively,=20try=20the=20following.=20Go=20to=20slackware.com=20Grab=20=
a=20reiser3
enabled=20boot=20image=20and=20make=20a=20bootdisk.
If=20memory=20serves=20me=20right,=20this=20is=20the=20one=20you=20want=20=

ftp://ftp.mirror.ac.uk/sites/ftp.slackware.com/slackware-10.0/kernels/ba
reacpi.i

Then,=20go=20into
ftp://ftp.mirror.ac.uk/sites/ftp.slackware.com/slackware-10.0/rootdisks/
and=20grab=20rescue.dsk=20and=20make=20a=20rootdisk.=20You=20could=20go=20=
two=20ways=20about=20it
from=20now=20on
If=20there=20is=20space=20on=20the=20rootdisk,=20mount=20it=20and=20copy=20=
the=20reiserfsprogs
binaries=20into=20it.
If=20not,=20use=20a=20third=20disk=20to=20hold=20the=20binaries.

Boot=20off=20the=20bootdisk,=20slam=20the=20rescue=20rootdisk=20in=20when=20=
requested,=20and
best=20of=20luck=20:D

Yiannis.
-----Original=20Message-----
From:=20Shoshannah=20Forbes=20[mailto:xslf@xslf.com]=20
Sent:=2007=20January=202005=2012:44
To:=20Vladimir=20Saveliev
Cc:=20reiserfs-list@namesys.com
Subject:=20Re:=20rebuild-tree=20working=20for=20more=20then=203=20days-=20=
what=20to=20do?


On=2007/01/2005,=20at=2014:33,=20Vladimir=20Saveliev=20wrote:

>=20When=20you=20boot=20off=20liveCD=20-=20do=20you=20have=20a=20network

Yes,=20I=20have=20a=20Network

>=20=20and=20place=20where
>=20reiserfsprogs=20can=20be=20put=20and=20compiled=20besides=20that=2060g=
b=20device=20with=20
>=20broken=20reiserfs?

Not=20locally=20(that=20machine=20has=20only=20one=20HD),=20but=20I=20can=20=
mount=20a=20share=20on
the=20Mac=20via=20the=20network.
I=20guess=20I'll=20try=20that.

>=20Then=20boot=20liveCD,=20download=20reiserfsprogs=20and=20fsck.
---
Shoshannah=20Forbes
http://www.xslf.com


________________________________________________________________________
This=20e-mail=20has=20been=20scanned=20for=20all=20viruses=20by=20Star=20I=
nternet.=20The
service=20is=20powered=20by=20MessageLabs.

Note:__________________________________________________________________
This=20message=20is=20for=20the=20named=20person's=20use=20only.=20It=20ma=
y=20contain
confidential,=20proprietary=20or=20legally=20privileged=20information.=20N=
o
confidentiality=20or=20privilege=20is=20waived=20or=20lost=20by=20any=20mi=
stransmission.
If=20you=20receive=20this=20message=20in=20error,=20please=20immediately=20=
delete=20it=20and
all=20copies=20of=20it=20from=20your=20system,=20destroy=20any=20hard=20co=
pies=20of=20it=20and
notify=20the=20sender.=20You=20must=20not,=20directly=20or=20indirectly,=20=
use,=20disclose,
distribute,=20print,=20or=20copy=20any=20part=20of=20this=20message=20if=20=
you=20are=20not=20the
intended=20recipient.=20Jaguar=20Freight=20Services=20and=20any=20of=20its=
=20subsidiaries
each=20reserve=20the=20right=20to=20monitor=20all=20e-mail=20communication=
s=20through=20its
networks.
Any=20views=20expressed=20in=20this=20message=20are=20those=20of=20the=20i=
ndividual=20sender,
except=20where=20the=20message=20states=20otherwise=20and=20the=20sender=20=
is=20authorized
to=20state=20them=20to=20be=20the=20views=20of=20any=20such=20entity.
________________________________________________________________________
This=20e-mail=20has=20been=20scanned=20for=20all=20viruses=20by=20Star=20I=
nternet.=20The
service=20is=20powered=20by=20MessageLabs.
