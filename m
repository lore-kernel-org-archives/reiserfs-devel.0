From: "Yiannis Mavroukakis" <yiannis@jaguarfreight.com>
Subject: RE: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 11:52:58 -0000
Message-ID: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22946-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

=20
Hello=20Matthias,

Your=20"proven"=20reasoning=20sounds=20a=20bit=20strange=20to=20me..Micros=
oft=20(aka=20major
distributor=20at=20least=20in=20my=20books)=20had=20her=20filesystems=20"i=
n=20the=20field"=20for
ages,=20does=20this=20prove=20any=20of=20them=20good=20(or=20bad=20for=20t=
hat=20matter)?
I=20don't=20think=20I'd=20wait=20for=20a=20distributor=20to=20shove=20reis=
er4=20down=20my
throat,=20just=20because=20the=20distributor=20seems=20to=20trust=20it,=20=
so=20the=20logical
course=20would=20be=20for=20me=20to=20try=20it=20out.=20I'll=20grant=20you=
=20that=20I=20am=20not=20using
it=20on=20the=20mission=20critical=20server,=20because=20our=20hosting=20p=
rovider=20will=20not
support=20it=20(ext3=20addicts..oh=20well)=20but=20I=20do=20have=20it=20on=
=20my=20development
server,=20that=20does=20house=20critical=20code=20and=20receives=20all=20k=
inds=20of
hammering=20from=20yours=20truly;=20And=20I=20use=20it=20at=20home.
I=20suppose=20my=20point=20is,=20filesystem=20testing=20and=20adoption=20b=
elongs=20to=20the
masses=20be=20they=20your=20average=20Joe=20Linux=20user=20or=20a=20sysadm=
in=20who=20feels
confident=20enough=20in=20the=20filesystem's=20abilities=20to=20take=20the=
=20plunge.=20I=20run
reiser4,=20I'm=20happy=20with=20it,=20it=20is=20stable=20enough=20to=20car=
ry=20out=20my=20*own*
activities.=20

Happy=20holidays,

Yiannis.

-----Original=20Message-----
From:=20Matthias=20Andree=20[mailto:ma@dt.e-technik.uni-dortmund.de]=20
Sent:=2030=20December=202004=2010:23
To:=20Hans=20Reiser
Cc:=20reiserfs-list@namesys.com;=20Stefan=20Traby
Subject:=20Re:=20Congratulations!=20we=20have=20got=20hash=20function=20sc=
rewed=20up

Hans=20Reiser=20<reiser@namesys.com>=20writes:

>>Again,=20this=20is=20a=20lame=20excuse=20for=20a=20bug.=20First=20you=20=
declare=20some=20
>>features=20on=20your=20filesystem,=20later,=20when=20it=20turns=20out=20=
that=20it=20isn't=20
>>being=20delivered,=20you=20act=20as=20if=20this=20were=20a=20known=20con=
dition.
>>
>=20Well=20this=20is=20true,=20you=20are=20right.=20=20Reiser4=20is=20the=20=
fix=20though.

No,=20it=20isn't.=20Reiser4=20is=20an=20alternative=20beast.=20Or=20will=20=
it=20transparently
"fix"=20the=20collision=20problem=20in=20a=203.5=20or=203.6=20file=20syste=
m,=20in=20a=20way=20that
is=20backwards=20compatible=20with=203.6=20drivers?=20If=20not,=20please=20=
fix=20reiser3.6.

Given=20that=20Reiser4=20isn't=20"proven"=20yet=20in=20the=20field=20(for=20=
that,=20it=20would
have=20to=20be=20used=20as=20the=20default=20file=20system=20by=20at=20lea=
st=20one=20major
distributor=20for=20at=20least=20a=20year),=20it=20is=20certainly=20not=20=
an=20option=20for
servers=20_yet_.

A=20file=20system=20that=20intransparently=20(i.=20e.=20not=20inode=20coun=
t=20or=20block
count)=20refuses=20to=20create=20a=20new=20file=20doesn't=20belong=20on=20=
_my_=20production
machines,=20which=20shall=20migrate=20away=20from=20reiserfs=20on=20the=20=
next=20suitable
occasion=20(such=20as=20upgrades).=20There's=20ext3fs,=20jfs,=20xfs,=20and=
=20in=202006=20or
2007,=20we'll=20talk=20about=20reiser4=20again.=20Yes,=20I=20am=20conserva=
tive=20WRT=20file
systems=20and=20storage.

--
Matthias=20Andree

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
